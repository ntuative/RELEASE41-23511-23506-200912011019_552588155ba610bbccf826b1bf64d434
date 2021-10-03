package com.sulake.habbo.room.utils
{
   public class PublicRoomWorldData
   {
       
      
      private var var_1888:Number = 1;
      
      private var var_191:Number = 1;
      
      private var var_1638:String = "";
      
      public function PublicRoomWorldData(param1:String, param2:Number, param3:Number)
      {
         super();
         var_1638 = param1;
         var_191 = param2;
         var_1888 = param3;
      }
      
      public function get scale() : Number
      {
         return var_191;
      }
      
      public function get heightScale() : Number
      {
         return var_1888;
      }
   }
}
