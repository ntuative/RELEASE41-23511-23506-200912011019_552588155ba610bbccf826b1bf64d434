package com.sulake.habbo.session.furniture
{
   public class FurnitureData implements IFurnitureData
   {
      
      public static const const_1404:String = "e";
      
      public static const const_1483:String = "i";
      
      public static const const_1430:String = "s";
       
      
      private var _id:int;
      
      private var _title:String;
      
      private var _type:String;
      
      private var var_2053:int;
      
      private var var_1265:Array;
      
      private var var_2051:int;
      
      private var var_2052:int;
      
      private var var_2050:int;
      
      private var _name:String;
      
      private var var_2049:int;
      
      private var var_1208:String;
      
      public function FurnitureData(param1:String, param2:int, param3:String, param4:int, param5:int, param6:int, param7:int, param8:int, param9:Array, param10:String, param11:String)
      {
         super();
         _type = param1;
         _id = param2;
         _name = param3;
         var_2053 = param4;
         var_2049 = param5;
         var_2051 = param6;
         var_2052 = param7;
         var_2050 = param8;
         var_1265 = param9;
         _title = param10;
         var_1208 = param11;
      }
      
      public function get tileSizeY() : int
      {
         return var_2052;
      }
      
      public function get tileSizeZ() : int
      {
         return var_2050;
      }
      
      public function get name() : String
      {
         return _name;
      }
      
      public function get type() : String
      {
         return _type;
      }
      
      public function get title() : String
      {
         return _title;
      }
      
      public function get revision() : int
      {
         return var_2049;
      }
      
      public function get id() : int
      {
         return _id;
      }
      
      public function get colourIndex() : int
      {
         return var_2053;
      }
      
      public function get tileSizeX() : int
      {
         return var_2051;
      }
      
      public function get colours() : Array
      {
         return var_1265;
      }
      
      public function get description() : String
      {
         return var_1208;
      }
   }
}
