package com.sulake.habbo.room.events
{
   import com.sulake.room.events.RoomObjectEvent;
   
   public class RoomObjectSoundMachineStateUpdateEvent extends RoomObjectEvent
   {
      
      public static const const_794:String = "ROSM_SOUND_MACHINE_SWITCHED_ON";
      
      public static const const_1259:String = "ROSM_JUKEBOX_INIT";
      
      public static const const_1110:String = "ROSM_SOUND_MACHINE_SWITCHED_OFF";
      
      public static const const_888:String = "ROSM_DISPOSE";
       
      
      private var var_1926:String;
      
      public function RoomObjectSoundMachineStateUpdateEvent(param1:int, param2:String, param3:String, param4:Boolean = false, param5:Boolean = false)
      {
         super(param3,param1,param2,param4,param5);
         var_1926 = param3;
      }
      
      public function get updateType() : String
      {
         return var_1926;
      }
   }
}
