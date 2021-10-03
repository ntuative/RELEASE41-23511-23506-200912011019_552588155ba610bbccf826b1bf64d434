package com.sulake.habbo.room.object.visualization.furniture
{
   public class FurnitureValRandomizerVisualization extends AnimatedFurnitureVisualization
   {
      
      private static const const_1051:int = 31;
      
      private static const const_1050:int = 32;
      
      private static const const_479:int = 30;
      
      private static const const_739:int = 20;
      
      private static const const_480:int = 10;
       
      
      private var var_518:Boolean = false;
      
      private var var_217:Array;
      
      public function FurnitureValRandomizerVisualization()
      {
         var_217 = new Array();
         super();
         super.setAnimation(const_479);
      }
      
      override protected function setAnimation(param1:int) : void
      {
         if(param1 == 0)
         {
            var_518 = true;
            var_217 = new Array();
            var_217.push(const_1051);
            var_217.push(const_1050);
            return;
         }
         if(param1 > 0 && param1 <= const_480)
         {
            if(var_518)
            {
               var_518 = false;
               var_217 = new Array();
               if(_direction == 2)
               {
                  var_217.push(const_739 + 5 - param1);
                  var_217.push(const_480 + 5 - param1);
               }
               else
               {
                  var_217.push(const_739 + param1);
                  var_217.push(const_480 + param1);
               }
               var_217.push(const_479);
               return;
            }
            super.setAnimation(const_479);
         }
      }
      
      override protected function updateAnimation(param1:Number) : Boolean
      {
         if(super.getLastFramePlayed(11))
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
