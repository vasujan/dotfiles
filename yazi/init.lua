
function Status:name()
	local h = cx.active.current.hovered
	if not h then
		return ui.Span("")
	end

 	local linked = ""
 	if h.link_to ~= nil then
 		linked = " -> " .. tostring(h.link_to)
 	end
 	return ui.Span(" " .. h.name .. linked)
end


function Status:render(area)
	self.area = area

	local left = ui.Line { self:mode(), self:size(), self:name() }
	local right = ui.Line { self:permissions(), self:position() }
	local right = ui.Line { self:permissions(), self:percentage(), self:position() }
	return {
		ui.Paragraph(area, { left }),
		ui.Paragraph(area, { right }):align(ui.Paragraph.RIGHT),
		table.unpack(Progress:render(area, right:width())),
	}
end


-- require("starship"):setup()

