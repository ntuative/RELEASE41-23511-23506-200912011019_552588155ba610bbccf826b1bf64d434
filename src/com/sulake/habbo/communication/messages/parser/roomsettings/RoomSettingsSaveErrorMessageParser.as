package com.sulake.habbo.communication.messages.parser.roomsettings
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class RoomSettingsSaveErrorMessageParser implements IMessageParser
   {
      
      public static const const_1385:int = 9;
      
      public static const const_1469:int = 4;
      
      public static const const_1531:int = 1;
      
      public static const const_1207:int = 10;
      
      public static const const_1401:int = 2;
      
      public static const const_1214:int = 7;
      
      public static const const_1319:int = 11;
      
      public static const const_1511:int = 3;
      
      public static const const_1217:int = 8;
      
      public static const const_1230:int = 5;
      
      public static const const_1533:int = 6;
      
      public static const const_1329:int = 12;
       
      
      private var var_1957:String;
      
      private var _roomId:int;
      
      private var var_1144:int;
      
      public function RoomSettingsSaveErrorMessageParser()
      {
         super();
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function get info() : String
      {
         return var_1957;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         _roomId = param1.readInteger();
         var_1144 = param1.readInteger();
         var_1957 = param1.readString();
         return true;
      }
      
      public function get errorCode() : int
      {
         return var_1144;
      }
      
      public function get roomId() : int
      {
         return _roomId;
      }
   }
}
