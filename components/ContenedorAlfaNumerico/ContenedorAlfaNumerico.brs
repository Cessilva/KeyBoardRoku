function init()
    m.myNumerico=m.top.findNode("myNumerico")
    m.myAbecedario=m.top.findNode("myAbecedario")
    m.myNumerico.visible=false
    m.myAbecedario.visible=true

    m.myNumerico.observeField("numero","actualizaContenidoNumero")
    m.myAbecedario.observeField("letra","actualizaContenidoLetra")
  end function

  sub actualizaContenidoNumero()
    m.top.contenido=m.myNumerico.numero
  end sub
   sub actualizaContenidoLetra()
    m.top.contenido=m.myAbecedario.letra
  end sub

  sub OnFocusedChild()
   ?"Eligieron un teclado, estoy en cotenedor alfanumerico"
  if m.top.elementFocused=0 then
    m.myNumerico.visible=false
    m.myAbecedario.visible=true
    m.myAbecedario.setFocus(true)
    'm.myAbecedario.widthAbecedario=m.top.widthComponent
  else if m.top.elementFocused=1 then
    m.myNumerico.visible=true
    m.myAbecedario.visible=false
    m.myNumerico.setFocus(true)
  end if 
  end sub
