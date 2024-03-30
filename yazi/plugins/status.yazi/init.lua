function Status:datetime()
  local time = ""
	local h = cx.active.current.hovered
	if h == nil then
		return ui.Line {}
  else
    time = h.cha.modified // 1
    if time and os.date("%Y", time) == year then
      time = os.date("%b %d  %Y", time)
    else
      time = time and os.date("%b %d %H:%M", time) or ""
    end
 	end

	return ui.Line {
		ui.Span(" "),
    ui.Span(time),
		ui.Span(" "),
	}
end

function Status:owner()
	local h = cx.active.current.hovered
	if h == nil or ya.target_family() ~= "unix" then
		return ui.Line {}
	end

	return ui.Line {
		ui.Span(ya.user_name(h.cha.uid) or tostring(h.cha.uid)):fg("magenta"),
		ui.Span(":"),
		ui.Span(ya.group_name(h.cha.gid) or tostring(h.cha.gid)):fg("magenta"),
		ui.Span(" "),
	}
end

function Status:render(area)
	self.area = area

	local left = ui.Line { self:mode(), self:size(), self:datetime()}
  local right = ui.Line {  self:owner(), self:permissions(), self:percentage(), self:position() }
	return {
		ui.Paragraph(area, { left }),
		ui.Paragraph(area, { right }):align(ui.Paragraph.RIGHT),
		table.unpack(Progress:render(area, right:width())),
	}
end
