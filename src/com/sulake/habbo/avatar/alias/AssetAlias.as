package com.sulake.habbo.avatar.alias
{
   public class AssetAlias
   {
       
      
      private var var_985:Boolean;
      
      private var _name:String;
      
      private var var_1938:String;
      
      private var var_984:Boolean;
      
      public function AssetAlias(param1:XML)
      {
         super();
         _name = String(param1.@name);
         var_1938 = String(param1.@link);
         var_984 = Boolean(parseInt(param1.@fliph));
         var_985 = Boolean(parseInt(param1.@flipv));
      }
      
      public function get flipH() : Boolean
      {
         return var_984;
      }
      
      public function get flipV() : Boolean
      {
         return var_985;
      }
      
      public function get name() : String
      {
         return _name;
      }
      
      public function get link() : String
      {
         return var_1938;
      }
   }
}
