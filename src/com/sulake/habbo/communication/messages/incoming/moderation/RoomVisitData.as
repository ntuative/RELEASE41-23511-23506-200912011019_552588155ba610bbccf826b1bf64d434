package com.sulake.habbo.communication.messages.incoming.moderation
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class RoomVisitData
   {
       
      
      private var var_604:String;
      
      private var var_2015:int;
      
      private var var_1393:Boolean;
      
      private var _roomId:int;
      
      private var var_2016:int;
      
      public function RoomVisitData(param1:IMessageDataWrapper)
      {
         super();
         var_1393 = param1.readBoolean();
         _roomId = param1.readInteger();
         var_604 = param1.readString();
         var_2016 = param1.readInteger();
         var_2015 = param1.readInteger();
      }
      
      public function get isPublic() : Boolean
      {
         return var_1393;
      }
      
      public function get roomName() : String
      {
         return var_604;
      }
      
      public function get enterMinute() : int
      {
         return var_2015;
      }
      
      public function get roomId() : int
      {
         return _roomId;
      }
      
      public function get enterHour() : int
      {
         return var_2016;
      }
   }
}
