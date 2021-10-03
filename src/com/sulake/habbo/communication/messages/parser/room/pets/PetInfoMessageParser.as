package com.sulake.habbo.communication.messages.parser.room.pets
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class PetInfoMessageParser implements IMessageParser
   {
       
      
      private var var_1628:int;
      
      private var var_514:String;
      
      private var var_1631:int;
      
      private var var_1629:int;
      
      private var var_1635:int;
      
      private var var_2070:int;
      
      private var _nutrition:int;
      
      private var var_1203:int;
      
      private var var_2073:int;
      
      private var var_2072:int;
      
      private var _energy:int;
      
      private var _name:String;
      
      private var _ownerName:String;
      
      private var var_1634:int;
      
      private var var_2071:int;
      
      public function PetInfoMessageParser()
      {
         super();
      }
      
      public function get level() : int
      {
         return var_1631;
      }
      
      public function get energy() : int
      {
         return _energy;
      }
      
      public function get name() : String
      {
         return _name;
      }
      
      public function get maxEnergy() : int
      {
         return var_2070;
      }
      
      public function flush() : Boolean
      {
         var_1203 = -1;
         return true;
      }
      
      public function get maxLevel() : int
      {
         return var_2073;
      }
      
      public function get experienceRequiredToLevel() : int
      {
         return var_2072;
      }
      
      public function get maxNutrition() : int
      {
         return var_2071;
      }
      
      public function get figure() : String
      {
         return var_514;
      }
      
      public function get ownerName() : String
      {
         return _ownerName;
      }
      
      public function get respect() : int
      {
         return var_1629;
      }
      
      public function get petId() : int
      {
         return var_1203;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         if(param1 == null)
         {
            return false;
         }
         var_1203 = param1.readInteger();
         _name = param1.readString();
         var_1631 = param1.readInteger();
         var_2073 = param1.readInteger();
         var_1635 = param1.readInteger();
         var_2072 = param1.readInteger();
         _energy = param1.readInteger();
         var_2070 = param1.readInteger();
         _nutrition = param1.readInteger();
         var_2071 = param1.readInteger();
         var_514 = param1.readString();
         var_1629 = param1.readInteger();
         var_1634 = param1.readInteger();
         var_1628 = param1.readInteger();
         _ownerName = param1.readString();
         return true;
      }
      
      public function get nutrition() : int
      {
         return _nutrition;
      }
      
      public function get experience() : int
      {
         return var_1635;
      }
      
      public function get ownerId() : int
      {
         return var_1634;
      }
      
      public function get age() : int
      {
         return var_1628;
      }
   }
}
