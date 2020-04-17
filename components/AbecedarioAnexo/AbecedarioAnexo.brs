function init()
    m.top.observeField("focusedChild", "OnFocusedChild")
    m.LayoutGroupCaracteres=m.top.findNode("LayoutGroupCaracteres")
    m.LayoutGroupCorreo=m.top.findNode("LayoutGroupCorreo")
    
    m.com=m.top.findNode("com")
    m.net=m.top.findNode("net")
    m.gmail=m.top.findNode("gmail")
    m.hotmail=m.top.findNode("hotmail")

    m.guion_bajo=m.top.findNode("guion_bajo")
    m.guion_medio=m.top.findNode("guion_medio")
    m.espacio=m.top.findNode("espacio")
    m.punto=m.top.findNode("punto")
    m.mas=m.top.findNode("mas")

    'm.focusArray = [m.com,m.net, m.gmail, m.hotmail]
    m.focusArray=[m.guion_bajo,m.guion_medio,m.espacio,m.punto,m.mas]
    m.top.currentFocus = 0
end function

sub onFocusedChild()
    if m.top.isInFocusChain() and not m.focusArray[m.top.currentFocus].hasFocus() then
        m.focusArray[m.top.currentFocus].focused = true
    else
        m.focusArray[m.top.currentFocus].focused = false
    end if
end sub

function onKeyEvent(key as String, press as Boolean) as Boolean
handled = false
if (not press) then
    if (key = "OK" ) then
         if m.top.currentFocus=0 then 
            m.top.caracter="_"
        else if m.top.currentFocus=1 then
            m.top.caracter="-"
        else if m.top.currentFocus=2 then
            m.top.caracter=" "
        else if m.top.currentFocus=3 then
            m.top.caracter="."
        else if m.top.currentFocus=4 then
            m.top.caracter="+"
        end if 
    else  if (key = "left") then
            if m.top.currentFocus <> 0 then
                m.focusArray[m.top.currentFocus].focused = false
                m.top.currentFocus --
                m.focusArray[m.top.currentFocus].focused = true
            end if
        else if key = "right" then
        ?"derecha"
            if m.top.currentFocus <> 4 then
                m.focusArray[m.top.currentFocus].focused = false
                m.top.currentFocus ++
                m.focusArray[m.top.currentFocus].focused = true
            end if
    end if
end if
return handled
end function
