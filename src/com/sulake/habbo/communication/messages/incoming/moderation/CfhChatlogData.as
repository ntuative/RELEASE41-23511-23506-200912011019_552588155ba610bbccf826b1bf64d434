package com.sulake.habbo.communication.messages.incoming.moderation
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class CfhChatlogData
   {
       
      
      private var var_999:int;
      
      private var var_1826:int;
      
      private var var_1397:int;
      
      private var var_121:RoomChatlogData;
      
      public function CfhChatlogData(param1:IMessageDataWrapper)
      {
         super();
         var_1397 = param1.readInteger();
         var_1826 = param1.readInteger();
         var_999 = param1.readInteger();
         var_121 = new RoomChatlogData(param1);
         Logger.log("READ CFHCHATLOGDATA: callId: " + var_1397);
      }
      
      public function get reportedUserId() : int
      {
         return var_999;
      }
      
      public function get callerUserId() : int
      {
         return var_1826;
      }
      
      public function get callId() : int
      {
         return var_1397;
      }
      
      public function get room() : RoomChatlogData
      {
         return var_121;
      }
   }
}
