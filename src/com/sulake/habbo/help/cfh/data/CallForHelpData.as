package com.sulake.habbo.help.cfh.data
{
   public class CallForHelpData
   {
       
      
      private var var_2057:int;
      
      private var var_1254:String = "";
      
      private var var_999:int;
      
      public function CallForHelpData()
      {
         super();
      }
      
      public function set reportedUserName(param1:String) : void
      {
         var_1254 = param1;
      }
      
      public function get topicIndex() : int
      {
         return var_2057;
      }
      
      public function set topicIndex(param1:int) : void
      {
         var_2057 = param1;
      }
      
      public function get reportedUserName() : String
      {
         return var_1254;
      }
      
      public function flush() : void
      {
         var_999 = 0;
         var_1254 = "";
      }
      
      public function get userSelected() : Boolean
      {
         return var_999 > 0;
      }
      
      public function set reportedUserId(param1:int) : void
      {
         var_999 = param1;
      }
      
      public function getTopicKey(param1:int) : String
      {
         return (!!userSelected ? "help.cfh.topicwithharasser." : "help.cfh.topic.") + param1;
      }
      
      public function get reportedUserId() : int
      {
         return var_999;
      }
   }
}
