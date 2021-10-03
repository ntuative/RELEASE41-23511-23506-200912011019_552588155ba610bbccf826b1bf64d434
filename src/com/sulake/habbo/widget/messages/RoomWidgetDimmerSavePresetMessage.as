package com.sulake.habbo.widget.messages
{
   public class RoomWidgetDimmerSavePresetMessage extends RoomWidgetMessage
   {
      
      public static const const_600:String = "RWSDPM_SAVE_PRESET";
       
      
      private var _color:uint;
      
      private var var_1985:int;
      
      private var var_1983:int;
      
      private var var_2065:Boolean;
      
      private var var_953:int;
      
      public function RoomWidgetDimmerSavePresetMessage(param1:int, param2:int, param3:uint, param4:int, param5:Boolean)
      {
         super(const_600);
         var_1983 = param1;
         var_1985 = param2;
         _color = param3;
         var_953 = param4;
         var_2065 = param5;
      }
      
      public function get color() : uint
      {
         return _color;
      }
      
      public function get effectTypeId() : int
      {
         return var_1985;
      }
      
      public function get presetNumber() : int
      {
         return var_1983;
      }
      
      public function get brightness() : int
      {
         return var_953;
      }
      
      public function get apply() : Boolean
      {
         return var_2065;
      }
   }
}
