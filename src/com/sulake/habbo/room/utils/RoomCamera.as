package com.sulake.habbo.room.utils
{
   import com.sulake.room.utils.IVector3d;
   import com.sulake.room.utils.Vector3d;
   
   public class RoomCamera
   {
      
      private static const const_337:Number = 0.5;
      
      private static const const_744:int = 3;
      
      private static const const_1064:Number = 1;
       
      
      private var var_1856:Boolean = false;
      
      private var var_1859:int = -2;
      
      private var _limitedLocX:Boolean = false;
      
      private var var_1860:Boolean = false;
      
      private var var_1862:Boolean = false;
      
      private var var_1858:int = -1;
      
      private var var_958:int = 0;
      
      private var var_255:Vector3d = null;
      
      private var var_381:Vector3d = null;
      
      private var var_1861:int = 0;
      
      private var var_1857:int = 0;
      
      public function RoomCamera()
      {
         super();
      }
      
      public function dispose() : void
      {
         var_381 = null;
         var_255 = null;
      }
      
      public function set centeredLocX(param1:Boolean) : void
      {
         var_1856 = param1;
      }
      
      public function get limitedLocationX() : Boolean
      {
         return _limitedLocX;
      }
      
      public function get limitedLocationY() : Boolean
      {
         return var_1860;
      }
      
      public function update(param1:uint) : void
      {
         var _loc2_:* = null;
         if(var_381 != null && var_255 != null)
         {
            ++var_958;
            _loc2_ = Vector3d.dif(var_381,var_255);
            if(_loc2_.length <= const_337)
            {
               var_255 = var_381;
               var_381 = null;
            }
            else
            {
               _loc2_.div(_loc2_.length);
               if(_loc2_.length < const_337 * (const_744 + 1))
               {
                  _loc2_.mul(const_337);
               }
               else if(var_958 <= const_744)
               {
                  _loc2_.mul(const_337);
               }
               else
               {
                  _loc2_.mul(const_1064);
               }
               var_255 = Vector3d.sum(var_255,_loc2_);
            }
         }
      }
      
      public function set limitedLocationX(param1:Boolean) : void
      {
         _limitedLocX = param1;
      }
      
      public function get screenWd() : int
      {
         return var_1861;
      }
      
      public function set centeredLocY(param1:Boolean) : void
      {
         var_1862 = param1;
      }
      
      public function get targetId() : int
      {
         return var_1858;
      }
      
      public function set targetCategory(param1:int) : void
      {
         var_1859 = param1;
      }
      
      public function set target(param1:IVector3d) : void
      {
         if(var_381 == null)
         {
            var_381 = new Vector3d();
         }
         var_381.assign(param1);
         var_958 = 0;
      }
      
      public function set limitedLocationY(param1:Boolean) : void
      {
         var_1860 = param1;
      }
      
      public function initializeLocation(param1:IVector3d) : void
      {
         if(var_255 != null)
         {
            return;
         }
         var_255 = new Vector3d();
         var_255.assign(param1);
      }
      
      public function get screenHt() : int
      {
         return var_1857;
      }
      
      public function get targetCategory() : int
      {
         return var_1859;
      }
      
      public function set screenWd(param1:int) : void
      {
         var_1861 = param1;
      }
      
      public function get centeredLocX() : Boolean
      {
         return var_1856;
      }
      
      public function get centeredLocY() : Boolean
      {
         return var_1862;
      }
      
      public function get location() : IVector3d
      {
         return var_255;
      }
      
      public function set targetId(param1:int) : void
      {
         var_1858 = param1;
      }
      
      public function set screenHt(param1:int) : void
      {
         var_1857 = param1;
      }
   }
}
