  function init()
  '1280 x 720 HD 
  'Declaracion de variables
    m.LayoutGroup=m.top.findNode("LayoutGroup")
    m.teclados=m.top.findNode("teclados")
    m.iniciarSesion=m.top.findNode("iniciarSesion")
    m.myRectangle=m.top.findNode("myRectangle")
    m.myRectangle2=m.top.findNode("myRectangle2")

    bTRect=m.LayoutGroup.boundingRect()
    centerx = (1280 - bTRect.width) / 2
    m.LayoutGroup.translation = [centerx, 120]

    m.teclados.widthComponent=m.myRectangle.width
    m.myRectangle.height=m.teclados.heightComponent
    m.iniciarSesion.widthComponent=m.myRectangle2.width
    m.myRectangle2.height=m.iniciarSesion.heightComponent

    m.iniciarSesion.setFocus(true)
  end function

  function onKeyEvent(key as String, press as Boolean) as Boolean
  handled = false
  if press then
    if (key = "left" ) then
        ? "Voy a teclados"
       m.teclados.setFocus(true)
       m.iniciarSesion.setFocus(false)
    else if (key = "right" ) then
        ? "Voy a iniciar Sesion"
          m.iniciarSesion.setFocus(true)
          m.teclados.setFocus(false)
          'handled=true
    end if
  end if
  return handled
end function

  