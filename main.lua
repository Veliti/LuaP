local jsdoc = require("js").global.window.document

local inspect = function(t)
	for key, value in pairs(t) do
		print(key, " -> ", value)
	end
end

local span_wrap = function(s, classes)
	return string.format('<span class="%s">%s</span>', classes, s)
end

local highlight_lines = function(text)
	-- aa
end

local pattern = jsdoc:querySelector("#input-pattern")
local text = jsdoc:querySelector("#input-text")
local text_highlighted = jsdoc:querySelector("#text-highlighted")

local update = function()
	text_highlighted.innerText = text.value
end

text:addEventListener("input", function(element, event)
	update()
end)
