package com.sulake.habbo.communication.messages.parser.users
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class ScrSendUserInfoMessageParser implements IMessageParser
   {
       
      
      private var var_1932:int;
      
      private var var_1116:String;
      
      private var var_1929:int;
      
      private var var_1931:int;
      
      private var var_1930:int;
      
      private var var_1933:Boolean;
      
      public function ScrSendUserInfoMessageParser()
      {
         super();
      }
      
      public function get productName() : String
      {
         return var_1116;
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function get hasEverBeenMember() : Boolean
      {
         return var_1933;
      }
      
      public function get responseType() : int
      {
         return var_1931;
      }
      
      public function get daysToPeriodEnd() : int
      {
         return var_1929;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var_1116 = param1.readString();
         var_1929 = param1.readInteger();
         var_1932 = param1.readInteger();
         var_1930 = param1.readInteger();
         var_1931 = param1.readInteger();
         var_1933 = param1.readBoolean();
         return true;
      }
      
      public function get memberPeriods() : int
      {
         return var_1932;
      }
      
      public function get periodsSubscribedAhead() : int
      {
         return var_1930;
      }
   }
}
