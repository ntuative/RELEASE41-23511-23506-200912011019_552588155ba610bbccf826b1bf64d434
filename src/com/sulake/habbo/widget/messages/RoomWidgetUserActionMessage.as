package com.sulake.habbo.widget.messages
{
   public class RoomWidgetUserActionMessage extends RoomWidgetMessage
   {
      
      public static const const_709:String = "RWUAM_RESPECT_USER";
      
      public static const const_715:String = "RWUAM_GIVE_RIGHTS";
      
      public static const const_562:String = "RWUAM_START_TRADING";
      
      public static const const_650:String = "RWUAM_TAKE_RIGHTS";
      
      public static const const_563:String = "RWUAM_WHISPER_USER";
      
      public static const const_692:String = "RWUAM_IGNORE_USER";
      
      public static const const_362:String = "RWUAM_REQUEST_PET_UPDATE";
      
      public static const const_631:String = "RWUAM_BAN_USER";
      
      public static const const_721:String = "RWUAM_UNIGNORE_USER";
      
      public static const const_429:String = "RWUAM_KICK_USER";
      
      public static const const_706:String = "RWUAM_SEND_FRIEND_REQUEST";
      
      public static const const_559:String = " RWUAM_RESPECT_PET";
      
      public static const const_423:String = "RWUAM_KICK_BOT";
      
      public static const const_1299:String = "RWUAM_TRAIN_PET";
      
      public static const const_636:String = "RWUAM_PICKUP_PET";
      
      public static const const_509:String = "RWUAM_OPEN_HOME_PAGE";
      
      public static const const_725:String = "RWUAM_REPORT";
       
      
      private var _userId:int = 0;
      
      public function RoomWidgetUserActionMessage(param1:String, param2:int = 0)
      {
         super(param1);
         _userId = param2;
      }
      
      public function get userId() : int
      {
         return _userId;
      }
   }
}
