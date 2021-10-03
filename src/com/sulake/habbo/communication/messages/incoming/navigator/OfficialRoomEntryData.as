package com.sulake.habbo.communication.messages.incoming.navigator
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.runtime.IDisposable;
   
   public class OfficialRoomEntryData implements IDisposable
   {
      
      public static const const_875:int = 4;
      
      public static const TYPE_PUBLIC_SPACE:int = 3;
      
      public static const const_539:int = 2;
      
      public static const const_884:int = 1;
       
      
      private var var_1730:String;
      
      private var _disposed:Boolean;
      
      private var var_1569:int;
      
      private var var_1729:Boolean;
      
      private var var_751:String;
      
      private var var_744:PublicRoomData;
      
      private var _index:int;
      
      private var var_1731:String;
      
      private var _type:int;
      
      private var var_1613:String;
      
      private var var_743:GuestRoomData;
      
      private var var_1732:String;
      
      private var var_1728:int;
      
      public function OfficialRoomEntryData(param1:int, param2:IMessageDataWrapper)
      {
         super();
         _index = param1;
         var_1730 = param2.readString();
         var_1732 = param2.readString();
         var_1729 = param2.readInteger() == 1;
         var_1731 = param2.readString();
         var_751 = param2.readString();
         var_1569 = param2.readInteger();
         _type = param2.readInteger();
         if(_type == const_884)
         {
            var_1613 = param2.readString();
         }
         else if(_type == TYPE_PUBLIC_SPACE)
         {
            var_744 = new PublicRoomData(param2);
         }
         else if(_type == const_539)
         {
            var_743 = new GuestRoomData(param2);
         }
         else if(_type == const_875)
         {
            var_1728 = param2.readInteger();
         }
      }
      
      public function get tag() : String
      {
         return var_1613;
      }
      
      public function get userCount() : int
      {
         return var_1569;
      }
      
      public function get index() : int
      {
         return _index;
      }
      
      public function get showDetails() : Boolean
      {
         return var_1729;
      }
      
      public function get picText() : String
      {
         return var_1731;
      }
      
      public function get maxUsers() : int
      {
         if(this.type == const_884)
         {
            return 0;
         }
         if(this.type == const_539)
         {
            return this.var_743.maxUserCount;
         }
         if(this.type == TYPE_PUBLIC_SPACE)
         {
            return this.var_744.maxUsers;
         }
         return 0;
      }
      
      public function get popupDesc() : String
      {
         return var_1732;
      }
      
      public function dispose() : void
      {
         if(_disposed)
         {
            return;
         }
         _disposed = true;
         if(this.var_743 != null)
         {
            this.var_743.dispose();
            this.var_743 = null;
         }
         if(this.var_744 != null)
         {
            this.var_744.dispose();
            this.var_744 = null;
         }
      }
      
      public function get popupCaption() : String
      {
         return var_1730;
      }
      
      public function get guestRoomData() : GuestRoomData
      {
         return var_743;
      }
      
      public function get picRef() : String
      {
         return var_751;
      }
      
      public function get flatCategoryId() : int
      {
         return var_1728;
      }
      
      public function get disposed() : Boolean
      {
         return _disposed;
      }
      
      public function get publicRoomData() : PublicRoomData
      {
         return var_744;
      }
      
      public function get type() : int
      {
         return _type;
      }
   }
}
