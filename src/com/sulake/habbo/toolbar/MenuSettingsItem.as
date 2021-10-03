package com.sulake.habbo.toolbar
{
   public class MenuSettingsItem
   {
       
      
      private var var_1625:Array;
      
      private var var_1623:String;
      
      private var var_1624:Boolean;
      
      public function MenuSettingsItem(param1:String, param2:Array = null, param3:Boolean = false)
      {
         super();
         var_1623 = param1;
         var_1625 = param2;
         var_1624 = param3;
      }
      
      public function get menuId() : String
      {
         return var_1623;
      }
      
      public function get yieldList() : Array
      {
         return var_1625;
      }
      
      public function get lockToIcon() : Boolean
      {
         return var_1624;
      }
   }
}
