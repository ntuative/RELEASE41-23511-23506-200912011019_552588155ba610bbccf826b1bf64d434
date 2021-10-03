package com.sulake.habbo.room.utils
{
   public class RoomInstanceData
   {
       
      
      private var var_725:LegacyWallGeometry = null;
      
      private var var_507:SelectedRoomObjectData = null;
      
      private var _roomCategory:int = 0;
      
      private var var_506:TileHeightMap = null;
      
      private var var_1638:String = null;
      
      private var _roomId:int = 0;
      
      private var var_726:RoomCamera = null;
      
      public function RoomInstanceData(param1:int, param2:int)
      {
         super();
         _roomId = param1;
         _roomCategory = param2;
         var_725 = new LegacyWallGeometry();
         var_726 = new RoomCamera();
      }
      
      public function set tileHeightMap(param1:TileHeightMap) : void
      {
         if(var_506 != null)
         {
            var_506.dispose();
         }
         var_506 = param1;
      }
      
      public function get roomId() : int
      {
         return _roomId;
      }
      
      public function set worldType(param1:String) : void
      {
         var_1638 = param1;
      }
      
      public function get legacyGeometry() : LegacyWallGeometry
      {
         return var_725;
      }
      
      public function get roomCamera() : RoomCamera
      {
         return var_726;
      }
      
      public function dispose() : void
      {
         if(var_506 != null)
         {
            var_506.dispose();
            var_506 = null;
         }
         if(var_725 != null)
         {
            var_725.dispose();
            var_725 = null;
         }
         if(var_726 != null)
         {
            var_726.dispose();
            var_726 = null;
         }
         if(var_507 != null)
         {
            var_507.dispose();
            var_507 = null;
         }
      }
      
      public function get tileHeightMap() : TileHeightMap
      {
         return var_506;
      }
      
      public function get worldType() : String
      {
         return var_1638;
      }
      
      public function set selectedObject(param1:SelectedRoomObjectData) : void
      {
         if(var_507 != null)
         {
            var_507.dispose();
         }
         var_507 = param1;
      }
      
      public function get roomCategory() : int
      {
         return _roomCategory;
      }
      
      public function get selectedObject() : SelectedRoomObjectData
      {
         return var_507;
      }
   }
}
