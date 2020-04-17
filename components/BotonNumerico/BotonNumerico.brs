sub init()
    m.buttonText = m.top.findNode("buttonText")
    m.buttonText.font.size="16"
    m.buttonIcon = m.top.findNode("buttonIcon")
    m.mainRectangle = m.top.findNode("mainRectangle")
    m.frame = m.top.findNode("frame")
    m.bg = m.top.findNode("bg")

    centery = (m.frame.height-m.buttonIcon.height) / 2
    centerx = (m.frame.width-m.buttonIcon.width) / 2
    m.buttonIcon.translation = [centerx+25, centery]
end sub

sub showcontent()
  itemcontent = m.top.itemContent
  if itemcontent.title="Borrar" then
  m.buttonIcon.uri = itemcontent.SDPosterUrl
  m.buttonText.text= itemcontent.title
  m.buttonText.visible=false
  else
  m.buttonIcon.uri = itemcontent.SDPosterUrl
  m.buttonText.text= itemcontent.title
  m.buttonText.visible=true
  end if
end sub

sub onWidthChange()
  width = m.top.width
  m.buttonText.width= width
  m.mainRectangle.width=width
  m.frame.width=width
  m.bg.width=width-6
end sub

sub onFocusChange()
    ?"onFocusChangeBotonNumerico"
    if m.top.itemHasFocus then
        m.frame.color = "#77b3d9"
    else
        m.frame.color = "#333333"
    end if
end sub