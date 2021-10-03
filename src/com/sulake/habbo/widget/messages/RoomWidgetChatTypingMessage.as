package com.sulake.habbo.widget.messages
{
   public class RoomWidgetChatTypingMessage extends RoomWidgetMessage
   {
      
      public static const const_590:String = "RWCTM_TYPING_STATUS";
       
      
      private var var_452:Boolean;
      
      public function RoomWidgetChatTypingMessage(param1:Boolean)
      {
         super(const_590);
         var_452 = param1;
      }
      
      public function get isTyping() : Boolean
      {
         return var_452;
      }
   }
}
