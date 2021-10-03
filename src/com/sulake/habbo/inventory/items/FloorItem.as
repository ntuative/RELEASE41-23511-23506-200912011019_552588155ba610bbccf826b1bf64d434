package com.sulake.habbo.inventory.items
{
   public class FloorItem implements IItem
   {
       
      
      protected var var_1293:String;
      
      protected var var_2157:Boolean;
      
      protected var var_1668:int;
      
      protected var _type:int;
      
      protected var var_1671:int;
      
      protected var var_2149:Boolean;
      
      protected var var_1821:int;
      
      protected var var_2158:Boolean;
      
      protected var _id:int;
      
      protected var var_2159:int;
      
      protected var var_1899:String;
      
      protected var var_1673:Boolean;
      
      protected var _category:int;
      
      protected var var_1676:int;
      
      protected var var_2156:int;
      
      public function FloorItem(param1:int, param2:int, param3:int, param4:int, param5:Boolean, param6:Boolean, param7:Boolean, param8:String, param9:int, param10:int, param11:int, param12:int, param13:String, param14:int)
      {
         super();
         _id = param1;
         _type = param2;
         var_2159 = param3;
         _category = param4;
         var_1673 = param5;
         var_2158 = param6;
         var_2157 = param7;
         var_1293 = param8;
         var_2156 = param9;
         var_1668 = param10;
         var_1676 = param11;
         var_1671 = param12;
         var_1899 = param13;
         var_1821 = param14;
      }
      
      public function get locked() : Boolean
      {
         return var_2149;
      }
      
      public function get songId() : int
      {
         return var_1821;
      }
      
      public function set locked(param1:Boolean) : void
      {
         var_2149 = param1;
      }
      
      public function get ref() : int
      {
         return var_2159;
      }
      
      public function get category() : int
      {
         return _category;
      }
      
      public function get id() : int
      {
         return _id;
      }
      
      public function get slotId() : String
      {
         return var_1899;
      }
      
      public function get expires() : int
      {
         return var_2156;
      }
      
      public function get creationYear() : int
      {
         return var_1671;
      }
      
      public function get creationDay() : int
      {
         return var_1668;
      }
      
      public function get tradeable() : Boolean
      {
         return var_2158;
      }
      
      public function get type() : int
      {
         return _type;
      }
      
      public function get groupable() : Boolean
      {
         return var_1673;
      }
      
      public function get creationMonth() : int
      {
         return var_1676;
      }
      
      public function get extras() : String
      {
         return var_1293;
      }
      
      public function get recyclable() : Boolean
      {
         return var_2157;
      }
   }
}
