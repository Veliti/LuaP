local jsdoc = require("js").global.window.document

local input_pattern = jsdoc:querySelector("#input-pattern")
local input_text = jsdoc:querySelector("#input-text")
local text_highlighted = jsdoc:querySelector("#text-highlighted")

local inspect = function(t)
	for key, value in ipairs(t) do
		print(key, " -> ", value)
	end
end

local mark_wrap = function(s, classes)
	return string.format('<mark class="%s">%s</mark>', classes, s)
end

---@param text string
---@param pattern string
local highlight_lines = function(text, pattern)
	-- lua pattern moment need to wrap pattern in capture else it stop capturing xD
	pattern = "(" .. pattern .. ")"
	local result = text:gsub(pattern, function(...)
		local captures = { ... }
		---@type string
		local insertion = mark_wrap(captures[1], "highlight-primary")
		for index, value in ipairs(captures) do
			if index ~= 1 then
				insertion = insertion:gsub(value, mark_wrap(value, "highlight-secondary"), 1)
			end
		end
		return insertion
	end)
	return result
end

local update = function()
	local success, hl = pcall(highlight_lines, input_text.value, input_pattern.value)
	if success then
		text_highlighted.innerHTML = hl
	else
		text_highlighted.innerText = input_text.value
	end
end

local update_scroll = function()
	text_highlighted.scrollTop = input_text.scrollTop
end

input_pattern:addEventListener("input", update)

input_text:addEventListener("selectionchange", update)
input_text:addEventListener("scroll", update_scroll)

update()
