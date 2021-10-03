package com.sulake.habbo.communication.messages.incoming.inventory.trading
{
   public class ItemDataStructure
   {
       
      
      private var var_1668:int;
      
      private var var_1674:int;
      
      private var var_1017:String;
      
      private var var_1531:int;
      
      private var var_1672:String;
      
      private var var_1669:int;
      
      private var var_1671:int;
      
      private var _category:int;
      
      private var var_1670:int;
      
      private var var_1676:int;
      
      private var var_1675:int;
      
      private var var_1673:Boolean;
      
      public function ItemDataStructure(param1:int, param2:String, param3:int, param4:int, param5:int, param6:String, param7:int, param8:int, param9:int, param10:int, param11:Boolean, param12:int)
      {
         super();
         var_1531 = param1;
         var_1017 = param2;
         var_1674 = param3;
         var_1675 = param4;
         _category = param5;
         var_1672 = param6;
         var_1669 = param7;
         var_1668 = param8;
         var_1676 = param9;
         var_1671 = param10;
         var_1673 = param11;
         var_1670 = param12;
      }
      
      public function get itemTypeID() : int
      {
         return var_1675;
      }
      
      public function get groupable() : Boolean
      {
         return var_1673;
      }
      
      public function get creationMonth() : int
      {
         return var_1676;
      }
      
      public function get roomItemID() : int
      {
         return var_1674;
      }
      
      public function get itemType() : String
      {
         return var_1017;
      }
      
      public function get itemID() : int
      {
         return var_1531;
      }
      
      public function get itemSpecificData() : String
      {
         return var_1672;
      }
      
      public function get songID() : int
      {
         return var_1670;
      }
      
      public function get timeToExpiration() : int
      {
         return var_1669;
      }
      
      public function get creationYear() : int
      {
         return var_1671;
      }
      
      public function get creationDay() : int
      {
         return var_1668;
      }
      
      public function get category() : int
      {
         return _category;
      }
   }
}
