package com.sulake.habbo.widget.events
{
   public class RoomWidgetPetCommandsUpdateEvent extends RoomWidgetUpdateEvent
   {
      
      public static const const_149:String = "RWPCUE_PET_COMMANDS";
       
      
      private var _id:int;
      
      private var var_940:Array;
      
      public function RoomWidgetPetCommandsUpdateEvent(param1:int, param2:Array, param3:Boolean = false, param4:Boolean = false)
      {
         super(RoomWidgetPetCommandsUpdateEvent.const_149,param3,param4);
         _id = param1;
         var_940 = param2;
      }
      
      public function get id() : int
      {
         return _id;
      }
      
      public function get enabledCommands() : Array
      {
         return var_940;
      }
   }
}
