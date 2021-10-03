package com.sulake.habbo.room.object.visualization.furniture
{
   public class FurnitureQueueTileVisualization extends AnimatedFurnitureVisualization
   {
      
      private static const const_1090:int = 1;
      
      private static const const_1050:int = 3;
      
      private static const const_1088:int = 2;
      
      private static const const_1089:int = 15;
       
      
      private var var_827:int;
      
      private var var_217:Array;
      
      public function FurnitureQueueTileVisualization()
      {
         var_217 = new Array();
         super();
      }
      
      override protected function setAnimation(param1:int) : void
      {
         if(param1 == const_1088)
         {
            var_217 = new Array();
            var_217.push(const_1090);
            var_827 = const_1089;
         }
         super.setAnimation(param1);
      }
      
      override protected function updateAnimation(param1:Number) : Boolean
      {
         if(var_827 > 0)
         {
            --var_827;
         }
         if(var_827 == 0)
         {
            if(false)
            {
               super.setAnimation(var_217.shift());
            }
         }
         return super.updateAnimation(param1);
      }
   }
}
