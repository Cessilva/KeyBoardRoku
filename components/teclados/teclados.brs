  function init()
  m.top.observeField("focusedChild", "OnFocusedChild")

  m.myRectangle=m.top.findNode("myRectangle")
  m.myControllerKeyboard=m.top.findNode("myControllerKeyboard")

  bTRect=m.myRectangle.boundingRect()
  m.top.heightComponent=bTRect.height

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
          m.top.botonEscogido=0
          ? "Escogi el teclado alfabetico"
      else if m.myControllerKeyboard.currentFocus=1 then
          m.top.botonEscogido=1
          ? "Escogi el teclado numerico"
      else if m.myControllerKeyboard.currentFocus=2 then
        m.top.botonEscogido=2
        ? "Escogi el boton borrar"
      else if m.myControllerKeyboard.currentFocus=3 then
          m.top.botonEscogido=3
          ? "Escogi el boton vaciar"
      end if
    end if
  end if
  return handled
end function
