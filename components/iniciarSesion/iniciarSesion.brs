  function init()
  m.myIniciar=m.top.findNode("myIniciar")
  m.myIngresa=m.top.findNode("myIngresa")
  m.myRectangle=m.top.findNode("myRectangle")
  m.myInput=m.top.findNode("myInput")
  m.frame=m.top.findNode("frame")
  m.bg=m.top.findNode("bg")
  m.inputText=m.top.findNode("inputText")

  m.myIniciar.font.size=40

  bTRect=m.myRectangle.boundingRect()
  m.top.heightComponent=bTRect.height
  end function

  function sizeComponent()
  m.myIniciar.width=m.top.widthComponent
  m.myIngresa.width=m.top.widthComponent
  m.myInput.width=m.top.widthComponent
  asignarWidths()
  end function

  function asignarWidths()
  m.frame.width=m.myInput.width
  m.bg.width=m.frame.width-6
  end function 