package com.sulake.habbo.widget.messages
{
   public class RoomWidgetOpenCatalogMessage extends RoomWidgetMessage
   {
      
      public static const const_573:String = "RWOCM_CLUB_MAIN";
      
      public static const const_696:String = "RWGOI_MESSAGE_OPEN_CATALOG";
       
      
      private var var_2089:String = "";
      
      public function RoomWidgetOpenCatalogMessage(param1:String)
      {
         super(const_696);
         var_2089 = param1;
      }
      
      public function get pageKey() : String
      {
         return var_2089;
      }
   }
}
