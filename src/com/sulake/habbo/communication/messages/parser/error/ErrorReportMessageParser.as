package com.sulake.habbo.communication.messages.parser.error
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class ErrorReportMessageParser implements IMessageParser
   {
       
      
      private var var_1145:int;
      
      private var var_1144:int;
      
      private var var_1146:String;
      
      public function ErrorReportMessageParser()
      {
         super();
      }
      
      public function get messageId() : int
      {
         return var_1145;
      }
      
      public function flush() : Boolean
      {
         var_1144 = 0;
         var_1145 = 0;
         var_1146 = null;
         return true;
      }
      
      public function get errorCode() : int
      {
         return var_1144;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var_1145 = param1.readInteger();
         var_1144 = param1.readInteger();
         var_1146 = param1.readString();
         return true;
      }
      
      public function get timestamp() : String
      {
         return var_1146;
      }
   }
}
