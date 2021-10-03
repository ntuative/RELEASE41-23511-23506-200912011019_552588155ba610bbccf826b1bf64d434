package com.sulake.habbo.communication.messages.outgoing.room.furniture
{
   import com.sulake.core.communication.messages.IMessageComposer;
   
   public class RoomDimmerSavePresetMessageComposer implements IMessageComposer
   {
       
      
      private var var_1985:int;
      
      private var var_1983:int;
      
      private var var_1984:Boolean;
      
      private var var_1986:String;
      
      private var _roomId:int = 0;
      
      private var _roomCategory:int = 0;
      
      private var var_1987:int;
      
      public function RoomDimmerSavePresetMessageComposer(param1:int, param2:int, param3:String, param4:int, param5:Boolean, param6:int = 0, param7:int = 0)
      {
         super();
         _roomId = param6;
         _roomCategory = param7;
         var_1983 = param1;
         var_1985 = param2;
         var_1986 = param3;
         var_1987 = param4;
         var_1984 = param5;
      }
      
      public function getMessageArray() : Array
      {
         return [var_1983,var_1985,var_1986,var_1987,int(var_1984)];
      }
      
      public function dispose() : void
      {
      }
   }
}
