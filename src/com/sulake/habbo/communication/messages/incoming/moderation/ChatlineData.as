package com.sulake.habbo.communication.messages.incoming.moderation
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class ChatlineData
   {
       
      
      private var var_1508:String;
      
      private var var_1734:int;
      
      private var var_1735:int;
      
      private var var_1736:int;
      
      private var var_1733:String;
      
      public function ChatlineData(param1:IMessageDataWrapper)
      {
         super();
         var_1734 = param1.readInteger();
         var_1736 = param1.readInteger();
         var_1735 = param1.readInteger();
         var_1733 = param1.readString();
         var_1508 = param1.readString();
      }
      
      public function get msg() : String
      {
         return var_1508;
      }
      
      public function get hour() : int
      {
         return var_1734;
      }
      
      public function get minute() : int
      {
         return var_1736;
      }
      
      public function get chatterName() : String
      {
         return var_1733;
      }
      
      public function get chatterId() : int
      {
         return var_1735;
      }
   }
}
