  function init()
  m.top.observeField("focusedChild", "OnFocusedChild")

  m.myRectangle=m.top.findNode("myRectangle")
  m.myControllerKeyboard=m.top.findNode("myControllerKeyboard")
  m.myContenedorAlfaNumerico=m.top.findNode("myContenedorAlfaNumerico")

  bTRect=m.myRectangle.boundingRect()
  m.top.heightComponent=bTRect.height

  'm.myControllerKeyboard.tieneFocus=true
  end function

  sub onFocusedChild()
    if m.top.isInFocusChain() and not m.myControllerKeyboard.hasFocus() then
        m.myControllerKeyboard.setFocus(true)
    end if
end sub

  function onKeyEvent(key as String, press as Boolean) as Boolean
  handled = false

  if press then
    if (key = "OK" ) then
    ? "Voy a escoger mi teclado"
      if  m.myControllerKeyboard.currentFocus=0 then
          m.myContenedorAlfaNumerico.elementFocused=0
      else if m.myControllerKeyboard.currentFocus=1 then
          m.myContenedorAlfaNumerico.elementFocused=1
      end if

    else if (key="down" )then 
    ? "Voy a ir al teclado que elegi"
            m.myContenedorAlfaNumerico.setFocus(true)
            m.myControllerKeyboard.setFocus(false)
            'm.myControllerKeyboard.tieneFocus=false
    else if (key="up")then 
    ? "Voy a regresar a elegir teclado"
          'm.myControllerKeyboard.tieneFocus=true
          m.myControllerKeyboard.setFocus(true)
          m.myContenedorAlfaNumerico.setFocus(false)
         
    end if
  end if
  return handled
end function
