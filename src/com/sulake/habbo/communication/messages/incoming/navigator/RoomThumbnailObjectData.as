package com.sulake.habbo.communication.messages.incoming.navigator
{
   public class RoomThumbnailObjectData
   {
       
      
      private var var_1321:int;
      
      private var var_1320:int;
      
      public function RoomThumbnailObjectData()
      {
         super();
      }
      
      public function get pos() : int
      {
         return var_1321;
      }
      
      public function set pos(param1:int) : void
      {
         this.var_1321 = param1;
      }
      
      public function getCopy() : RoomThumbnailObjectData
      {
         var _loc1_:RoomThumbnailObjectData = new RoomThumbnailObjectData();
         _loc1_.var_1321 = this.var_1321;
         _loc1_.var_1320 = this.var_1320;
         return _loc1_;
      }
      
      public function set imgId(param1:int) : void
      {
         this.var_1320 = param1;
      }
      
      public function get imgId() : int
      {
         return var_1320;
      }
   }
}
