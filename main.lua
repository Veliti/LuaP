local jsdoc = require("js").global.window.document

local input_pattern = jsdoc:querySelector("#input-pattern")
local input_text = jsdoc:querySelector("#input-text")
local text_highlighted = jsdoc:querySelector("#text-highlighted")

local mark_wrap = function(s, classes)
	return string.format('<mark class="%s">%s</mark>', classes, s)
end

---@param text string
---@param pattern string
local highlight_lines = function(text, pattern)
	local needle = 1
	local matches = {}
	while true do
		local find_res = { text:find(pattern, needle) }
		local match_start, match_end = find_res[1], find_res[2]
		print(#find_res, match_start, match_end)
		if #find_res == 0 or match_start > match_end then
			break
		end

		local captures = { table.unpack(find_res, 3, #find_res) }
		local match = text:sub(match_start, match_end)
		for _, value in ipairs(captures) do
			match = match:gsub(value, mark_wrap(value, "highlight-secondary"), 1)
		end

		table.insert(matches, mark_wrap(match, "highlight-primary"))
		text = text:gsub(text:sub(match_start, match_end), "%%s", 1)
		needle = match_start + 2
	end

	print(text)
	return text:format(table.unpack(matches))
end

local update = function()
	local success, hl = pcall(highlight_lines, input_text.value, input_pattern.value)
	if success then
		text_highlighted.innerHTML = hl
	else
		print(hl)
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
