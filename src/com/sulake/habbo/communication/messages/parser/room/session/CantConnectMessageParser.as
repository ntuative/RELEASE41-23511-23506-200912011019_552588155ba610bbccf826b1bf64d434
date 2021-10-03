package com.sulake.habbo.communication.messages.parser.room.session
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class CantConnectMessageParser implements IMessageParser
   {
      
      public static const const_1417:int = 2;
      
      public static const const_306:int = 4;
      
      public static const const_1192:int = 1;
      
      public static const const_1290:int = 3;
       
      
      private var var_910:int = 0;
      
      private var var_740:String = "";
      
      public function CantConnectMessageParser()
      {
         super();
      }
      
      public function get reason() : int
      {
         return var_910;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var_910 = param1.readInteger();
         if(var_910 == 3)
         {
            var_740 = param1.readString();
         }
         else
         {
            var_740 = "";
         }
         return true;
      }
      
      public function flush() : Boolean
      {
         var_910 = 0;
         var_740 = "";
         return true;
      }
      
      public function get parameter() : String
      {
         return var_740;
      }
   }
}
