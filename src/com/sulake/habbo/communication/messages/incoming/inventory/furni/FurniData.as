package com.sulake.habbo.communication.messages.incoming.inventory.furni
{
   public class FurniData
   {
       
      
      private var var_1893:String;
      
      private var var_1017:String;
      
      private var var_1991:Boolean;
      
      private var var_1880:int;
      
      private var var_1894:Boolean;
      
      private var var_1899:String = "";
      
      private var _category:int;
      
      private var var_1261:int;
      
      private var var_1896:Boolean;
      
      private var var_1821:int = -1;
      
      private var _objId:int;
      
      private var var_1895:int;
      
      public function FurniData(param1:int, param2:String, param3:int, param4:int, param5:int, param6:String, param7:Boolean, param8:Boolean, param9:Boolean, param10:int)
      {
         super();
         var_1880 = param1;
         var_1017 = param2;
         _objId = param3;
         var_1261 = param4;
         _category = param5;
         var_1893 = param6;
         var_1991 = param7;
         var_1894 = param8;
         var_1896 = param9;
         var_1895 = param10;
      }
      
      public function get classId() : int
      {
         return var_1261;
      }
      
      public function get category() : int
      {
         return _category;
      }
      
      public function get isGroupable() : Boolean
      {
         return var_1991;
      }
      
      public function get stripId() : int
      {
         return var_1880;
      }
      
      public function get stuffData() : String
      {
         return var_1893;
      }
      
      public function get songId() : int
      {
         return var_1821;
      }
      
      public function setSongData(param1:String, param2:int) : void
      {
         var_1899 = param1;
         var_1821 = param2;
      }
      
      public function get expiryTime() : int
      {
         return var_1895;
      }
      
      public function get itemType() : String
      {
         return var_1017;
      }
      
      public function get objId() : int
      {
         return _objId;
      }
      
      public function get slotId() : String
      {
         return var_1899;
      }
      
      public function get isTradeable() : Boolean
      {
         return var_1896;
      }
      
      public function get isRecyclable() : Boolean
      {
         return var_1894;
      }
   }
}
