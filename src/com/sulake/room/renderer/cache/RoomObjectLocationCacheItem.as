package com.sulake.room.renderer.cache
{
   import com.sulake.room.utils.IVector3d;
   import com.sulake.room.utils.Vector3d;
   
   public class RoomObjectLocationCacheItem
   {
       
      
      private var var_2135:int = -1;
      
      private var var_1262:int = -1;
      
      private var var_694:Vector3d = null;
      
      public function RoomObjectLocationCacheItem()
      {
         super();
         var_694 = new Vector3d();
      }
      
      public function get objectUpdateId() : int
      {
         return var_2135;
      }
      
      public function set objectUpdateId(param1:int) : void
      {
         var_2135 = param1;
      }
      
      public function set screenLoc(param1:IVector3d) : void
      {
         var_694.assign(param1);
         var_694.x = Math.round(var_694.x);
         var_694.y = Math.round(var_694.y);
      }
      
      public function set geometryUpdateId(param1:int) : void
      {
         var_1262 = param1;
      }
      
      public function get screenLoc() : IVector3d
      {
         return var_694;
      }
      
      public function get geometryUpdateId() : int
      {
         return var_1262;
      }
   }
}
