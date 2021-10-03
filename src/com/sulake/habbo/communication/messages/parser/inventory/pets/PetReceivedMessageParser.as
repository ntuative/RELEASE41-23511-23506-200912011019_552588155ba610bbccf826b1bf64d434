package com.sulake.habbo.communication.messages.parser.inventory.pets
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class PetReceivedMessageParser implements IMessageParser
   {
       
      
      private var var_975:PetData;
      
      private var var_1421:Boolean;
      
      public function PetReceivedMessageParser()
      {
         super();
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var_1421 = param1.readBoolean();
         var_975 = new PetData(param1);
         Logger.log("Got PetReceived: " + var_1421 + ", " + var_975.id + ", " + var_975.name + ", " + pet.figure + ", " + var_975.type);
         return true;
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function get boughtAsGift() : Boolean
      {
         return var_1421;
      }
      
      public function get pet() : PetData
      {
         return var_975;
      }
   }
}
