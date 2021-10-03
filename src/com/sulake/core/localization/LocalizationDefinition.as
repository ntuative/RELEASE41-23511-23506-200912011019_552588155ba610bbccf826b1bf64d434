package com.sulake.core.localization
{
   public class LocalizationDefinition implements ILocalizationDefinition
   {
       
      
      private var _name:String;
      
      private var var_1310:String;
      
      private var var_859:String;
      
      private var var_1309:String;
      
      private var var_1308:String;
      
      public function LocalizationDefinition(param1:String, param2:String, param3:String)
      {
         super();
         var _loc4_:Array = param1.split("_");
         var_1308 = _loc4_[0];
         var _loc5_:Array = String(_loc4_[1]).split(".");
         var_1310 = _loc5_[0];
         var_1309 = _loc5_[1];
         _name = param2;
         var_859 = param3;
      }
      
      public function get countryCode() : String
      {
         return var_1310;
      }
      
      public function get languageCode() : String
      {
         return var_1308;
      }
      
      public function get name() : String
      {
         return _name;
      }
      
      public function get url() : String
      {
         return var_859;
      }
      
      public function get encoding() : String
      {
         return var_1309;
      }
      
      public function get id() : String
      {
         return var_1308 + "_" + var_1310 + "." + var_1309;
      }
   }
}
