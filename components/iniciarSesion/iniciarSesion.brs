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

sub cambiaContenidoInput()
    if m.myInput.text="  Correo Electronico" then
        m.myInput.text=""
    else 
        m.myInput.text=m.myInput.text+m.top.contentInput
    end if 
end sub

function onKeyEvent(key as string, press as boolean) as boolean
    if press then
        if key = "up" then
            if m.top.currentFocus <> 0 then
                m.focusArray[m.top.currentFocus].focused = false
                m.top.currentFocus --
                m.focusArray[m.top.currentFocus].focused = true
            end if
        else if key = "down" then
            if m.top.currentFocus <> 2 then
                m.focusArray[m.top.currentFocus].focused = false
                m.top.currentFocus ++
                m.focusArray[m.top.currentFocus].focused = true
            end if
        else if key = "left" then
            m.focusArray[m.top.currentFocus].focused = false
        end if
    end if
    return false
end function