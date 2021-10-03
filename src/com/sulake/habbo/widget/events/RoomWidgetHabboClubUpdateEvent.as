package com.sulake.habbo.widget.events
{
   public class RoomWidgetHabboClubUpdateEvent extends RoomWidgetUpdateEvent
   {
      
      public static const const_197:String = "RWBIUE_HABBO_CLUB";
       
      
      private var var_2085:Boolean = false;
      
      private var var_2087:int = 0;
      
      private var var_2088:int = 0;
      
      private var var_2086:int = 0;
      
      public function RoomWidgetHabboClubUpdateEvent(param1:int, param2:int, param3:int, param4:Boolean, param5:Boolean = false, param6:Boolean = false)
      {
         super(const_197,param5,param6);
         var_2086 = param1;
         var_2088 = param2;
         var_2087 = param3;
         var_2085 = param4;
      }
      
      public function get pastPeriods() : int
      {
         return var_2087;
      }
      
      public function get periodsLeft() : int
      {
         return var_2088;
      }
      
      public function get daysLeft() : int
      {
         return var_2086;
      }
      
      public function get allowClubDances() : Boolean
      {
         return var_2085;
      }
   }
}
