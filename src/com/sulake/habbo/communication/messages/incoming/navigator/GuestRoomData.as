package com.sulake.habbo.communication.messages.incoming.navigator
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.runtime.IDisposable;
   
   public class GuestRoomData implements IDisposable
   {
       
      
      private var _disposed:Boolean;
      
      private var var_1569:int;
      
      private var var_1571:String;
      
      private var var_1567:int;
      
      private var var_1568:int;
      
      private var var_650:Boolean;
      
      private var var_1564:Boolean;
      
      private var var_366:int;
      
      private var var_1208:String;
      
      private var var_1570:int;
      
      private var var_1175:int;
      
      private var _ownerName:String;
      
      private var var_604:String;
      
      private var var_1563:int;
      
      private var var_1565:RoomThumbnailData;
      
      private var var_1566:Boolean;
      
      private var var_577:Array;
      
      public function GuestRoomData(param1:IMessageDataWrapper)
      {
         var _loc4_:* = null;
         var_577 = new Array();
         super();
         var_366 = param1.readInteger();
         var_650 = param1.readBoolean();
         var_604 = param1.readString();
         _ownerName = param1.readString();
         var_1570 = param1.readInteger();
         var_1569 = param1.readInteger();
         var_1563 = param1.readInteger();
         var_1208 = param1.readString();
         var_1567 = param1.readInteger();
         var_1566 = param1.readBoolean();
         var_1568 = param1.readInteger();
         var_1175 = param1.readInteger();
         var_1571 = param1.readString();
         var _loc2_:int = param1.readInteger();
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_)
         {
            _loc4_ = param1.readString();
            var_577.push(_loc4_);
            _loc3_++;
         }
         var_1565 = new RoomThumbnailData(param1);
         var_1564 = param1.readBoolean();
      }
      
      public function get maxUserCount() : int
      {
         return var_1563;
      }
      
      public function get roomName() : String
      {
         return var_604;
      }
      
      public function get userCount() : int
      {
         return var_1569;
      }
      
      public function get score() : int
      {
         return var_1568;
      }
      
      public function get eventCreationTime() : String
      {
         return var_1571;
      }
      
      public function get allowTrading() : Boolean
      {
         return var_1566;
      }
      
      public function get tags() : Array
      {
         return var_577;
      }
      
      public function get allowPets() : Boolean
      {
         return var_1564;
      }
      
      public function get event() : Boolean
      {
         return var_650;
      }
      
      public function dispose() : void
      {
         if(_disposed)
         {
            return;
         }
         _disposed = true;
         this.var_577 = null;
      }
      
      public function get disposed() : Boolean
      {
         return _disposed;
      }
      
      public function get categoryId() : int
      {
         return var_1175;
      }
      
      public function get srchSpecPrm() : int
      {
         return var_1567;
      }
      
      public function get ownerName() : String
      {
         return _ownerName;
      }
      
      public function get thumbnail() : RoomThumbnailData
      {
         return var_1565;
      }
      
      public function get doorMode() : int
      {
         return var_1570;
      }
      
      public function get flatId() : int
      {
         return var_366;
      }
      
      public function get description() : String
      {
         return var_1208;
      }
   }
}
