function init()
    m.top.observeField("focusedChild", "OnFocusedChild")
    m.myIniciar=m.top.findNode("myIniciar")
    m.myIngresa=m.top.findNode("myIngresa")
    m.myRectangle=m.top.findNode("myRectangle")
    m.myInput=m.top.findNode("myInput")
    m.mySiguiente=m.top.findNode("mySiguiente")
    m.myCancelar=m.top.findNode("myCancelar")
    
    m.myIniciar.font.size=40

    bTRect=m.myRectangle.boundingRect()
    m.top.heightComponent=bTRect.height

    m.focusArray = [m.myInput, m.mySiguiente, m.myCancelar]
    m.top.currentFocus = 0
end function

  function sizeComponent()
  m.myIniciar.width=m.top.widthComponent
  m.myIngresa.width=m.top.widthComponent

  m.myInput.frameWidth=m.top.widthComponent
  m.mySiguiente.frameWidth=m.top.widthComponent
  m.myCancelar.frameWidth=m.top.widthComponent
  end function

sub onFocusedChild()
    if m.top.isInFocusChain() and not m.focusArray[m.top.currentFocus].hasFocus() then
        m.focusArray[m.top.currentFocus].focused = true
    end if
end sub

function onKeyEvent(key as string, press as boolean) as boolean
    if press then
        if key = "up" then
        ? "Voy hacia arriba de iniciar sesion"
            if m.top.currentFocus <> 0 then
                m.focusArray[m.top.currentFocus].focused = false
                m.top.currentFocus --
                m.focusArray[m.top.currentFocus].focused = true
            end if
            ' return true
        else if key = "down" then
        ? "Voy hacia abajo de iniciar sesion"
            if m.top.currentFocus <> 2 then
                m.focusArray[m.top.currentFocus].focused = false
                m.top.currentFocus ++
                m.focusArray[m.top.currentFocus].focused = true
            end if
            ' return true
        else if key = "left" then
        ? "Voy hacia teclados y apago mi foco"
            m.focusArray[m.top.currentFocus].focused = false
            'return false
        end if
    end if
    return false
end function