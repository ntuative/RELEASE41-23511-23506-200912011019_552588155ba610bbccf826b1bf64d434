package com.sulake.habbo.navigator.domain
{
   import com.sulake.habbo.communication.messages.incoming.navigator.FlatCategory;
   import com.sulake.habbo.communication.messages.incoming.navigator.GuestRoomData;
   import com.sulake.habbo.communication.messages.incoming.navigator.GuestRoomSearchResultData;
   import com.sulake.habbo.communication.messages.incoming.navigator.MsgWithRequestId;
   import com.sulake.habbo.communication.messages.incoming.navigator.OfficialRoomsData;
   import com.sulake.habbo.communication.messages.incoming.navigator.PopularRoomTagsData;
   import com.sulake.habbo.communication.messages.incoming.navigator.PublicRoomShortData;
   import com.sulake.habbo.communication.messages.incoming.navigator.RoomEventData;
   import com.sulake.habbo.communication.messages.parser.navigator.FavouritesMessageParser;
   import com.sulake.habbo.communication.messages.parser.navigator.NavigatorSettingsMessageParser;
   import com.sulake.habbo.communication.messages.parser.room.engine.RoomEntryInfoMessageParser;
   import com.sulake.habbo.navigator.HabboNavigator;
   import flash.utils.Dictionary;
   
   public class NavigatorData
   {
      
      private static const const_1367:int = 10;
       
      
      private var var_1398:NavigatorSettingsMessageParser;
      
      private var var_1170:int;
      
      private var var_1829:Boolean;
      
      private var var_1828:int;
      
      private var var_765:Dictionary;
      
      private var var_2194:int;
      
      private var var_1831:int;
      
      private var var_1525:int;
      
      private var var_326:Array;
      
      private var var_1827:int;
      
      private var var_1129:Array;
      
      private var var_539:PublicRoomShortData;
      
      private var var_375:RoomEventData;
      
      private var var_136:MsgWithRequestId;
      
      private var var_1832:Boolean;
      
      private var _navigator:HabboNavigator;
      
      private var var_1830:Boolean;
      
      private var var_197:GuestRoomData;
      
      private var var_635:Boolean;
      
      private var _currentRoomOwner:Boolean;
      
      public function NavigatorData(param1:HabboNavigator)
      {
         var_326 = new Array();
         var_765 = new Dictionary();
         super();
         _navigator = param1;
      }
      
      public function get createdFlatId() : int
      {
         return var_1828;
      }
      
      public function get eventMod() : Boolean
      {
         return var_1830;
      }
      
      public function startLoading() : void
      {
         this.var_635 = true;
      }
      
      public function isRoomFavourite(param1:int) : Boolean
      {
         return false;
      }
      
      public function set eventMod(param1:Boolean) : void
      {
         var_1830 = param1;
      }
      
      public function set roomEventData(param1:RoomEventData) : void
      {
         if(var_375 != null)
         {
            var_375.dispose();
         }
         var_375 = param1;
      }
      
      public function get popularTagsArrived() : Boolean
      {
         return var_136 != null && var_136 as PopularRoomTagsData != null;
      }
      
      public function get guestRoomSearchArrived() : Boolean
      {
         return var_136 != null && var_136 as GuestRoomSearchResultData != null;
      }
      
      public function get guestRoomSearchResults() : GuestRoomSearchResultData
      {
         return var_136 as GuestRoomSearchResultData;
      }
      
      public function get enteredGuestRoom() : GuestRoomData
      {
         return var_197;
      }
      
      public function onRoomEnter(param1:RoomEntryInfoMessageParser) : void
      {
         var_539 = null;
         var_197 = null;
         _currentRoomOwner = false;
         if(param1.guestRoom)
         {
            _currentRoomOwner = param1.owner;
         }
         else
         {
            var_539 = param1.publicSpace;
            var_375 = null;
         }
      }
      
      public function onRoomExit() : void
      {
         if(var_375 != null)
         {
            var_375.dispose();
            var_375 = null;
         }
         if(var_539 != null)
         {
            var_539.dispose();
            var_539 = null;
         }
         if(var_197 != null)
         {
            var_197.dispose();
            var_197 = null;
         }
         _currentRoomOwner = false;
      }
      
      public function set officialRooms(param1:OfficialRoomsData) : void
      {
         disposeCurrentMsg();
         var_136 = param1;
         var_635 = false;
         if(var_1129 == null)
         {
            var_1129 = param1.topLevelNodes;
         }
      }
      
      public function get settings() : NavigatorSettingsMessageParser
      {
         return var_1398;
      }
      
      public function set popularTags(param1:PopularRoomTagsData) : void
      {
         disposeCurrentMsg();
         var_136 = param1;
         var_635 = false;
      }
      
      public function get currentRoomOwner() : Boolean
      {
         return _currentRoomOwner;
      }
      
      public function getCategoryByIndex(param1:int) : FlatCategory
      {
         if(var_326.length > param1)
         {
            return var_326[param1] as FlatCategory;
         }
         return null;
      }
      
      public function onFavourites(param1:FavouritesMessageParser) : void
      {
         var _loc2_:int = 0;
         this.var_2194 = param1.limit;
         this.var_1170 = param1.favouriteRoomIds.length;
         this.var_765 = new Dictionary();
         for each(_loc2_ in param1.favouriteRoomIds)
         {
            this.var_765[_loc2_] = "yes";
         }
      }
      
      public function get popularTags() : PopularRoomTagsData
      {
         return var_136 as PopularRoomTagsData;
      }
      
      public function get categories() : Array
      {
         return var_326;
      }
      
      public function get enteredPublicSpace() : PublicRoomShortData
      {
         return var_539;
      }
      
      public function set avatarId(param1:int) : void
      {
         var_1525 = param1;
      }
      
      public function get hotRoomPopupOpen() : Boolean
      {
         return var_1829;
      }
      
      public function set guestRoomSearchResults(param1:GuestRoomSearchResultData) : void
      {
         disposeCurrentMsg();
         var_136 = param1;
         var_635 = false;
      }
      
      public function getCategoryIndexById(param1:int) : int
      {
         var _loc2_:int = 0;
         while(_loc2_ < var_326.length)
         {
            if((var_326[_loc2_] as FlatCategory).nodeId == param1)
            {
               return _loc2_;
            }
            _loc2_++;
         }
         return -1;
      }
      
      public function get canEditRoomSettings() : Boolean
      {
         return var_197 != null && _currentRoomOwner;
      }
      
      public function isLoading() : Boolean
      {
         return this.var_635;
      }
      
      public function set categories(param1:Array) : void
      {
         var_326 = param1;
      }
      
      public function get currentRoomRating() : int
      {
         return var_1831;
      }
      
      public function get publicSpaceNodeId() : int
      {
         return var_1827;
      }
      
      public function set settings(param1:NavigatorSettingsMessageParser) : void
      {
         var_1398 = param1;
      }
      
      private function disposeCurrentMsg() : void
      {
         if(var_136 == null)
         {
            return;
         }
         var_136.dispose();
         var_136 = null;
      }
      
      public function get roomEventData() : RoomEventData
      {
         return var_375;
      }
      
      public function favouriteChanged(param1:int, param2:Boolean) : void
      {
         var_765[param1] = !!param2 ? "yes" : null;
         var_1170 += !!param2 ? 1 : -1;
      }
      
      public function get officialRooms() : OfficialRoomsData
      {
         return var_136 as OfficialRoomsData;
      }
      
      public function get topLevelNodes() : Array
      {
         return var_1129;
      }
      
      public function get avatarId() : int
      {
         return var_1525;
      }
      
      public function isCurrentRoomFavourite() : Boolean
      {
         var _loc1_:int = 0;
         return false;
      }
      
      public function get officialRoomsArrived() : Boolean
      {
         return var_136 != null && var_136 as OfficialRoomsData != null;
      }
      
      public function set hotRoomPopupOpen(param1:Boolean) : void
      {
         var_1829 = param1;
      }
      
      public function set currentRoomRating(param1:int) : void
      {
         var_1831 = param1;
      }
      
      public function set hcMember(param1:Boolean) : void
      {
         var_1832 = param1;
      }
      
      public function set enteredRoom(param1:GuestRoomData) : void
      {
         if(var_197 != null)
         {
            var_197.dispose();
         }
         var_197 = param1;
      }
      
      public function getCategoryById(param1:int) : FlatCategory
      {
         var _loc2_:* = null;
         for each(_loc2_ in var_326)
         {
            if(_loc2_.nodeId == param1)
            {
               return _loc2_;
            }
         }
         return null;
      }
      
      public function isCurrentRoomHome() : Boolean
      {
         if(var_197 == null)
         {
            return false;
         }
         var _loc1_:int = 0;
         return this.var_1398.homeRoomId == _loc1_;
      }
      
      public function isFavouritesFull() : Boolean
      {
         return var_1170 >= var_2194;
      }
      
      public function set publicSpaceNodeId(param1:int) : void
      {
         var_1827 = param1;
      }
      
      public function get hcMember() : Boolean
      {
         return var_1832;
      }
      
      public function get canAddFavourite() : Boolean
      {
         return var_197 != null && !_currentRoomOwner;
      }
      
      public function set createdFlatId(param1:int) : void
      {
         var_1828 = param1;
      }
   }
}
