  function init()
  m.myRectangle=m.top.findNode("myRectangle")
  m.myControllerKeyboard=m.top.findNode("myControllerKeyboard")
  m.myAbecedario=m.top.findNode("myAbecedario")
  m.myNumerico=m.top.findNode("myNumerico")
  m.myAbecedario.visible=true
  m.myNumerico.visible=false

  bTRect=m.myRectangle.boundingRect()
  m.top.heightComponent=bTRect.height
  m.myControllerKeyboard.setFocus(true)
  end function

  function asignaFocus()
  m.myControllerKeyboard.setFocus(true)
  end function

  function onKeyEvent(key as String, press as Boolean) as Boolean
  handled = false
  print press
  if press then
    if (key = "OK" ) then
      if  m.myControllerKeyboard.currentFocus=0 then
       m.myAbecedario.visible=true
       m.myNumerico.visible=false
      else if m.myControllerKeyboard.currentFocus=1 then
        m.myAbecedario.visible=false
        m.myNumerico.visible=true
      end if
    else if (key ="down")
      if  m.myControllerKeyboard.currentFocus=0 then
       m.myAbecedario.setFocus(true)
      else if m.myControllerKeyboard.currentFocus=1 then
        m.myNumerico.setFocus(true)
      end if
    else if (key="up" or key="left" ) then 
       m.myControllerKeyboard.setFocus(true)
    end if
  end if
  return handled
end function
