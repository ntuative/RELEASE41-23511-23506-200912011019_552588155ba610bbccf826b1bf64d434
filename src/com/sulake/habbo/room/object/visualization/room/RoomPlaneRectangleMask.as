package com.sulake.habbo.room.object.visualization.room
{
   public class RoomPlaneRectangleMask
   {
       
      
      private var var_1609:Number = 0;
      
      private var var_1611:Number = 0;
      
      private var var_1608:Number = 0;
      
      private var var_1610:Number = 0;
      
      public function RoomPlaneRectangleMask(param1:Number, param2:Number, param3:Number, param4:Number)
      {
         super();
         var_1611 = param1;
         var_1608 = param2;
         var_1609 = param3;
         var_1610 = param4;
      }
      
      public function get leftSideLoc() : Number
      {
         return var_1611;
      }
      
      public function get leftSideLength() : Number
      {
         return var_1609;
      }
      
      public function get rightSideLoc() : Number
      {
         return var_1608;
      }
      
      public function get rightSideLength() : Number
      {
         return var_1610;
      }
   }
}
