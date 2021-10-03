package com.sulake.habbo.room.object.visualization.furniture
{
   public class FurnitureHabboWheelVisualization extends AnimatedFurnitureVisualization
   {
      
      private static const const_1051:int = 31;
      
      private static const const_1050:int = 32;
      
      private static const const_739:int = 10;
      
      private static const const_480:int = 20;
       
      
      private var var_518:Boolean = false;
      
      private var var_217:Array;
      
      public function FurnitureHabboWheelVisualization()
      {
         var_217 = new Array();
         super();
      }
      
      override protected function setAnimation(param1:int) : void
      {
         if(param1 == -1)
         {
            var_518 = true;
            var_217 = new Array();
            var_217.push(const_1051);
            var_217.push(const_1050);
            return;
         }
         if(param1 > 0 && param1 <= const_739)
         {
            if(var_518)
            {
               var_518 = false;
               var_217 = new Array();
               var_217.push(const_739 + param1);
               var_217.push(const_480 + param1);
               var_217.push(param1);
               return;
            }
            super.setAnimation(param1);
         }
      }
      
      override protected function updateAnimation(param1:Number) : Boolean
      {
         if(super.getLastFramePlayed(1) && super.getLastFramePlayed(2) && super.getLastFramePlayed(3))
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
