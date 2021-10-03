package com.sulake.core.assets
{
   public class AssetTypeDeclaration
   {
       
      
      private var var_2014:Class;
      
      private var var_2013:Class;
      
      private var var_2012:String;
      
      private var var_1238:Array;
      
      public function AssetTypeDeclaration(param1:String, param2:Class, param3:Class, ... rest)
      {
         super();
         var_2012 = param1;
         var_2013 = param2;
         var_2014 = param3;
         if(rest == null)
         {
            var_1238 = new Array();
         }
         else
         {
            var_1238 = rest;
         }
      }
      
      public function get loaderClass() : Class
      {
         return var_2014;
      }
      
      public function get assetClass() : Class
      {
         return var_2013;
      }
      
      public function get mimeType() : String
      {
         return var_2012;
      }
      
      public function get fileTypes() : Array
      {
         return var_1238;
      }
   }
}
