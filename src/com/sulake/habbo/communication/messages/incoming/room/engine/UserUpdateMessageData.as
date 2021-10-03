package com.sulake.habbo.communication.messages.incoming.room.engine
{
   public class UserUpdateMessageData
   {
       
      
      private var _y:Number = 0;
      
      private var var_89:Number = 0;
      
      private var var_225:int = 0;
      
      private var var_1901:int = 0;
      
      private var var_1904:Number = 0;
      
      private var var_1902:Number = 0;
      
      private var var_1905:Number = 0;
      
      private var var_1900:Number = 0;
      
      private var var_1903:Boolean = false;
      
      private var var_88:Number = 0;
      
      private var _id:int = 0;
      
      private var var_190:Array;
      
      public function UserUpdateMessageData(param1:int, param2:Number, param3:Number, param4:Number, param5:Number, param6:int, param7:int, param8:Number, param9:Number, param10:Number, param11:Boolean, param12:Array)
      {
         var_190 = [];
         super();
         _id = param1;
         var_88 = param2;
         _y = param3;
         var_89 = param4;
         var_1900 = param5;
         var_225 = param6;
         var_1901 = param7;
         var_1904 = param8;
         var_1902 = param9;
         var_1905 = param10;
         var_1903 = param11;
         var_190 = param12;
      }
      
      public function get y() : Number
      {
         return _y;
      }
      
      public function get z() : Number
      {
         return var_89;
      }
      
      public function get dir() : int
      {
         return var_225;
      }
      
      public function get localZ() : Number
      {
         return var_1900;
      }
      
      public function get isMoving() : Boolean
      {
         return var_1903;
      }
      
      public function get id() : int
      {
         return _id;
      }
      
      public function get dirHead() : int
      {
         return var_1901;
      }
      
      public function get targetX() : Number
      {
         return var_1904;
      }
      
      public function get targetY() : Number
      {
         return var_1902;
      }
      
      public function get targetZ() : Number
      {
         return var_1905;
      }
      
      public function get x() : Number
      {
         return var_88;
      }
      
      public function get actions() : Array
      {
         return var_190.slice();
      }
   }
}
