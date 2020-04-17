  function init()
  '1280 x 720 HD 
  'Declaracion de variables
   m.top.backgroundURI = "pkg:/images/negro.png"
    m.teclados=m.top.findNode("teclados")
    m.iniciarSesion=m.top.findNode("iniciarSesion")
    m.myContenedorAlfaNumerico=m.top.findNode("myContenedorAlfaNumerico")
    m.AbecedarioAnexo=m.top.findNode("AbecedarioAnexo")

    m.LayoutGroup=m.top.findNode("LayoutGroup")
    m.myRectangle=m.top.findNode("myRectangle")
    m.myRectangle2=m.top.findNode("myRectangle2")

    bTRect=m.LayoutGroup.boundingRect()
    centerx = (1280 - bTRect.width) / 2
    m.LayoutGroup.translation = [centerx, 120]

    m.teclados.widthComponent=m.myRectangle.width
    m.myContenedorAlfaNumerico.widthComponent=m.myRectangle.width
    m.myRectangle.height=m.teclados.heightComponent
    m.iniciarSesion.widthComponent=m.myRectangle2.width
    m.myRectangle2.height=m.iniciarSesion.heightComponent
    
    
    m.teclados.observeField("botonEscogido", "ButtonSelected")
    'm.myContenedorAlfaNumerico.observeField("contenido", "actualizaContenido")
    m.AbecedarioAnexo.observeField("caracter","actualizaContenidoContenedorAlfaNumerico")
    m.myContenedorAlfaNumerico.observeField("abc","visible")
    m.iniciarSesion.setFocus(true)
  end function
  
'Establece el teclado numerico o alfabetico
  sub ButtonSelected()
    m.myContenedorAlfaNumerico.elementFocused=m.teclados.botonEscogido
    print"soY EL BOTON ESCOGIDO EN EN EL MAIN"
    PRINT m.myContenedorAlfaNumerico.elementFocused
  end sub 

sub actualizaContenidoContenedorAlfaNumerico()
m.myContenedorAlfaNumerico.contenido=m.AbecedarioAnexo.caracter
end sub

'Rellena el input de iniciarSesion
  sub actualizaContenido()
    m.iniciarSesion.contentInput=m.myContenedorAlfaNumerico.contenido
    ?"Actualizando contenido de inicia sesion"
    print m.iniciarSesion.contentInput
  end sub 

sub visible()
m.AbecedarioAnexo.visible=m.myContenedorAlfaNumerico.abc
end sub 

  function onKeyEvent(key as String, press as Boolean) as Boolean
  handled = false
  if press then
    if (key = "left" ) then
        ? "Voy a teclados"
        if not m.AbecedarioAnexo.hasFocus()then
               m.teclados.setFocus(true)
        end if 
      
    else if (key = "right" ) then
        if not m.teclados.hasFocus() or not m.myContenedorAlfaNumerico.hasFocus()  then
            ? "Voy a iniciar Sesion"
            if not m.AbecedarioAnexo.hasFocus()then
              m.iniciarSesion.setFocus(true)
            end if 
        end if
    else if (key = "down" ) then
        if m.teclados.isInFocusChain() then
        ? "Voy a AlfaNumericoNumerico"
          m.myContenedorAlfaNumerico.setFocus(true)
          m.myContenedorAlfaNumerico.quieroFocus=true
        else if m.myContenedorAlfaNumerico.isInFocusChain()then
        ? "Voy a AbecedarioAnexo"
          m.AbecedarioAnexo.setFocus(true)
          m.myContenedorAlfaNumerico.quieroFocus=false
        end if
        
    else if (key = "up" ) then
        if m.myContenedorAlfaNumerico.isInFocusChain() then
        ? "Voy a teclados despues de haber ido a numerico"
          m.teclados.setFocus(true)
          m.myContenedorAlfaNumerico.quieroFocus=false
        else if m.AbecedarioAnexo.isInFocusChain() then
        ? "Voy alfanumerico despues de haber ido a abecedario anexo"
          m.myContenedorAlfaNumerico.setFocus(true)
          m.myContenedorAlfaNumerico.quieroFocus=true
        end if     
    end if
  end if
  return handled
end function

  