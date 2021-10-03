package com.sulake.core.window.utils
{
   import com.sulake.core.window.enum.WindowType;
   import flash.utils.Dictionary;
   
   public class TypeCodeTable extends WindowType
   {
       
      
      public function TypeCodeTable()
      {
         super();
      }
      
      public static function fillTables(param1:Dictionary, param2:Dictionary = null) : void
      {
         var _loc3_:* = null;
         param1["background"] = const_671;
         param1["bitmap"] = const_714;
         param1["border"] = const_537;
         param1["border_notify"] = const_1256;
         param1["button"] = const_465;
         param1["button_thick"] = const_703;
         param1["button_icon"] = const_1130;
         param1["button_group_left"] = const_576;
         param1["button_group_center"] = const_519;
         param1["button_group_right"] = const_540;
         param1["canvas"] = const_570;
         param1["checkbox"] = const_638;
         param1["closebutton"] = const_947;
         param1["container"] = const_311;
         param1["container_button"] = const_613;
         param1["display_object_wrapper"] = const_516;
         param1["dropmenu"] = const_407;
         param1["dropmenu_item"] = const_444;
         param1["frame"] = const_315;
         param1["frame_notify"] = const_1156;
         param1["header"] = const_535;
         param1["icon"] = const_931;
         param1["itemgrid"] = const_836;
         param1["itemgrid_horizontal"] = const_375;
         param1["itemgrid_vertical"] = const_598;
         param1["itemlist"] = const_854;
         param1["itemlist_horizontal"] = const_325;
         param1["itemlist_vertical"] = const_292;
         param1["maximizebox"] = const_1122;
         param1["menu"] = const_1314;
         param1["menu_item"] = WINDOW_TYPE_MENU_ITEM;
         param1["submenu"] = const_861;
         param1["minimizebox"] = const_1104;
         param1["notify"] = const_1320;
         param1["null"] = const_471;
         param1["password"] = const_541;
         param1["radiobutton"] = const_717;
         param1["region"] = const_370;
         param1["restorebox"] = const_1251;
         param1["scaler"] = const_878;
         param1["scaler_horizontal"] = const_1342;
         param1["scaler_vertical"] = const_1123;
         param1["scrollbar_horizontal"] = const_343;
         param1["scrollbar_vertical"] = const_676;
         param1["scrollbar_slider_button_up"] = const_946;
         param1["scrollbar_slider_button_down"] = const_879;
         param1["scrollbar_slider_button_left"] = const_843;
         param1["scrollbar_slider_button_right"] = const_978;
         param1["scrollbar_slider_bar_horizontal"] = const_881;
         param1["scrollbar_slider_bar_vertical"] = const_809;
         param1["scrollbar_slider_track_horizontal"] = const_822;
         param1["scrollbar_slider_track_vertical"] = const_847;
         param1["scrollable_itemlist"] = const_1194;
         param1["scrollable_itemlist_vertical"] = const_394;
         param1["scrollable_itemlist_horizontal"] = const_985;
         param1["selector"] = const_615;
         param1["selector_list"] = const_635;
         param1["submenu"] = const_861;
         param1["tab_button"] = const_523;
         param1["tab_container_button"] = const_850;
         param1["tab_context"] = const_374;
         param1["tab_content"] = const_982;
         param1["tab_selector"] = WINDOW_TYPE_TAB_SELECTOR;
         param1["text"] = const_508;
         param1["input"] = const_569;
         param1["toolbar"] = const_1133;
         param1["tooltip"] = WINDOW_TYPE_TOOLTIP;
         if(param2 != null)
         {
            for(_loc3_ in param1)
            {
               if(param2[param1[_loc3_]] != null)
               {
                  Logger.log("Overlapping window type code " + _loc3_ + "!");
               }
               param2[param1[_loc3_]] = _loc3_;
            }
         }
      }
   }
}
