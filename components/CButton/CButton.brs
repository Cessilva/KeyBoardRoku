sub init()
    m.mainRectangle = m.top.findNode("mainRectangle")
    m.buttonText = m.top.findNode("buttonText")
    m.buttonIcon = m.top.findNode("buttonIcon")
    m.frame = m.top.findNode("frame")
    m.bg = m.top.findNode("bg")

end sub


sub onFrameChange()
m.frame.width=m.top.frameWidth
m.bg.width=m.top.frameWidth-6
m.buttonText.width=m.bg.width

m.frame.height=m.top.frameHeight
m.bg.height=m.top.frameHeight-6
m.buttonText.height=m.frame.height

end sub

sub onFocusChange()
    if m.top.focused then
        m.frame.color = "#77b3d9"
    else
        m.frame.color=m.top.focusColorOriginal
    end if
end sub

sub onCentredChange()
if m.top.leftCentred=true then 
    m.buttonText.horizAlign="left"
else 
    m.buttonText.horizAlign="center"
endif 
end sub


sub onButtonSizeChange()
    m.buttonText.font.size = m.top.textSize
end sub

