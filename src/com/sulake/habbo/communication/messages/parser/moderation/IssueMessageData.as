package com.sulake.habbo.communication.messages.parser.moderation
{
   import flash.utils.getTimer;
   
   public class IssueMessageData
   {
      
      public static const const_139:int = 1;
      
      public static const const_1191:int = 3;
      
      public static const const_417:int = 2;
       
      
      private var var_1551:int;
      
      private var var_1549:int;
      
      private var var_1553:int;
      
      private var var_1557:int;
      
      private var _state:int;
      
      private var var_366:int;
      
      private var var_1063:int;
      
      private var var_1545:int;
      
      private var var_999:int;
      
      private var _roomResources:String;
      
      private var var_1547:int;
      
      private var var_1556:int;
      
      private var var_1548:String;
      
      private var var_1555:String;
      
      private var var_1550:int = 0;
      
      private var var_1254:String;
      
      private var _message:String;
      
      private var var_1554:int;
      
      private var var_1546:String;
      
      private var var_1175:int;
      
      private var var_604:String;
      
      private var var_1552:String;
      
      private var var_1305:int;
      
      public function IssueMessageData()
      {
         super();
      }
      
      public function set reportedUserId(param1:int) : void
      {
         var_999 = param1;
      }
      
      public function set temporalPriority(param1:int) : void
      {
         var_1550 = param1;
      }
      
      public function get reporterUserId() : int
      {
         return var_1556;
      }
      
      public function set roomName(param1:String) : void
      {
         var_604 = param1;
      }
      
      public function set chatRecordId(param1:int) : void
      {
         var_1547 = param1;
      }
      
      public function get state() : int
      {
         return _state;
      }
      
      public function get roomResources() : String
      {
         return _roomResources;
      }
      
      public function set roomResources(param1:String) : void
      {
         _roomResources = param1;
      }
      
      public function get roomName() : String
      {
         return var_604;
      }
      
      public function get message() : String
      {
         return _message;
      }
      
      public function set worldId(param1:int) : void
      {
         var_1557 = param1;
      }
      
      public function set state(param1:int) : void
      {
         _state = param1;
      }
      
      public function get unitPort() : int
      {
         return var_1549;
      }
      
      public function get priority() : int
      {
         return var_1551 + var_1550;
      }
      
      public function set issueId(param1:int) : void
      {
         var_1545 = param1;
      }
      
      public function get pickerUserName() : String
      {
         return var_1555;
      }
      
      public function getOpenTime() : String
      {
         var _loc1_:int = (getTimer() - var_1305) / 1000;
         var _loc2_:int = _loc1_ % 60;
         var _loc3_:int = _loc1_ / 60;
         var _loc4_:int = _loc3_ % 60;
         var _loc5_:int = _loc3_ / 60;
         var _loc6_:String = _loc2_ < 10 ? "0" + _loc2_ : "" + _loc2_;
         var _loc7_:String = _loc4_ < 10 ? "0" + _loc4_ : "" + _loc4_;
         var _loc8_:String = _loc5_ < 10 ? "0" + _loc5_ : "" + _loc5_;
         return _loc8_ + ":" + _loc7_ + ":" + _loc6_;
      }
      
      public function get categoryId() : int
      {
         return var_1175;
      }
      
      public function set reporterUserId(param1:int) : void
      {
         var_1556 = param1;
      }
      
      public function get roomType() : int
      {
         return var_1063;
      }
      
      public function set flatType(param1:String) : void
      {
         var_1548 = param1;
      }
      
      public function get chatRecordId() : int
      {
         return var_1547;
      }
      
      public function set message(param1:String) : void
      {
         _message = param1;
      }
      
      public function get worldId() : int
      {
         return var_1557;
      }
      
      public function set flatOwnerName(param1:String) : void
      {
         var_1552 = param1;
      }
      
      public function set reportedUserName(param1:String) : void
      {
         var_1254 = param1;
      }
      
      public function get issueId() : int
      {
         return var_1545;
      }
      
      public function set priority(param1:int) : void
      {
         var_1551 = param1;
      }
      
      public function set unitPort(param1:int) : void
      {
         var_1549 = param1;
      }
      
      public function get flatType() : String
      {
         return var_1548;
      }
      
      public function set reportedCategoryId(param1:int) : void
      {
         var_1553 = param1;
      }
      
      public function set pickerUserName(param1:String) : void
      {
         var_1555 = param1;
      }
      
      public function set pickerUserId(param1:int) : void
      {
         var_1554 = param1;
      }
      
      public function get reportedUserName() : String
      {
         return var_1254;
      }
      
      public function set roomType(param1:int) : void
      {
         var_1063 = param1;
      }
      
      public function get reportedCategoryId() : int
      {
         return var_1553;
      }
      
      public function set flatId(param1:int) : void
      {
         var_366 = param1;
      }
      
      public function set categoryId(param1:int) : void
      {
         var_1175 = param1;
      }
      
      public function set timeStamp(param1:int) : void
      {
         var_1305 = param1;
      }
      
      public function get pickerUserId() : int
      {
         return var_1554;
      }
      
      public function set reporterUserName(param1:String) : void
      {
         var_1546 = param1;
      }
      
      public function get timeStamp() : int
      {
         return var_1305;
      }
      
      public function get reportedUserId() : int
      {
         return var_999;
      }
      
      public function get flatId() : int
      {
         return var_366;
      }
      
      public function get flatOwnerName() : String
      {
         return var_1552;
      }
      
      public function get reporterUserName() : String
      {
         return var_1546;
      }
   }
}
