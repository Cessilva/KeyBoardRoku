function init()
    m.myNumerico=m.top.findNode("myNumerico")
    m.myAbecedario=m.top.findNode("myAbecedario")
    'm.AbecedarioAnexo=m.top.findNode("AbecedarioAnexo")
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

  sub OnChange()
  if m.top.quieroFocus then
    if m.top.elementFocused=0 then
      m.myAbecedario.setFocus(true)
    else if m.top.elementFocused=1 then
      m.myNumerico.setFocus(true)
    end if 
  end if 
  end sub 

  sub OnFocusedChild()
   ?"Eligieron un teclado, estoy en cotenedor alfanumerico"
  if m.top.elementFocused=0 then
    m.myNumerico.visible=false
    m.myAbecedario.visible=true
    m.top.abc=true
    m.myAbecedario.setFocus(true)
  else if m.top.elementFocused=1 then
    m.myNumerico.visible=true
    m.myAbecedario.visible=false
    m.top.abc=false
    m.myNumerico.setFocus(true)
  else if m.top.elementFocused=2 then
      m.top.contenido="borrar"
    else if m.top.elementFocused=3 then
      m.top.contenido="vaciar"
  end if 
  end sub


' function onKeyEvent(key as String, press as Boolean) as Boolean
'   handled = false
'   if (not press) then
'     if (key = "OK" ) then
        
'     else if (key = "down" ) then
'     ?"aqui"
'         if m.myAbecedario.hasFocus() then

'         m.AbecedarioAnexo.setFocus(true)
'         end if
'     else if (key="up") then 

' end if
'   end if
'   return handled
' end function