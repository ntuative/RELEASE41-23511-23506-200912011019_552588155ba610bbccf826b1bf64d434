package com.sulake.habbo.communication.messages.incoming.friendlist
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class FriendRequestData
   {
       
      
      private var var_1558:int;
      
      private var var_1559:String;
      
      private var var_1054:int;
      
      public function FriendRequestData(param1:IMessageDataWrapper)
      {
         super();
         this.var_1054 = param1.readInteger();
         this.var_1559 = param1.readString();
         this.var_1558 = int(param1.readString());
      }
      
      public function get requestId() : int
      {
         return this.var_1054;
      }
      
      public function get requesterUserId() : int
      {
         return this.var_1558;
      }
      
      public function get requesterName() : String
      {
         return this.var_1559;
      }
   }
}
