package com.sulake.habbo.communication.messages.incoming.room.engine
{
   public class ItemMessageData
   {
       
      
      private var var_89:Number = 0;
      
      private var _data:String = "";
      
      private var var_2253:int = 0;
      
      private var _state:int = 0;
      
      private var _type:int = 0;
      
      private var _y:Number = 0;
      
      private var var_1970:Boolean = false;
      
      private var var_2252:String = "";
      
      private var _id:int = 0;
      
      private var var_201:Boolean = false;
      
      private var var_225:String = "";
      
      private var var_1972:int = 0;
      
      private var var_1971:int = 0;
      
      private var var_1643:int = 0;
      
      private var var_1642:int = 0;
      
      public function ItemMessageData(param1:int, param2:int, param3:Boolean)
      {
         super();
         _id = param1;
         _type = param2;
         var_1970 = param3;
      }
      
      public function set y(param1:Number) : void
      {
         if(!var_201)
         {
            _y = param1;
         }
      }
      
      public function get isOldFormat() : Boolean
      {
         return var_1970;
      }
      
      public function set type(param1:int) : void
      {
         if(!var_201)
         {
            _type = param1;
         }
      }
      
      public function get dir() : String
      {
         return var_225;
      }
      
      public function get state() : int
      {
         return _state;
      }
      
      public function set localX(param1:Number) : void
      {
         if(!var_201)
         {
            var_1643 = param1;
         }
      }
      
      public function get id() : int
      {
         return _id;
      }
      
      public function set wallX(param1:Number) : void
      {
         if(!var_201)
         {
            var_1972 = param1;
         }
      }
      
      public function set wallY(param1:Number) : void
      {
         if(!var_201)
         {
            var_1971 = param1;
         }
      }
      
      public function set dir(param1:String) : void
      {
         if(!var_201)
         {
            var_225 = param1;
         }
      }
      
      public function get data() : String
      {
         return _data;
      }
      
      public function set localY(param1:Number) : void
      {
         if(!var_201)
         {
            var_1642 = param1;
         }
      }
      
      public function set state(param1:int) : void
      {
         if(!var_201)
         {
            _state = param1;
         }
      }
      
      public function get type() : int
      {
         return _type;
      }
      
      public function get localX() : Number
      {
         return var_1643;
      }
      
      public function set data(param1:String) : void
      {
         if(!var_201)
         {
            _data = param1;
         }
      }
      
      public function get wallX() : Number
      {
         return var_1972;
      }
      
      public function get wallY() : Number
      {
         return var_1971;
      }
      
      public function get localY() : Number
      {
         return var_1642;
      }
      
      public function setReadOnly() : void
      {
         var_201 = true;
      }
      
      public function get y() : Number
      {
         return _y;
      }
      
      public function get z() : Number
      {
         return var_89;
      }
      
      public function set z(param1:Number) : void
      {
         if(!var_201)
         {
            var_89 = param1;
         }
      }
   }
}
