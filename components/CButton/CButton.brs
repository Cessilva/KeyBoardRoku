sub init()
    m.mainRectangle = m.top.findNode("mainRectangle")
    m.buttonText = m.top.findNode("buttonText")
    m.buttonIcon = m.top.findNode("buttonIcon")
    m.frame = m.top.findNode("frame")
    m.bg = m.top.findNode("bg")
end sub

sub onFocusChange()
    if m.top.focused then
        m.frame.visible = true
    else
        m.frame.visible = false
    end if
end sub

sub onButtonChange()
    bTRect = m.buttonText.boundingRect()
    'Para el rectangulo blanco
    m.frame.height = bTRect.height + 30
    m.frame.width = bTRect.width + 18
    'Para el contenido
    m.bg.height = bTRect.height + 24
    m.bg.width = bTRect.width + 12
    'centrarla
    centery = (m.frame.height - bTRect.height) / 2
    centerx = (m.frame.width - bTRect.width) / 2
    m.buttonText.translation = [centerx, centery]
end sub

sub onButtonSizeChange()
    m.buttonText.font.size = m.top.textSize
end sub

sub onButtonIconChange()
    m.frame.width = m.top.iconWidth + 18
    m.bg.width = m.top.iconWidth + 12
    centery = (m.frame.height - m.top.iconHeight) / 2
    centerx = (m.frame.width - m.top.iconWidth) / 2
    m.buttonIcon.translation = [centerx, centery]
end sub