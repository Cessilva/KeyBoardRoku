  function init()
  m.top.observeField("focusedChild", "OnFocusedChild")

  m.myRectangle=m.top.findNode("myRectangle")
  m.myControllerKeyboard=m.top.findNode("myControllerKeyboard")
  m.myAbecedario=m.top.findNode("myAbecedario")
  m.myNumerico=m.top.findNode("myNumerico")
  m.myAbecedario.visible=true
  m.myNumerico.visible=false

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
  print press
  if press then
    if (key = "OK" ) then
      if  m.myControllerKeyboard.currentFocus=0 then
      m.myControllerKeyboard.setFocus(false)
      m.myAbecedario.setFocus(true)
       m.myAbecedario.visible=true
       m.myNumerico.visible=false
      else if m.myControllerKeyboard.currentFocus=1 then
        m.myAbecedario.visible=false
        m.myNumerico.visible=true
        m.myNumerico.setFocus(true)
        m.myControllerKeyboard.setFocus(false)
      end if
    else if (key ="down")
      if  (m.myControllerKeyboard.currentFocus=0 and (not m.myAbecedario.hasFocus())) then
       m.myAbecedario.setFocus(true)
      else if (m.myControllerKeyboard.currentFocus=1 and (not m.myNumerico.hasFocus())) then
        m.myNumerico.setFocus(true)
      end if
    end if
  end if
  return handled
end function
