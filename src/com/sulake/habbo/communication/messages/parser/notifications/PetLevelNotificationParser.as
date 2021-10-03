package com.sulake.habbo.communication.messages.parser.notifications
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class PetLevelNotificationParser implements IMessageParser
   {
       
      
      private var var_514:String;
      
      private var var_1631:int;
      
      private var var_1637:String;
      
      private var var_909:int;
      
      private var var_1203:int;
      
      public function PetLevelNotificationParser()
      {
         super();
      }
      
      public function get petId() : int
      {
         return var_1203;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var_1203 = param1.readInteger();
         var_1637 = param1.readString();
         var_1631 = param1.readInteger();
         var_514 = param1.readString();
         var_909 = param1.readInteger();
         return true;
      }
      
      public function get petName() : String
      {
         return var_1637;
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function get figure() : String
      {
         return var_514;
      }
      
      public function get petType() : int
      {
         return var_909;
      }
      
      public function get level() : int
      {
         return var_1631;
      }
   }
}
