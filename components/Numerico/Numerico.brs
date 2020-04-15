function init()
    m.myRowList=m.top.findNode("myRowList")
    bRect=m.myRowList.boundingRect()
    m.myRowList.translation=[(300-bRect.width)/2,0]
    udt=[
      {Title:"1"
      SDPosterUrl:"pkg:/images/transparente.png"
      }
      {Title:"2"
      SDPosterUrl:"pkg:/images/transparente.png"
      }
      {Title:"3"
      SDPosterUrl:"pkg:/images/transparente.png"
      }
      ]
    ccs=[
      {Title:"4"
      SDPosterUrl:"pkg:/images/transparente.png"
      }
      {Title:"5"
      SDPosterUrl:"pkg:/images/transparente.png"
      }
      {Title:"6"
      SDPosterUrl:"pkg:/images/transparente.png"
      }
      ]
    son=[
      {Title:"7"
      SDPosterUrl:"pkg:/images/transparente.png"
      }
      {Title:"8"
      SDPosterUrl:"pkg:/images/transparente.png"
      }
      {Title:"9"
      SDPosterUrl:"pkg:/images/transparente.png"
      }
      ]
    cb=[
      {Title:"0"
      SDPosterUrl:"pkg:/images/transparente.png"
      }
      {Title:"Borrar"
      SDPosterUrl:"pkg:/images/transparente.png"
      }
      ]
    lista= [
        {
            Title: "Uno a tres"
            ContentList: udt
        }
        {
            Title: "Tres a Cinco"
            ContentList: ccs
        }
        {
            Title: "Seis a nueve"
            ContentList: son
        }
        {
            Title: "Cero y borrar"
            ContentList: cb
        }
    ]
    content = parseContent(lista)
    m.myRowList.content= content
    m.top.observeField("focusedChild","OnFocusedChildChange")
end function

sub OnFocusedChildChange()
    ? "[GridScreen] >> OnFocusedChildChangeNumerico"
    if m.top.isInFocusChain() and not m.myRowList.hasFocus() then
        m.myRowList.setFocus(true)
    end if
end sub

sub OnItemFocused()
    itemFocused = m.top.itemFocused
    'print m.myRowList.content.getChild(itemFocused[0]).getChild(itemFocused[1])
    if itemFocused.count() = 2 then
        focusedContent = m.myRowList.content.getChild(itemFocused[0]).getChild(itemFocused[1])
        if focusedContent <> invalid then
            m.top.focusedContent = focusedContent
        end if
    end if
end sub

function parseContent(list As Object)
    ContentNode_object = createObject("RoSGNode","ContentNode")
    for each objeto in list
        ContentNode_object_child = createObject("RoSGNode","ContentNode")
        ContentNode_object_child.Title=objeto.Title
        for each arreglo in objeto.ContentList
                elemento=createObject("RoSGNode","ContentNode")
                elemento.setFields(arreglo)
                ContentNode_object_child.appendChild(elemento)
        end for
        ContentNode_object.appendChild(ContentNode_object_child)
    end for
    return ContentNode_object
end function

  function onKeyEvent(key as String, press as Boolean) as Boolean
  handled = false
  print "soy el press de Numerico"
  print press
  if (not press) then
    if (key = "OK" ) then
        ?"Estoy en el ok de teclado numerico "
       
       if m.top.focusedContent.title="Borrar" then 
       m.top.numero="borrar"
       else
       m.top.numero=m.top.focusedContent.title
       end if
    end if
  end if
  return handled
end function
