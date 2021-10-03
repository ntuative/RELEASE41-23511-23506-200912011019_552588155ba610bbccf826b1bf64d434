package com.sulake.habbo.communication.messages.incoming.room.engine
{
   public class UserMessageData
   {
      
      public static const const_1100:String = "F";
      
      public static const const_918:String = "M";
       
      
      private var var_88:Number = 0;
      
      private var var_514:String = "";
      
      private var var_2038:int = 0;
      
      private var var_2039:String = "";
      
      private var var_2037:int = 0;
      
      private var var_1949:int = 0;
      
      private var var_2036:String = "";
      
      private var var_1219:String = "";
      
      private var _id:int = 0;
      
      private var var_201:Boolean = false;
      
      private var var_225:int = 0;
      
      private var var_2035:String = "";
      
      private var _name:String = "";
      
      private var var_1950:int = 0;
      
      private var _y:Number = 0;
      
      private var var_89:Number = 0;
      
      public function UserMessageData(param1:int)
      {
         super();
         _id = param1;
      }
      
      public function get z() : Number
      {
         return var_89;
      }
      
      public function get name() : String
      {
         return _name;
      }
      
      public function get dir() : int
      {
         return var_225;
      }
      
      public function set dir(param1:int) : void
      {
         if(!var_201)
         {
            var_225 = param1;
         }
      }
      
      public function set name(param1:String) : void
      {
         if(!var_201)
         {
            _name = param1;
         }
      }
      
      public function get id() : int
      {
         return _id;
      }
      
      public function get userType() : int
      {
         return var_2038;
      }
      
      public function set groupStatus(param1:int) : void
      {
         if(!var_201)
         {
            var_2037 = param1;
         }
      }
      
      public function get subType() : String
      {
         return var_2035;
      }
      
      public function set groupID(param1:String) : void
      {
         if(!var_201)
         {
            var_2036 = param1;
         }
      }
      
      public function set subType(param1:String) : void
      {
         if(!var_201)
         {
            var_2035 = param1;
         }
      }
      
      public function set xp(param1:int) : void
      {
         if(!var_201)
         {
            var_1949 = param1;
         }
      }
      
      public function set figure(param1:String) : void
      {
         if(!var_201)
         {
            var_514 = param1;
         }
      }
      
      public function set userType(param1:int) : void
      {
         if(!var_201)
         {
            var_2038 = param1;
         }
      }
      
      public function set sex(param1:String) : void
      {
         if(!var_201)
         {
            var_1219 = param1;
         }
      }
      
      public function get groupStatus() : int
      {
         return var_2037;
      }
      
      public function get groupID() : String
      {
         return var_2036;
      }
      
      public function set webID(param1:int) : void
      {
         if(!var_201)
         {
            var_1950 = param1;
         }
      }
      
      public function set custom(param1:String) : void
      {
         if(!var_201)
         {
            var_2039 = param1;
         }
      }
      
      public function setReadOnly() : void
      {
         var_201 = true;
      }
      
      public function get sex() : String
      {
         return var_1219;
      }
      
      public function get figure() : String
      {
         return var_514;
      }
      
      public function get webID() : int
      {
         return var_1950;
      }
      
      public function get custom() : String
      {
         return var_2039;
      }
      
      public function set y(param1:Number) : void
      {
         if(!var_201)
         {
            _y = param1;
         }
      }
      
      public function set z(param1:Number) : void
      {
         if(!var_201)
         {
            var_89 = param1;
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
      
      public function get y() : Number
      {
         return _y;
      }
      
      public function get xp() : int
      {
         return var_1949;
      }
   }
}
