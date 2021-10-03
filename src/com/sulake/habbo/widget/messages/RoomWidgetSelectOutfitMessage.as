package com.sulake.habbo.widget.messages
{
   public class RoomWidgetSelectOutfitMessage extends RoomWidgetMessage
   {
      
      public static const const_957:String = "select_outfit";
       
      
      private var var_1805:int;
      
      public function RoomWidgetSelectOutfitMessage(param1:int)
      {
         super(const_957);
         var_1805 = param1;
      }
      
      public function get outfitId() : int
      {
         return var_1805;
      }
   }
}
