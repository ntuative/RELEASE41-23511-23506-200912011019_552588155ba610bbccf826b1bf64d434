package com.sulake.habbo.communication.messages.parser.help
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class TutorialStatusMessageParser implements IMessageParser
   {
       
      
      private var var_950:Boolean;
      
      private var var_949:Boolean;
      
      private var var_951:Boolean;
      
      public function TutorialStatusMessageParser()
      {
         super();
      }
      
      public function get hasCalledGuideBot() : Boolean
      {
         return var_950;
      }
      
      public function get hasChangedName() : Boolean
      {
         return var_949;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var_951 = param1.readBoolean();
         var_949 = param1.readBoolean();
         var_950 = param1.readBoolean();
         return true;
      }
      
      public function get hasChangedLooks() : Boolean
      {
         return var_951;
      }
      
      public function flush() : Boolean
      {
         var_951 = false;
         var_949 = false;
         var_950 = false;
         return true;
      }
   }
}
