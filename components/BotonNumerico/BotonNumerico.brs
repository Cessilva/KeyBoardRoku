sub init()
    m.buttonText = m.top.findNode("buttonText")
    m.buttonText.font.size="16"
    m.buttonIcon = m.top.findNode("buttonIcon")
    m.mainRectangle = m.top.findNode("mainRectangle")
    m.frame = m.top.findNode("frame")
    m.bg = m.top.findNode("bg")
    centery = (m.frame.height-m.buttonIcon.height) / 2
    centerx = (m.frame.width-m.buttonIcon.width) / 2
    m.buttonIcon.translation = [centerx, centery]
end sub

sub showcontent()
  itemcontent = m.top.itemContent
  m.buttonIcon.uri = itemcontent.SDPosterUrl
  m.buttonText.text= itemcontent.title
end sub

sub onFocusChange()
    ?"onFocusChange"
    if m.top.itemHasFocus then
        m.frame.color = "#77b3d9"
    else
        m.frame.color = "#333333"
    end if
end sub