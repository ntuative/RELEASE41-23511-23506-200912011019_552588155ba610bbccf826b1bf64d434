package com.sulake.habbo.communication.messages.parser.availability
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class AvailabilityStatusMessageParser implements IMessageParser
   {
       
      
      private var var_992:Boolean;
      
      private var var_1136:Boolean;
      
      public function AvailabilityStatusMessageParser()
      {
         super();
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var_992 = param1.readInteger() > 0;
         var_1136 = param1.readInteger() > 0;
         return true;
      }
      
      public function get isOpen() : Boolean
      {
         return var_992;
      }
      
      public function get onShutDown() : Boolean
      {
         return var_1136;
      }
      
      public function flush() : Boolean
      {
         var_992 = false;
         var_1136 = false;
         return true;
      }
   }
}
