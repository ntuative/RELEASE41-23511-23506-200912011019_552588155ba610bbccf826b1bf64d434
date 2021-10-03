package com.sulake.habbo.room.messages
{
   public class RoomObjectAvatarFigureUpdateMessage extends RoomObjectUpdateStateMessage
   {
       
      
      private var var_1751:String;
      
      private var var_514:String;
      
      public function RoomObjectAvatarFigureUpdateMessage(param1:String, param2:String = "")
      {
         super();
         var_514 = param1;
         var_1751 = param2;
      }
      
      public function get race() : String
      {
         return var_1751;
      }
      
      public function get figure() : String
      {
         return var_514;
      }
   }
}
