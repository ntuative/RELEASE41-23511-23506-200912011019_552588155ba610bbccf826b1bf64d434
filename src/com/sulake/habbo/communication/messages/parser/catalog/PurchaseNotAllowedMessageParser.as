package com.sulake.habbo.communication.messages.parser.catalog
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class PurchaseNotAllowedMessageParser implements IMessageParser
   {
       
      
      private var var_1144:int = 0;
      
      public function PurchaseNotAllowedMessageParser()
      {
         super();
      }
      
      public function flush() : Boolean
      {
         var_1144 = 0;
         return true;
      }
      
      public function get errorCode() : int
      {
         return var_1144;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var_1144 = param1.readInteger();
         return true;
      }
   }
}