package com.sulake.habbo.inventory.furni
{
   import flash.display.BitmapData;
   
   public class FurniItem
   {
       
      
      private var _isSelected:Boolean = false;
      
      private var var_1880:int;
      
      private var var_1894:Boolean;
      
      private var var_1821:int;
      
      private var var_1893:String;
      
      private var var_1898:Boolean = false;
      
      private var var_1895:int;
      
      private var var_414:int;
      
      private var var_1017:String;
      
      private var var_1899:String;
      
      private var _image:BitmapData;
      
      private var _objId:int;
      
      private var var_1261:int;
      
      private var var_1896:Boolean;
      
      private var var_1897:int;
      
      public function FurniItem(param1:int, param2:String, param3:int, param4:int, param5:String, param6:Boolean, param7:Boolean, param8:int, param9:String, param10:int)
      {
         super();
         var_1880 = param1;
         var_1017 = param2;
         _objId = param3;
         var_1261 = param4;
         var_1893 = param5;
         var_1894 = param6;
         var_1896 = param7;
         var_1895 = param8;
         var_1899 = param9;
         var_1821 = param10;
         var_414 = -1;
      }
      
      public function get songId() : int
      {
         return var_1821;
      }
      
      public function get iconCallbackId() : int
      {
         return var_414;
      }
      
      public function get expiryTime() : int
      {
         return var_1895;
      }
      
      public function set prevCallbackId(param1:int) : void
      {
         var_1897 = param1;
      }
      
      public function set isLocked(param1:Boolean) : void
      {
         var_1898 = param1;
      }
      
      public function set iconCallbackId(param1:int) : void
      {
         var_414 = param1;
      }
      
      public function get isTradeable() : Boolean
      {
         return var_1896;
      }
      
      public function get slotId() : String
      {
         return var_1899;
      }
      
      public function get classId() : int
      {
         return var_1261;
      }
      
      public function get isRecyclable() : Boolean
      {
         return var_1894;
      }
      
      public function get stuffData() : String
      {
         return var_1893;
      }
      
      public function set iconImage(param1:BitmapData) : void
      {
         _image = param1;
      }
      
      public function set isSelected(param1:Boolean) : void
      {
         _isSelected = param1;
      }
      
      public function get stripId() : int
      {
         return var_1880;
      }
      
      public function get isLocked() : Boolean
      {
         return var_1898;
      }
      
      public function get prevCallbackId() : int
      {
         return var_1897;
      }
      
      public function get iconImage() : BitmapData
      {
         return _image;
      }
      
      public function get isSelected() : Boolean
      {
         return _isSelected;
      }
      
      public function get objId() : int
      {
         return _objId;
      }
      
      public function get itemType() : String
      {
         return var_1017;
      }
   }
}
