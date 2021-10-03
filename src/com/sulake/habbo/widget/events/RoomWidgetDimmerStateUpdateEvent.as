package com.sulake.habbo.widget.events
{
   public class RoomWidgetDimmerStateUpdateEvent extends RoomWidgetUpdateEvent
   {
      
      public static const const_58:String = "RWDSUE_DIMMER_STATE";
       
      
      private var var_952:int;
      
      private var _color:uint;
      
      private var var_953:int;
      
      private var var_1806:int;
      
      private var _state:int;
      
      public function RoomWidgetDimmerStateUpdateEvent(param1:int, param2:int, param3:int, param4:uint, param5:uint, param6:Boolean = false, param7:Boolean = false)
      {
         super(const_58,param6,param7);
         _state = param1;
         var_1806 = param2;
         var_952 = param3;
         _color = param4;
         var_953 = param5;
      }
      
      public function get brightness() : uint
      {
         return var_953;
      }
      
      public function get color() : uint
      {
         return _color;
      }
      
      public function get effectId() : int
      {
         return var_952;
      }
      
      public function get state() : int
      {
         return _state;
      }
      
      public function get presetId() : int
      {
         return var_1806;
      }
   }
}
