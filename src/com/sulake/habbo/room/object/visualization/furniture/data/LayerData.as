package com.sulake.habbo.room.object.visualization.furniture.data
{
   public class LayerData
   {
      
      public static const const_464:int = 255;
      
      public static const INK_DARKEN:int = 3;
      
      public static const const_548:int = 0;
      
      public static const const_808:int = 2;
      
      public static const const_856:int = 1;
      
      public static const const_687:Boolean = false;
      
      public static const const_545:String = "";
      
      public static const const_357:int = 0;
      
      public static const const_368:int = 0;
      
      public static const const_384:int = 0;
       
      
      private var var_1615:int = 0;
      
      private var var_1613:String = "";
      
      private var var_1500:int = 0;
      
      private var var_1612:int = 0;
      
      private var var_1614:Number = 0;
      
      private var var_1617:int = 255;
      
      private var var_1616:Boolean = false;
      
      public function LayerData()
      {
         super();
      }
      
      public function get yOffset() : int
      {
         return var_1615;
      }
      
      public function copyValues(param1:LayerData) : void
      {
         if(param1 != null)
         {
            tag = param1.tag;
            ink = param1.ink;
            alpha = param1.alpha;
            ignoreMouse = param1.ignoreMouse;
            xOffset = param1.xOffset;
            yOffset = param1.yOffset;
            zOffset = param1.zOffset;
         }
      }
      
      public function set ink(param1:int) : void
      {
         var_1500 = param1;
      }
      
      public function get zOffset() : Number
      {
         return var_1614;
      }
      
      public function set xOffset(param1:int) : void
      {
         var_1612 = param1;
      }
      
      public function set yOffset(param1:int) : void
      {
         var_1615 = param1;
      }
      
      public function get tag() : String
      {
         return var_1613;
      }
      
      public function get alpha() : int
      {
         return var_1617;
      }
      
      public function get ink() : int
      {
         return var_1500;
      }
      
      public function set zOffset(param1:Number) : void
      {
         var_1614 = param1;
      }
      
      public function get xOffset() : int
      {
         return var_1612;
      }
      
      public function set ignoreMouse(param1:Boolean) : void
      {
         var_1616 = param1;
      }
      
      public function get ignoreMouse() : Boolean
      {
         return var_1616;
      }
      
      public function set tag(param1:String) : void
      {
         var_1613 = param1;
      }
      
      public function set alpha(param1:int) : void
      {
         var_1617 = param1;
      }
   }
}
