package com.sulake.habbo.communication.messages.incoming.roomsettings
{
   public class RoomSettingsData
   {
      
      public static const const_412:int = 0;
      
      public static const const_104:int = 2;
      
      public static const const_155:int = 1;
      
      public static const const_693:Array = ["open","closed","password"];
       
      
      private var _name:String;
      
      private var var_1799:int;
      
      private var var_1797:int;
      
      private var var_1798:Array;
      
      private var var_1796:Boolean;
      
      private var var_1564:Boolean;
      
      private var var_1208:String;
      
      private var var_1794:Boolean;
      
      private var var_1793:int;
      
      private var var_1570:int;
      
      private var var_1175:int;
      
      private var var_1795:Boolean;
      
      private var _roomId:int;
      
      private var var_1566:Boolean;
      
      private var var_577:Array;
      
      public function RoomSettingsData()
      {
         super();
      }
      
      public function get maximumVisitors() : int
      {
         return var_1793;
      }
      
      public function set maximumVisitors(param1:int) : void
      {
         var_1793 = param1;
      }
      
      public function get name() : String
      {
         return _name;
      }
      
      public function set name(param1:String) : void
      {
         _name = param1;
      }
      
      public function get tags() : Array
      {
         return var_577;
      }
      
      public function get allowPets() : Boolean
      {
         return var_1564;
      }
      
      public function get allowTrading() : Boolean
      {
         return var_1566;
      }
      
      public function set controllerCount(param1:int) : void
      {
         var_1799 = param1;
      }
      
      public function set roomId(param1:int) : void
      {
         _roomId = param1;
      }
      
      public function set controllers(param1:Array) : void
      {
         var_1798 = param1;
      }
      
      public function set tags(param1:Array) : void
      {
         var_577 = param1;
      }
      
      public function get allowFoodConsume() : Boolean
      {
         return var_1796;
      }
      
      public function get maximumVisitorsLimit() : int
      {
         return var_1797;
      }
      
      public function get categoryId() : int
      {
         return var_1175;
      }
      
      public function set allowPets(param1:Boolean) : void
      {
         var_1564 = param1;
      }
      
      public function set allowTrading(param1:Boolean) : void
      {
         var_1566 = param1;
      }
      
      public function set showOwnerName(param1:Boolean) : void
      {
         var_1795 = param1;
      }
      
      public function set allowFurniMoving(param1:Boolean) : void
      {
         var_1794 = param1;
      }
      
      public function get controllerCount() : int
      {
         return var_1799;
      }
      
      public function get roomId() : int
      {
         return _roomId;
      }
      
      public function get controllers() : Array
      {
         return var_1798;
      }
      
      public function get showOwnerName() : Boolean
      {
         return var_1795;
      }
      
      public function get allowFurniMoving() : Boolean
      {
         return var_1794;
      }
      
      public function set doorMode(param1:int) : void
      {
         var_1570 = param1;
      }
      
      public function set allowFoodConsume(param1:Boolean) : void
      {
         var_1796 = param1;
      }
      
      public function set maximumVisitorsLimit(param1:int) : void
      {
         var_1797 = param1;
      }
      
      public function get doorMode() : int
      {
         return var_1570;
      }
      
      public function set categoryId(param1:int) : void
      {
         var_1175 = param1;
      }
      
      public function set description(param1:String) : void
      {
         var_1208 = param1;
      }
      
      public function get description() : String
      {
         return var_1208;
      }
   }
}
