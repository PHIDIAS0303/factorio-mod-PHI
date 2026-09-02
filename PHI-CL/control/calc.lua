local main = {}

function main.toggle(event)
    if event.prototype_name ~= 'phi-cl-toggle-calc' then
        return
    end

    local player = game.players[event.player_index]
    player.gui.screen['phi_cl_calc'].visible = not player.gui.screen['phi_cl_calc'].visible
    player.set_shortcut_toggled('phi-cl-toggle-calc', player.gui.screen['phi_cl_calc'].visible)
end

function main.create(player)
    local frame = player.gui.screen.add({type = 'frame', name = 'phi_cl_calc', direction = 'vertical'})
    frame.auto_center = true

    local main_input = frame.add{type = 'textfield', name = 'phi_cl_calc_textfield', style = 'console_input_textfield'}
    main_input.style.width = 320

    local result_output = frame.add({type = 'label', name = 'phi_cl_calc_result', caption = '', style = 'heading_2_label'})
    result_output.style.horizontal_align = 'right'

    frame.add({type = 'label', name = 'phi_cl_calc_label_1', caption = '', style = 'heading_2_label'})

    local scroll_pane = frame.add{type = 'scroll-pane', style = 'scroll_pane_under_subheader', name = 'phi_cl_calc_scroll_pane', direction = 'vertical', horizontal_scroll_policy = 'never', vertical_scroll_policy = 'auto'}
    local table = scroll_pane.add{type = 'table', style = 'table', name = 'phi_cl_calc_table', column_count = 4}

    for _, v in ipairs({'A', 'B', 'C', 'D'}) do
        table.add({type = 'label', name = 'phi_cl_calc_memory_name_' .. v, caption = v, style = 'heading_2_label'})
        local textfield = table.add{type = 'textfield', name = 'phi_cl_calc_memory_value_' .. v, style = 'console_input_textfield'}
        textfield.style.width = 150
        textfield.style.horizontal_align = 'right'
    end
end

local calc_function = setmetatable({
    ln = math.log,
    log = function(x, b) return math.log(x, b or 10) end,
    round = function(x) return x >= 0 and math.floor(x + 0.5) or math.ceil(x - 0.5) end,
    trunc = function(x) return (math.modf(x)) end,
    sign = function(x) return x > 0 and 1 or (x < 0 and -1 or 0) end,
    pi = function(_) return math.pi end,
}, {
    __index = math
})

local calc_function_operation = {
    ['+'] = {1, function(a, b) return a + b end},
    ['-'] = {1, function(a, b) return a - b end},
    ['*'] = {2, function(a, b) return a * b end},
    ['/'] = {2, function(a, b) if b == 0 then error({'phi-cl.combine', {'calc.error'}, {'calc.div_zero'}}, 0) end return a / b end},
    ['%'] = {2, function(a, b) if b == 0 then error({'phi-cl.combine', {'calc.error'}, {'calc.mod_zero'}}, 0) end return a % b end},
}

local calc_si_suffix = {
    k = 1e3,
    m = 1e6,
    g = 1e9,
    t = 1e12,
    p = 1e15
}

local calc_number_base = {
    x = {value = 16, digits = '%x'},
    b = {value = 2, digits = '[01]'},
    o = {value = 8, digits = '[0-7]'},
}

