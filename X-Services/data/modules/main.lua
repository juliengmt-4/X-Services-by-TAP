sasl.options.setAircraftPanelRendering(true)
sasl.options.set3DRendering(true)
sasl.options.setInteractivity(true)


components = {
  menu {};

}

--Creating Menu--



local X_Services_UI = contextWindow {
  name = "X-Services";
  position = { 1000 , -400 , 620 , 792};
  noBackground = true ;
  proportional = false ;
  minimumSize = { 620 , 792 };
  maximumSize = { 620 , 792 };
  gravity = { 0 , 1 , 0 , 1 };
  visible = true ;
components = {
   menu {position = { 0 , 0 , 620 , 792}}
  }
}

function Open_Close()
   X_Services_UI:setIsVisible(not X_Services_UI:isVisible()) 
end


Menu = sasl.appendMenuItem ( PLUGINS_MENU_ID , "X-Services Menu" )
Child_Menu = sasl.createMenu ( "" , PLUGINS_MENU_ID , Menu )
Append_Sub_menu = sasl.appendMenuItem ( Child_Menu, "Open/Close", Open_Close)


