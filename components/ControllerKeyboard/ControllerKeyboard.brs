  function init()
  m.top.observeField("focusedChild", "OnFocusedChild")
  m.abecedario=m.top.findNode("abecedario")
  m.numerico=m.top.findNode("numerico")
  m.borrar=m.top.findNode("borrar")
  m.vaciar=m.top.findNode("vaciar")

  m.focusArray = [m.abecedario,m.numerico, m.borrar, m.vaciar]
  m.top.currentFocus = 0
  end function


  sub onFocusedChild()
    if m.top.isInFocusChain() and not m.focusArray[m.top.currentFocus].hasFocus() then
        m.focusArray[m.top.currentFocus].focused = true
    end if
end sub

function onKeyEvent(key as string, press as boolean) as boolean
    if press then
        if key = "left" then
            if m.top.currentFocus <> 0 then
                m.focusArray[m.top.currentFocus].focused = false
                m.top.currentFocus --
                m.focusArray[m.top.currentFocus].focused = true
            end if
            return true
        else if key = "right" then
            if m.top.currentFocus <> 3 then
                m.focusArray[m.top.currentFocus].focused = false
                m.top.currentFocus ++
                m.focusArray[m.top.currentFocus].focused = true
            else 
            m.focusArray[0].focused = false
            m.focusArray[m.top.currentFocus].focused = false
            return false
            end if
            return true
        end if
    end if
    return false
end function