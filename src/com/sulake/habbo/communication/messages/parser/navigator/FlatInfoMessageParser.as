package com.sulake.habbo.communication.messages.parser.navigator
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   import com.sulake.habbo.communication.messages.incoming.navigator.RoomSettingsFlatInfo;
   
   public class FlatInfoMessageParser implements IMessageParser
   {
       
      
      private var var_209:RoomSettingsFlatInfo;
      
      public function FlatInfoMessageParser()
      {
         super();
      }
      
      public function flush() : Boolean
      {
         var_209 = null;
         return true;
      }
      
      public function get flatInfo() : RoomSettingsFlatInfo
      {
         return var_209;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var_209 = new RoomSettingsFlatInfo();
         var_209.allowFurniMoving = param1.readInteger() == 1;
         var_209.doorMode = param1.readInteger();
         var_209.id = param1.readInteger();
         var_209.ownerName = param1.readString();
         var_209.type = param1.readString();
         var_209.name = param1.readString();
         var_209.description = param1.readString();
         var_209.showOwnerName = param1.readInteger() == 1;
         var_209.allowTrading = param1.readInteger() == 1;
         var_209.categoryAlertKey = param1.readInteger() == 1;
         return true;
      }
   }
}
