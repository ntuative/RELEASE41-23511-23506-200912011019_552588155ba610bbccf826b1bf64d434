package com.sulake.habbo.communication.messages.parser.navigator
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class FlatCatMessageParser implements IMessageParser
   {
       
      
      private var var_366:int;
      
      private var var_1128:int;
      
      public function FlatCatMessageParser()
      {
         super();
      }
      
      public function get flatId() : int
      {
         return var_366;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var_366 = param1.readInteger();
         var_1128 = param1.readInteger();
         return true;
      }
      
      public function flush() : Boolean
      {
         var_366 = 0;
         var_1128 = 0;
         return true;
      }
      
      public function get nodeId() : int
      {
         return var_1128;
      }
   }
}
