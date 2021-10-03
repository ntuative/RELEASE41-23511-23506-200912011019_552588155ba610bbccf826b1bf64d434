package com.sulake.habbo.widget.messages
{
   public class RoomWidgetFurniActionMessage extends RoomWidgetMessage
   {
      
      public static const const_232:String = "RWFAM_MOVE";
      
      public static const const_698:String = "RWFUAM_ROTATE";
      
      public static const const_651:String = "RWFAM_PICKUP";
       
      
      private var var_2105:int = 0;
      
      private var var_2104:int = 0;
      
      public function RoomWidgetFurniActionMessage(param1:String, param2:int, param3:int)
      {
         super(param1);
         var_2105 = param2;
         var_2104 = param3;
      }
      
      public function get furniId() : int
      {
         return var_2105;
      }
      
      public function get furniCategory() : int
      {
         return var_2104;
      }
   }
}
