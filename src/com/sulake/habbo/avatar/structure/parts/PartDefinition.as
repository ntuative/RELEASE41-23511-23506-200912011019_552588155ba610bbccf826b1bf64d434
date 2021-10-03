package com.sulake.habbo.avatar.structure.parts
{
   public class PartDefinition
   {
       
      
      private var _removeSetType:String;
      
      private var var_1317:int = -1;
      
      private var var_1059:Boolean;
      
      private var var_1058:String;
      
      private var var_1589:String;
      
      public function PartDefinition(param1:XML)
      {
         super();
         var_1589 = String(param1["set-type"]);
         var_1058 = String(param1["flipped-set-type"]);
         _removeSetType = String(param1["remove-set-type"]);
         var_1059 = false;
      }
      
      public function hasStaticId() : Boolean
      {
         return var_1317 >= 0;
      }
      
      public function get flippedSetType() : String
      {
         return var_1058;
      }
      
      public function get staticId() : int
      {
         return var_1317;
      }
      
      public function set staticId(param1:int) : void
      {
         var_1317 = param1;
      }
      
      public function get appendToFigure() : Boolean
      {
         return var_1059;
      }
      
      public function set appendToFigure(param1:Boolean) : void
      {
         var_1059 = param1;
      }
      
      public function set flippedSetType(param1:String) : void
      {
         var_1058 = param1;
      }
      
      public function get setType() : String
      {
         return var_1589;
      }
      
      public function get removeSetType() : String
      {
         return _removeSetType;
      }
   }
}
