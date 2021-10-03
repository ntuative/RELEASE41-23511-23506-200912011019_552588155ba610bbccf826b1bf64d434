package com.sulake.habbo.communication.messages.incoming.room.engine
{
   public class PublicRoomObjectMessageData
   {
       
      
      private var var_914:int = 0;
      
      private var var_89:Number = 0;
      
      private var _y:Number = 0;
      
      private var var_201:Boolean = false;
      
      private var var_225:int = 0;
      
      private var _type:String = "";
      
      private var _name:String = "";
      
      private var var_88:Number = 0;
      
      private var var_912:int = 0;
      
      public function PublicRoomObjectMessageData()
      {
         super();
      }
      
      public function set z(param1:Number) : void
      {
         if(!var_201)
         {
            var_89 = param1;
         }
      }
      
      public function get sizeY() : int
      {
         return var_914;
      }
      
      public function get y() : Number
      {
         return _y;
      }
      
      public function get dir() : int
      {
         return var_225;
      }
      
      public function get name() : String
      {
         return _name;
      }
      
      public function set name(param1:String) : void
      {
         if(!var_201)
         {
            _name = param1;
         }
      }
      
      public function set dir(param1:int) : void
      {
         if(!var_201)
         {
            var_225 = param1;
         }
      }
      
      public function set y(param1:Number) : void
      {
         if(!var_201)
         {
            _y = param1;
         }
      }
      
      public function setReadOnly() : void
      {
         var_201 = true;
      }
      
      public function get z() : Number
      {
         return var_89;
      }
      
      public function set sizeY(param1:int) : void
      {
         if(!var_201)
         {
            var_914 = param1;
         }
      }
      
      public function set sizeX(param1:int) : void
      {
         if(!var_201)
         {
            var_912 = param1;
         }
      }
      
      public function set x(param1:Number) : void
      {
         if(!var_201)
         {
            var_88 = param1;
         }
      }
      
      public function get x() : Number
      {
         return var_88;
      }
      
      public function get type() : String
      {
         return _type;
      }
      
      public function set type(param1:String) : void
      {
         if(!var_201)
         {
            _type = param1;
         }
      }
      
      public function get sizeX() : int
      {
         return var_912;
      }
   }
}
