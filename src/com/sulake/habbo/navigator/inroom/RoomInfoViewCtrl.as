package com.sulake.habbo.navigator.inroom
{
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.core.window.components.IButtonWindow;
   import com.sulake.core.window.components.IContainerButtonWindow;
   import com.sulake.core.window.components.ITextFieldWindow;
   import com.sulake.core.window.components.ITextWindow;
   import com.sulake.core.window.events.WindowEvent;
   import com.sulake.core.window.events.WindowMouseEvent;
   import com.sulake.habbo.communication.messages.incoming.navigator.GuestRoomData;
   import com.sulake.habbo.communication.messages.incoming.navigator.PublicRoomShortData;
   import com.sulake.habbo.communication.messages.incoming.navigator.RoomEventData;
   import com.sulake.habbo.communication.messages.outgoing.navigator.AddFavouriteRoomMessageComposer;
   import com.sulake.habbo.communication.messages.outgoing.navigator.CanCreateEventMessageComposer;
   import com.sulake.habbo.communication.messages.outgoing.navigator.DeleteFavouriteRoomMessageComposer;
   import com.sulake.habbo.communication.messages.outgoing.navigator.RateFlatMessageComposer;
   import com.sulake.habbo.communication.messages.outgoing.navigator.UpdateNavigatorSettingsMessageComposer;
   import com.sulake.habbo.navigator.HabboNavigator;
   import com.sulake.habbo.navigator.SimpleAlertView;
   import com.sulake.habbo.navigator.TagRenderer;
   import com.sulake.habbo.navigator.Util;
   import com.sulake.habbo.navigator.events.HabboRoomSettingsTrackingEvent;
   import com.sulake.habbo.navigator.roomsettings.IRoomSettingsCtrlOwner;
   import com.sulake.habbo.navigator.roomsettings.RoomSettingsCtrl;
   import com.sulake.habbo.navigator.roomthumbnails.RoomThumbnailCtrl;
   import com.sulake.habbo.toolbar.HabboToolbarIconEnum;
   import com.sulake.habbo.toolbar.events.HabboToolbarShowMenuEvent;
   import com.sulake.habbo.window.enum.HabboWindowParam;
   import flash.events.Event;
   import flash.events.TimerEvent;
   import flash.utils.Timer;
   
   public class RoomInfoViewCtrl implements IRoomSettingsCtrlOwner
   {
       
      
      private var var_647:IWindowContainer;
      
      private var var_967:ITextWindow;
      
      private var var_200:RoomSettingsCtrl;
      
      private var var_1199:IContainerButtonWindow;
      
      private var _window:IWindowContainer;
      
      private var var_468:Timer;
      
      private var var_1195:ITextWindow;
      
      private var var_337:IWindowContainer;
      
      private var var_1883:IWindowContainer;
      
      private var var_1884:ITextWindow;
      
      private var var_773:IWindowContainer;
      
      private var var_1417:IButtonWindow;
      
      private var _ownerName:ITextWindow;
      
      private var var_604:ITextWindow;
      
      private var var_1418:IWindowContainer;
      
      private var var_1197:IWindowContainer;
      
      private var var_776:ITextWindow;
      
      private var var_966:ITextFieldWindow;
      
      private var var_291:IWindowContainer;
      
      private var var_774:ITextWindow;
      
      private var var_1416:IButtonWindow;
      
      private var var_968:ITextWindow;
      
      private var var_2196:int;
      
      private var var_1198:IContainerButtonWindow;
      
      private var var_775:IWindowContainer;
      
      private var var_1200:ITextWindow;
      
      private var var_1194:IContainerButtonWindow;
      
      private var var_1415:ITextWindow;
      
      private var var_1414:IButtonWindow;
      
      private var var_899:TagRenderer;
      
      private var var_1875:ITextWindow;
      
      private var var_338:RoomEventViewCtrl;
      
      private var _navigator:HabboNavigator;
      
      private var var_648:ITextWindow;
      
      private var var_258:RoomThumbnailCtrl;
      
      private var var_1196:IContainerButtonWindow;
      
      private var var_1882:IWindowContainer;
      
      private var var_259:IWindowContainer;
      
      public function RoomInfoViewCtrl(param1:HabboNavigator)
      {
         super();
         _navigator = param1;
         var_338 = new RoomEventViewCtrl(_navigator);
         var_200 = new RoomSettingsCtrl(_navigator,this,true);
         var_258 = new RoomThumbnailCtrl(_navigator);
         var_899 = new TagRenderer(_navigator);
         _navigator.roomSettingsCtrls.push(this.var_200);
         var_468 = new Timer(6000,1);
         var_468.addEventListener(TimerEvent.TIMER,hideInfo);
      }
      
      public function backToRoomSettings() : void
      {
         this.var_200.active = true;
         this.var_338.active = false;
         this.var_258.active = false;
         this.reload();
         _navigator.events.dispatchEvent(new Event(HabboRoomSettingsTrackingEvent.HABBO_ROOM_SETTINGS_TRACKING_EVENT_DEFAULT));
      }
      
      private function refreshEventButtons(param1:RoomEventData) : void
      {
         if(false)
         {
            return;
         }
         var_1417.visible = param1 == null && _navigator.data.currentRoomOwner;
         var_1414.visible = param1 != null && (_navigator.data.currentRoomOwner || _navigator.data.eventMod);
         var_1418.visible = Util.hasVisibleChildren(var_1418);
      }
      
      private function refreshRoomDetails(param1:GuestRoomData, param2:Boolean) : void
      {
         if(param1 == null || false || false)
         {
            return;
         }
         var_604.text = param1.roomName;
         var_604.height = NaN;
         _ownerName.text = param1.ownerName;
         var_776.text = param1.description;
         var_899.refreshTags(var_337,param1.tags);
         var_776.visible = false;
         if(param1.description != "")
         {
            var_776.height = NaN;
            var_776.visible = true;
         }
         var _loc3_:* = _navigator.data.currentRoomRating == -1;
         _navigator.refreshButton(var_337,"thumb_up",_loc3_,onThumbUp,0);
         _navigator.refreshButton(var_337,"thumb_down",_loc3_,onThumbDown,0);
         var_1884.visible = _loc3_;
         var_774.visible = !_loc3_;
         var_1415.visible = !_loc3_;
         var_1415.text = "" + _navigator.data.currentRoomRating;
         _navigator.refreshButton(var_337,"home",param2,null,0);
         _navigator.refreshButton(var_337,"favourite",!param2 && _navigator.data.isCurrentRoomFavourite(),null,0);
         Util.moveChildrenToColumn(var_337,["room_name","owner_name_cont","tags","room_desc","rating_cont"],var_604.y,0);
         var_337.visible = true;
         var_337.height = Util.getLowestPoint(var_337);
      }
      
      private function getButtonsMinHeight() : int
      {
         return !!_navigator.data.currentRoomOwner ? 0 : 21;
      }
      
      private function hideInfo(param1:Event) : void
      {
         _navigator.toolbar.events.dispatchEvent(new HabboToolbarShowMenuEvent(HabboToolbarShowMenuEvent.const_345,HabboToolbarIconEnum.ROOMINFO,_window,false));
      }
      
      private function onThumbUp(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         _navigator.send(new RateFlatMessageComposer(1));
      }
      
      private function getRoomInfoMinHeight() : int
      {
         return 37;
      }
      
      public function onAddFavouriteClick(param1:WindowEvent, param2:IWindow) : void
      {
         var _loc3_:* = null;
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         if(_navigator.data.enteredGuestRoom == null)
         {
            return;
         }
         if(_navigator.data.isFavouritesFull())
         {
            _loc3_ = new SimpleAlertView(_navigator,"${navigator.favouritesfull.title}","${navigator.favouritesfull.body}");
            _loc3_.show();
         }
         else
         {
            _navigator.send(new AddFavouriteRoomMessageComposer(0,_navigator.data.enteredGuestRoom.flatId));
         }
      }
      
      private function refreshRoomButtons(param1:Boolean) : void
      {
         if(_navigator.data.enteredGuestRoom == null || false || false)
         {
            return;
         }
         var_1416.visible = _navigator.data.canEditRoomSettings;
         var _loc2_:Boolean = _navigator.data.isCurrentRoomFavourite();
         var_1199.visible = _navigator.data.canAddFavourite && !_loc2_;
         var_1196.visible = _navigator.data.canAddFavourite && _loc2_;
         var_1198.visible = _navigator.data.canEditRoomSettings && !param1;
         var_1194.visible = _navigator.data.canEditRoomSettings && param1;
         var_1197.visible = Util.hasVisibleChildren(var_1197);
      }
      
      public function open(param1:Boolean) : void
      {
         this.var_468.reset();
         this.var_338.active = false;
         this.var_200.active = false;
         this.var_258.active = false;
         if(param1)
         {
            this.startRoomSettingsEdit(_navigator.data.enteredGuestRoom.flatId);
         }
         refresh();
         _window.visible = true;
         _navigator.toolbar.events.dispatchEvent(new HabboToolbarShowMenuEvent(HabboToolbarShowMenuEvent.const_45,HabboToolbarIconEnum.ROOMINFO,_window,false));
         _window.parent.activate();
         _window.activate();
         if(!param1)
         {
            this.var_468.start();
         }
      }
      
      public function toggle() : void
      {
         this.var_468.reset();
         this.var_338.active = false;
         this.var_200.active = false;
         this.var_258.active = false;
         refresh();
         if(true)
         {
            _navigator.toolbar.events.dispatchEvent(new HabboToolbarShowMenuEvent(HabboToolbarShowMenuEvent.const_45,HabboToolbarIconEnum.ROOMINFO,_window,false));
            _window.parent.activate();
         }
         else
         {
            _navigator.toolbar.events.dispatchEvent(new HabboToolbarShowMenuEvent(HabboToolbarShowMenuEvent.const_345,HabboToolbarIconEnum.ROOMINFO,_window,false));
         }
      }
      
      private function refreshRoom() : void
      {
         Util.hideChildren(var_291);
         var_291.findChildByName("close").visible = true;
         var _loc1_:GuestRoomData = _navigator.data.enteredGuestRoom;
         var _loc2_:Boolean = _navigator.data.settings != null && _loc1_ != null && _loc1_.flatId == _navigator.data.settings.homeRoomId;
         refreshRoomDetails(_loc1_,_loc2_);
         refreshPublicSpaceDetails(_navigator.data.enteredPublicSpace);
         refreshRoomButtons(_loc2_);
         this.var_200.refresh(var_291);
         this.var_258.refresh(var_291);
         Util.moveChildrenToColumn(var_291,["room_details","room_buttons"],0,2);
         var_291.height = Util.getLowestPoint(var_291);
         var_291.visible = true;
         Logger.log("XORP: undefined, undefined, undefined, undefined, undefined");
      }
      
      private function onCloseButtonClick(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         hideInfo(null);
      }
      
      private function onEmbedSrcClick(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         var_966.setSelection(0,var_966.text.length);
      }
      
      private function getEmbedData() : String
      {
         var _loc1_:* = null;
         var _loc2_:* = null;
         if(_navigator.data.enteredGuestRoom != null)
         {
            _loc1_ = "private";
            _loc2_ = "" + _navigator.data.enteredGuestRoom.flatId;
         }
         else
         {
            _loc1_ = "public";
            _loc2_ = "" + _navigator.data.publicSpaceNodeId;
            Logger.log("Node id is: " + _loc2_);
         }
         var _loc3_:String = _navigator.configuration.getKey("user.hash","");
         _navigator.registerParameter("navigator.embed.src","roomType",_loc1_);
         _navigator.registerParameter("navigator.embed.src","embedCode",_loc3_);
         _navigator.registerParameter("navigator.embed.src","roomId",_loc2_);
         return _navigator.getText("navigator.embed.src");
      }
      
      private function onThumbDown(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         _navigator.send(new RateFlatMessageComposer(-1));
      }
      
      private function refreshEvent() : void
      {
         Util.hideChildren(var_259);
         var _loc1_:RoomEventData = _navigator.data.roomEventData;
         refreshEventDetails(_loc1_);
         refreshEventButtons(_loc1_);
         this.var_338.refresh(var_259);
         if(Util.hasVisibleChildren(var_259) && !this.var_258.active)
         {
            Util.moveChildrenToColumn(var_259,["event_details","event_buttons"],0,2);
            var_259.height = Util.getLowestPoint(var_259);
            var_259.visible = true;
         }
         else
         {
            var_259.visible = false;
         }
         Logger.log("EVENT: undefined, undefined");
      }
      
      public function startEventEdit() : void
      {
         this.var_468.reset();
         this.var_338.active = true;
         this.var_200.active = false;
         this.var_258.active = false;
         this.reload();
      }
      
      private function getEventInfoMinHeight() : int
      {
         return 18;
      }
      
      public function onRemoveFavouriteClick(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         if(_navigator.data.enteredGuestRoom == null)
         {
            return;
         }
         _navigator.send(new DeleteFavouriteRoomMessageComposer(0,_navigator.data.enteredGuestRoom.flatId));
      }
      
      private function onHover(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_OVER)
         {
            return;
         }
         var_468.reset();
      }
      
      private function refreshPublicSpaceDetails(param1:PublicRoomShortData) : void
      {
         if(param1 == null || false || false)
         {
            return;
         }
         var_967.text = _navigator.getPublicSpaceName(param1.unitPropertySet,param1.worldId);
         var_967.height = NaN;
         var_1195.text = _navigator.getPublicSpaceDesc(param1.unitPropertySet,param1.worldId);
         var_1195.height = NaN;
         Util.moveChildrenToColumn(var_647,["public_space_name","public_space_desc"],var_967.y,0);
         var_647.visible = true;
         var_647.height = Math.max(86,Util.getLowestPoint(var_647));
      }
      
      public function reload() : void
      {
         if(_window != null && false)
         {
            refresh();
         }
      }
      
      private function find(param1:String) : IWindow
      {
         var _loc2_:IWindow = _window.findChildByName(param1);
         if(_loc2_ == null)
         {
            throw new Error("Window element with name: " + param1 + " cannot be found!");
         }
         return _loc2_;
      }
      
      private function refreshEmbed() : void
      {
         var _loc1_:* = _navigator.configuration.getKey("embed.showInRoomInfo","false") == "true";
         if(_loc1_ && true && true && true)
         {
            var_775.visible = true;
            var_966.text = this.getEmbedData();
         }
         else
         {
            var_775.visible = false;
         }
      }
      
      public function startRoomSettingsEdit(param1:int) : void
      {
         this.var_468.reset();
         this.var_200.load(param1);
         this.var_200.active = true;
         this.var_338.active = false;
         this.var_258.active = false;
         _navigator.events.dispatchEvent(new Event(HabboRoomSettingsTrackingEvent.HABBO_ROOM_SETTINGS_TRACKING_EVENT_DEFAULT));
      }
      
      public function startThumbnailEdit() : void
      {
         this.var_468.reset();
         this.var_200.active = false;
         this.var_338.active = false;
         this.var_258.active = true;
         this.reload();
         _navigator.events.dispatchEvent(new Event(HabboRoomSettingsTrackingEvent.HABBO_ROOM_SETTINGS_TRACKING_EVENT_THUMBS));
      }
      
      private function prepareWindow() : void
      {
         if(_window != null)
         {
            return;
         }
         _window = IWindowContainer(_navigator.getXmlWindow("iro_room_details"));
         _window.setParamFlag(HabboWindowParam.const_68,false);
         _window.setParamFlag(HabboWindowParam.const_1103,true);
         var_291 = IWindowContainer(find("room_info"));
         var_337 = IWindowContainer(find("room_details"));
         var_647 = IWindowContainer(find("public_space_details"));
         var_1882 = IWindowContainer(find("owner_name_cont"));
         var_1883 = IWindowContainer(find("rating_cont"));
         var_1197 = IWindowContainer(find("room_buttons"));
         var_604 = ITextWindow(find("room_name"));
         var_967 = ITextWindow(find("public_space_name"));
         _ownerName = ITextWindow(find("owner_name"));
         var_776 = ITextWindow(find("room_desc"));
         var_1195 = ITextWindow(find("public_space_desc"));
         var_968 = ITextWindow(find("owner_caption"));
         var_774 = ITextWindow(find("rating_caption"));
         var_1884 = ITextWindow(find("rate_caption"));
         var_1415 = ITextWindow(find("rating_txt"));
         var_259 = IWindowContainer(find("event_info"));
         var_773 = IWindowContainer(find("event_details"));
         var_1418 = IWindowContainer(find("event_buttons"));
         var_1875 = ITextWindow(find("event_name"));
         var_648 = ITextWindow(find("event_desc"));
         var_1199 = IContainerButtonWindow(find("add_favourite_button"));
         var_1196 = IContainerButtonWindow(find("rem_favourite_button"));
         var_1198 = IContainerButtonWindow(find("make_home_button"));
         var_1194 = IContainerButtonWindow(find("unmake_home_button"));
         var_1416 = IButtonWindow(find("room_settings_button"));
         var_1417 = IButtonWindow(find("create_event_button"));
         var_1414 = IButtonWindow(find("edit_event_button"));
         var_775 = IWindowContainer(find("embed_info"));
         var_1200 = ITextWindow(find("embed_info_txt"));
         var_966 = ITextFieldWindow(find("embed_src_txt"));
         Util.setProcDirectly(var_1199,onAddFavouriteClick);
         Util.setProcDirectly(var_1196,onRemoveFavouriteClick);
         Util.setProcDirectly(var_1416,onRoomSettingsClick);
         Util.setProcDirectly(var_1198,onMakeHomeClick);
         Util.setProcDirectly(var_1194,onUnmakeHomeClick);
         Util.setProcDirectly(var_1417,onEventSettingsClick);
         Util.setProcDirectly(var_1414,onEventSettingsClick);
         Util.setProcDirectly(var_966,onEmbedSrcClick);
         _navigator.refreshButton(var_1199,"favourite",true,null,0);
         _navigator.refreshButton(var_1196,"favourite",true,null,0);
         _navigator.refreshButton(var_1198,"home",true,null,0);
         _navigator.refreshButton(var_1194,"home",true,null,0);
         _window.findChildByName("close").procedure = onCloseButtonClick;
         Util.setProcDirectly(var_291,onHover);
         Util.setProcDirectly(var_259,onHover);
         var_968.width = var_968.textWidth;
         Util.moveChildrenToRow(var_1882,["owner_caption","owner_name"],var_968.x,var_968.y,3);
         var_774.width = var_774.textWidth;
         Util.moveChildrenToRow(var_1883,["rating_caption","rating_txt"],var_774.x,var_774.y,3);
         var_1200.height = NaN;
         Util.moveChildrenToColumn(var_775,["embed_info_txt","embed_src_txt"],var_1200.y,2);
         var_775.height = Util.getLowestPoint(var_775) + 5;
         var_2196 = NaN;
      }
      
      private function refreshEventDetails(param1:RoomEventData) : void
      {
         if(param1 == null || false)
         {
            return;
         }
         var_1875.text = param1.eventName;
         var_648.text = param1.eventDescription;
         var_899.refreshTags(var_773,[_navigator.getText("roomevent_type_" + param1.eventType),param1.tags[0],param1.tags[1]]);
         var_648.visible = false;
         if(param1.eventDescription != "")
         {
            var_648.height = NaN;
            var_648.y = Util.getLowestPoint(var_773) + 2;
            var_648.visible = true;
         }
         var_773.visible = true;
         var_773.height = Util.getLowestPoint(var_773);
      }
      
      private function refresh() : void
      {
         prepareWindow();
         refreshRoom();
         refreshEvent();
         refreshEmbed();
         Util.moveChildrenToColumn(this._window,["room_info","event_info","embed_info"],0,2);
         _window.height = Util.getLowestPoint(_window);
         _window.y = _window.desktop.height - 0 - 5;
         Logger.log("MAIN: undefined, undefined, undefined");
      }
      
      private function onRoomSettingsClick(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         var _loc3_:GuestRoomData = _navigator.data.enteredGuestRoom;
         if(_loc3_ == null)
         {
            Logger.log("No entered room data?!");
            return;
         }
         startRoomSettingsEdit(_loc3_.flatId);
      }
      
      private function onUnmakeHomeClick(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         Logger.log("CLEARING HOME ROOM:");
         _navigator.send(new UpdateNavigatorSettingsMessageComposer(0));
      }
      
      private function onEventSettingsClick(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         if(_navigator.data.roomEventData == null)
         {
            if(_navigator.data.currentRoomOwner)
            {
               _navigator.send(new CanCreateEventMessageComposer());
            }
         }
         else
         {
            startEventEdit();
         }
      }
      
      public function roomSettingsRefreshNeeded() : void
      {
         refresh();
      }
      
      public function close() : void
      {
         _navigator.toolbar.events.dispatchEvent(new HabboToolbarShowMenuEvent(HabboToolbarShowMenuEvent.const_866,HabboToolbarIconEnum.ROOMINFO,_window,false));
         if(_window == null)
         {
            return;
         }
         this._window.visible = false;
         _navigator.events.dispatchEvent(new Event(HabboRoomSettingsTrackingEvent.HABBO_ROOM_SETTINGS_TRACKING_EVENT_CLOSED));
      }
      
      private function onMakeHomeClick(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         var _loc3_:GuestRoomData = _navigator.data.enteredGuestRoom;
         if(_loc3_ == null)
         {
            Logger.log("No entered room data?!");
            return;
         }
         Logger.log("SETTING HOME ROOM TO: " + _loc3_.flatId);
         _navigator.send(new UpdateNavigatorSettingsMessageComposer(_loc3_.flatId));
      }
   }
}
