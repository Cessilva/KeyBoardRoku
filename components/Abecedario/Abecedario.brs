function init()
    m.myRowList=m.top.findNode("myRowList")
    m.AbecedarioAnexo=m.top.findNode("AbecedarioAnexo")
    qp=[
      {Title:"q"
      TitleSeason:"Q"
      SDPosterUrl:"pkg:/images/transparente.png"
      }
      {Title:"w"
      TitleSeason:"W"
      SDPosterUrl:"pkg:/images/transparente.png"
      }
      {Title:"e"
      TitleSeason:"E"
      SDPosterUrl:"pkg:/images/transparente.png"
      }
      {Title:"r"
      TitleSeason:"R"
      SDPosterUrl:"pkg:/images/transparente.png"
      }
      {Title:"t"
      TitleSeason:"T"
      SDPosterUrl:"pkg:/images/transparente.png"
      }
      {Title:"y"
      TitleSeason:"Y"
      SDPosterUrl:"pkg:/images/transparente.png"
      }
      {Title:"u"
      TitleSeason:"U"
      SDPosterUrl:"pkg:/images/transparente.png"
      }
      {Title:"i"
      TitleSeason:"I"
      SDPosterUrl:"pkg:/images/transparente.png"
      }
      {Title:"o"
      TitleSeason:"O"
      SDPosterUrl:"pkg:/images/transparente.png"
      }
      {Title:"p"
      TitleSeason:"P"
      SDPosterUrl:"pkg:/images/transparente.png"
      }
      ]
    an=[
      {Title:"a"
      TitleSeason:"A"
      SDPosterUrl:"pkg:/images/transparente.png"
      }
      {Title:"s"
      TitleSeason:"S"
      SDPosterUrl:"pkg:/images/transparente.png"
      }
      {Title:"d"
      TitleSeason:"D"
      SDPosterUrl:"pkg:/images/transparente.png"
      }
      {Title:"f"
      TitleSeason:"F"
      SDPosterUrl:"pkg:/images/transparente.png"
      }
      {Title:"g"
      TitleSeason:"G"
      SDPosterUrl:"pkg:/images/transparente.png"
      }
      {Title:"h"
      TitleSeason:"H"
      SDPosterUrl:"pkg:/images/transparente.png"
      }
      {Title:"j"
      TitleSeason:"J"
      SDPosterUrl:"pkg:/images/transparente.png"
      }
      {Title:"k"
      TitleSeason:"K"
      SDPosterUrl:"pkg:/images/transparente.png"
      }
      {Title:"l"
      TitleSeason:"L"
      SDPosterUrl:"pkg:/images/transparente.png"
      }
      {Title:"ñ"
      TitleSeason:"Ñ"
      SDPosterUrl:"pkg:/images/transparente.png"
      }
      ]
    ma=[
      {Title:"may"
      TitleSeason:"MAY"
      SDPosterUrl:"pkg:/images/transparente.png"
      }
      {Title:"z"
      TitleSeason:"Z"
      SDPosterUrl:"pkg:/images/transparente.png"
      }
      {Title:"x"
      TitleSeason:"X"
      SDPosterUrl:"pkg:/images/transparente.png"
      }
      {Title:"c"
      TitleSeason:"C"
      SDPosterUrl:"pkg:/images/transparente.png"
      }
      {Title:"v"
      TitleSeason:"V"
      SDPosterUrl:"pkg:/images/transparente.png"
      }
      {Title:"b"
      TitleSeason:"B"
      SDPosterUrl:"pkg:/images/transparente.png"
      }
      {Title:"n"
      TitleSeason:"N"
      SDPosterUrl:"pkg:/images/transparente.png"
      }
      {Title:"m"
      TitleSeason:"M"
      SDPosterUrl:"pkg:/images/transparente.png"
      }
      {Title:"@"
      TitleSeason:"@"
      SDPosterUrl:"pkg:/images/transparente.png"
      }
      ]
    ch=[
      {Title:".com"
      TitleSeason:".com"
      SDPosterUrl:"pkg:/images/transparente.png"
      }
      {Title:".net"
      TitleSeason:".net"
      SDPosterUrl:"pkg:/images/transparente.png"
      }
      {Title:"@gmail.com"
      TitleSeason:"@gmail.com"
      SDPosterUrl:"pkg:/images/transparente.png"
      }
      {Title:"@hotmail.com"
      TitleSeason:"@hotmail.com"
      SDPosterUrl:"pkg:/images/transparente.png"
      }
      ]
    lista= [
        {
            Title: "De Q a P"
            ContentList: qp
        }
        {
            Title: "De A a Ñ"
            ContentList: an
        }
        {
            Title: "Mayus a @"
            ContentList: ma
        }
        {
            Title: "Com a hotmail"
            ContentList: ch
        }

    ]
    content = parseContent(lista)
    m.myRowList.content= content
    m.top.observeField("focusedChild","OnFocusedChildChange")
end function
sub OnFocusedChildChange()
    ? "[GridScreen] >> OnFocusedChildChangeAbecedario"
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
  if (not press) then
    if (key = "OK" ) then
        if m.top.focusedContent.title="may" then
          m.top.focusedContent.title=m.top.focusedContent.TitleSeason
          m.myRowList.itemComponentName="BotonLetraMayus"
        else
            m.top.letra=m.top.focusedContent.title
       end if 
    ' else if(key = "down" ) then

    '         m.AbecedarioAnexo.setFocus(true)
    '         print "Voy al abecedario"

    ' else if(key = "up" ) then
    '     if m.AbecedarioAnexo.hasFocus() then
    '         m.myRowList.setFocus(true)
    '         print "entre aqui"
    '     end if
end if
  end if
  return handled
end function