function main.parse(expression)
    local cursor = 1

    local function skip_space()
        while expression:sub(cursor, cursor) == ' ' do
            cursor = cursor + 1
        end
    end

    local function factorial(n)
        if n < 0 then
            return error({'phi-cl.combine', {'calc.error'}, {'calc.factorial_neg', n}}, 0)

        elseif n > 170 then
            return error({'phi-cl.combine', {'calc.error'}, {'calc.factorial_large', n}}, 0)
        end

        if n ~= math.floor(n) then
            return error({'phi-cl.combine', {'calc.error'}, {'calc.factorial_int', n}}, 0)
        end

        local result = 1

        for i = 2, n do
            result = result * i
        end

        return result
    end

    local parse_expr

    local function parse_atom()
        skip_space()
        local character = expression:sub(cursor, cursor)

        if character == '|' then
            cursor = cursor + 1
            local value = parse_expr(1)
            skip_space()

            if expression:sub(cursor, cursor) ~= '|' then
                return error({'phi-cl.combine', {'calc.error'}, {'calc.expected_bar'}}, 0)
            end

            cursor = cursor + 1
            return math.abs(value)

        elseif character == '(' then
            cursor = cursor + 1
            local value = parse_expr(1)
            skip_space()

            if expression:sub(cursor, cursor) ~= ')' then
                return error({'phi-cl.combine', {'calc.error'}, {'calc.expected_paren'}}, 0)
            end

            cursor = cursor + 1
            return value

        elseif character == '' then
            return error({'phi-cl.combine', {'calc.error'}, {'calc.unexpected_end'}}, 0)

        elseif character:match('%a') then
            skip_space()
            local start = cursor

            while expression:sub(cursor, cursor):match('%w') do
                cursor = cursor + 1
            end

            local name = expression:sub(start, cursor - 1)
            local fn = calc_function[name]
            skip_space()

            if expression:sub(cursor, cursor) == '(' then
                if not fn then
                    return error({'phi-cl.combine', {'calc.error'}, {'calc.unknown_fn'}}, 0)
                end

                cursor = cursor + 1
                local argument = parse_expr(1)
                skip_space()

                if expression:sub(cursor, cursor) ~= ')' then
                    return error({'phi-cl.combine', {'calc.error'}, {'calc.expected_paren'}}, 0)
                end

                cursor = cursor + 1
                return fn(argument)
            end

            if fn then
                return error({'phi-cl.combine', {'calc.error'}, {'calc.expected_open', name}}, 0)
            end

            return error({'phi-cl.combine', {'calc.error'}, {'calc.unknown_id', name}}, 0)

        else
            skip_space()

            if expression:sub(cursor, cursor) == '0' then
                local base = calc_number_base[expression:sub(cursor + 1, cursor + 1):lower()]
                if base then
                    local literal_start = cursor
                    cursor = cursor + 2
                    local digit_start = cursor

                    while expression:sub(cursor, cursor):match(base.digits) do
                        cursor = cursor + 1
                    end

                    if cursor == digit_start or expression:sub(cursor, cursor):match('%w') then
                        while expression:sub(cursor, cursor):match('%w') do
                            cursor = cursor + 1
                        end

                        return error({'phi-cl.combine', {'calc.error'}, {'calc.invalid_num', expression:sub(literal_start, cursor - 1)}}, 0)
                    end

                    return tonumber(expression:sub(digit_start, cursor - 1), base.value)
                end
            end

            local literal = expression:match('^(%d+%.?%d*[eE][%+%-]?%d+)', cursor) or expression:match('^(%d+%.?%d*)', cursor)

            if not literal then
                return error({'phi-cl.combine', {'calc.error'}, {'calc.expected_num'}}, 0)
            end

            cursor = cursor + literal:len()
            local num = tonumber(literal)

            if not num then
                return error({'phi-cl.combine', {'calc.error'}, {'calc.invalid_num', literal}}, 0)
            end

            return num
        end
    end

    local function parse_factor()
        skip_space()

        if expression:sub(cursor, cursor) == '-' then
            cursor = cursor + 1
            return -parse_factor()

        elseif expression:sub(cursor, cursor) == '+' then
            cursor = cursor + 1
            return parse_factor()
        end

        local base = parse_atom()
        skip_space()
        local suffix = calc_si_suffix[expression:sub(cursor, cursor)]

        if suffix then
            cursor = cursor + 1
            base = base * suffix
        end

        skip_space()

        if expression:sub(cursor, cursor) == '!' then
            cursor = cursor + 1
            base = factorial(base)
        end

        skip_space()

        if expression:sub(cursor, cursor + 1) == '**' then
            cursor = cursor + 2
            return base ^ parse_factor()

        elseif expression:sub(cursor, cursor) == '^' then
            cursor = cursor + 1
            return base ^ parse_factor()
        end

        return base
    end

    parse_expr = function(min_prec)
        local lhs = parse_factor()

        while true do
            skip_space()
            local entry = calc_function_operation[expression:sub(cursor, cursor)]

            if not entry or entry[1] < min_prec then
                break
            end

            cursor = cursor + 1
            lhs = entry[2](lhs, parse_expr(entry[1] + 1))
        end

        return lhs
    end

    local ok, result = pcall(function()
        local value = parse_expr(1)
        skip_space()

        if cursor <= #expression then
            error({'phi-cl.combine', {'calc.error'}, {'calc.trailing', expression:sub(cursor, expression:len())}}, 0)
        end

        return value
    end)

    return ok and result or (type(result) == 'table' and result or {'calc.error', tostring(result)})
end

function main.change(event)
    if event.element.name ~= 'phi_cl_calc_textfield' then
        return
    end

    event.element.parent['phi_cl_calc_result'].caption = event.text == '' and '' or main.parse(event.text:lower())
end

return main
