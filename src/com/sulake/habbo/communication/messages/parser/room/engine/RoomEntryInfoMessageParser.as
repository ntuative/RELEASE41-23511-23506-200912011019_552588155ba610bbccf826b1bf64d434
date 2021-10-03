package com.sulake.habbo.communication.messages.parser.room.engine
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   import com.sulake.habbo.communication.messages.incoming.navigator.PublicRoomShortData;
   
   public class RoomEntryInfoMessageParser implements IMessageParser
   {
       
      
      private var var_1870:int;
      
      private var var_365:Boolean;
      
      private var var_1869:Boolean;
      
      private var var_772:PublicRoomShortData;
      
      public function RoomEntryInfoMessageParser()
      {
         super();
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         this.var_1869 = param1.readBoolean();
         if(var_1869)
         {
            var_1870 = param1.readInteger();
            var_365 = param1.readBoolean();
         }
         else
         {
            var_772 = new PublicRoomShortData(param1);
         }
         return true;
      }
      
      public function flush() : Boolean
      {
         if(var_772 != null)
         {
            var_772.dispose();
            var_772 = null;
         }
         return true;
      }
      
      public function get guestRoomId() : int
      {
         return var_1870;
      }
      
      public function get owner() : Boolean
      {
         return var_365;
      }
      
      public function get guestRoom() : Boolean
      {
         return var_1869;
      }
      
      public function get publicSpace() : PublicRoomShortData
      {
         return var_772;
      }
   }
}
