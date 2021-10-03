package com.sulake.habbo.room.object.visualization.furniture.data
{
   public class AnimationFrame
   {
      
      public static const const_492:int = -1;
      
      public static const const_972:int = -1;
       
      
      private var _y:int = 0;
      
      private var var_1999:int = -1;
      
      private var var_88:int = 0;
      
      private var var_1231:int = 1;
      
      private var var_805:int = 1;
      
      private var var_2000:Boolean = false;
      
      private var var_2001:int = 0;
      
      private var _id:int = 0;
      
      public function AnimationFrame(param1:int, param2:int, param3:int, param4:int, param5:Boolean, param6:int = -1, param7:int = 0)
      {
         super();
         _id = param1;
         var_88 = param2;
         _y = param3;
         var_2000 = param5;
         if(param4 < 0)
         {
            param4 = const_492;
         }
         var_805 = param4;
         var_1231 = param4;
         if(param6 >= 0)
         {
            var_1999 = param6;
            var_2001 = param7;
         }
      }
      
      public function get y() : int
      {
         return _y;
      }
      
      public function set remainingFrameRepeats(param1:int) : void
      {
         if(param1 < 0)
         {
            param1 = 0;
         }
         if(var_805 > 0 && param1 > var_805)
         {
            param1 = var_805;
         }
         var_1231 = param1;
      }
      
      public function get frameRepeats() : int
      {
         return var_805;
      }
      
      public function get activeSequenceOffset() : int
      {
         return var_2001;
      }
      
      public function get id() : int
      {
         if(_id >= 0)
         {
            return _id;
         }
         return -_id * Math.random();
      }
      
      public function get remainingFrameRepeats() : int
      {
         if(var_805 < 0)
         {
            return const_492;
         }
         return var_1231;
      }
      
      public function get activeSequence() : int
      {
         return var_1999;
      }
      
      public function get isLastFrame() : Boolean
      {
         return var_2000;
      }
      
      public function get x() : int
      {
         return var_88;
      }
   }
}
