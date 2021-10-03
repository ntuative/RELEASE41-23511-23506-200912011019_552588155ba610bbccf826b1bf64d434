package com.sulake.core.window.graphics.renderer
{
   import flash.geom.Rectangle;
   
   public class SkinLayoutEntity implements ISkinLayoutEntity
   {
      
      public static const const_237:uint = 1;
      
      public static const const_359:uint = 0;
      
      public static const const_937:uint = 8;
      
      public static const const_252:uint = 4;
      
      public static const const_389:uint = 2;
       
      
      private var var_406:uint;
      
      private var var_1721:uint;
      
      private var _color:uint;
      
      private var _name:String;
      
      private var var_1722:uint;
      
      private var var_101:Rectangle;
      
      private var var_577:Array;
      
      private var _id:uint;
      
      public function SkinLayoutEntity(param1:uint, param2:String, param3:Rectangle, param4:uint = 4.294967295E9, param5:uint = 100, param6:uint = 0, param7:uint = 0)
      {
         super();
         _id = param1;
         _name = param2;
         var_101 = param3;
         _color = param4;
         var_406 = param5;
         var_1721 = param6;
         var_1722 = param7;
         var_577 = new Array();
      }
      
      public function get scaleH() : uint
      {
         return var_1721;
      }
      
      public function get name() : String
      {
         return _name;
      }
      
      public function get blend() : uint
      {
         return var_406;
      }
      
      public function get scaleV() : uint
      {
         return var_1722;
      }
      
      public function get tags() : Array
      {
         return var_577;
      }
      
      public function get id() : uint
      {
         return _id;
      }
      
      public function dispose() : void
      {
         var_101 = null;
         var_577 = null;
      }
      
      public function get color() : uint
      {
         return _color;
      }
      
      public function get region() : Rectangle
      {
         return var_101;
      }
   }
}
