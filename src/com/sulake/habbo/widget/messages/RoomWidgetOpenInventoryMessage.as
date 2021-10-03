package com.sulake.habbo.widget.messages
{
   public class RoomWidgetOpenInventoryMessage extends RoomWidgetMessage
   {
      
      public static const const_804:String = "inventory_badges";
      
      public static const const_1323:String = "inventory_clothes";
      
      public static const const_1268:String = "inventory_furniture";
      
      public static const const_612:String = "RWGOI_MESSAGE_OPEN_INVENTORY";
      
      public static const const_830:String = "inventory_effects";
       
      
      private var var_1800:String;
      
      public function RoomWidgetOpenInventoryMessage(param1:String)
      {
         super(const_612);
         var_1800 = param1;
      }
      
      public function get inventoryType() : String
      {
         return var_1800;
      }
   }
}
