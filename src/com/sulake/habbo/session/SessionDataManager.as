package com.sulake.habbo.session
{
   import com.sulake.core.assets.IAssetLibrary;
   import com.sulake.core.communication.connection.IConnection;
   import com.sulake.core.communication.messages.IMessageEvent;
   import com.sulake.core.runtime.Component;
   import com.sulake.core.runtime.CoreComponent;
   import com.sulake.core.runtime.IContext;
   import com.sulake.core.runtime.IID;
   import com.sulake.core.runtime.IUnknown;
   import com.sulake.core.window.events.WindowEvent;
   import com.sulake.habbo.communication.IHabboCommunicationManager;
   import com.sulake.habbo.communication.messages.incoming.availability.AvailabilityStatusMessageEvent;
   import com.sulake.habbo.communication.messages.incoming.handshake.UserObjectEvent;
   import com.sulake.habbo.communication.messages.incoming.handshake.UserRightsMessageEvent;
   import com.sulake.habbo.communication.messages.incoming.room.engine.UserChangeMessageEvent;
   import com.sulake.habbo.communication.messages.incoming.users.UserNameChangedMessageEvent;
   import com.sulake.habbo.communication.messages.outgoing.room.chat.ChatMessageComposer;
   import com.sulake.habbo.communication.messages.outgoing.room.pets.RespectPetMessageComposer;
   import com.sulake.habbo.communication.messages.outgoing.users.RespectUserMessageComposer;
   import com.sulake.habbo.communication.messages.parser.availability.AvailabilityStatusMessageParser;
   import com.sulake.habbo.communication.messages.parser.handshake.UserObjectMessageParser;
   import com.sulake.habbo.communication.messages.parser.users.UserNameChangedMessageParser;
   import com.sulake.habbo.configuration.IHabboConfigurationManager;
   import com.sulake.habbo.configuration.enum.HabboConfigurationEvent;
   import com.sulake.habbo.localization.IHabboLocalizationManager;
   import com.sulake.habbo.session.events.HabboSessionFigureUpdatedEvent;
   import com.sulake.habbo.session.furniture.FurnitureDataParser;
   import com.sulake.habbo.session.furniture.IFurnitureData;
   import com.sulake.habbo.session.product.IProductData;
   import com.sulake.habbo.session.product.ProductDataParser;
   import com.sulake.habbo.utils.HabboWebTools;
   import com.sulake.habbo.window.IHabboWindowManager;
   import com.sulake.habbo.window.utils.IConfirmDialog;
   import com.sulake.iid.IIDHabboCommunicationManager;
   import com.sulake.iid.IIDHabboConfigurationManager;
   import com.sulake.iid.IIDHabboLocalizationManager;
   import com.sulake.iid.IIDHabboRoomSessionManager;
   import flash.display.BitmapData;
   import flash.events.Event;
   import flash.external.ExternalInterface;
   import flash.utils.Dictionary;
   import iid.IIDHabboWindowManager;
   
   public class SessionDataManager extends Component implements ISessionDataManager
   {
       
      
      private var var_514:String;
      
      private var var_1507:UserTagManager;
      
      private var var_692:Array;
      
      private var _respectLeft:int = 0;
      
      private var _furnitureIds:Dictionary;
      
      private var var_1506:GroupDetailsView;
      
      private var _name:String;
      
      private var var_850:int = 0;
      
      private var var_1021:FurnitureDataParser;
      
      private var var_1278:Dictionary;
      
      private var _localization:IHabboLocalizationManager;
      
      private var var_34:IRoomSessionManager;
      
      private var var_1277:BadgeImageManager;
      
      private var _windowManager:IHabboWindowManager;
      
      private var var_1174:String;
      
      private var var_2131:Boolean;
      
      private var _id:int;
      
      private var var_851:IgnoredUsersManager;
      
      private var var_785:Dictionary;
      
      private var _communication:IHabboCommunicationManager;
      
      private var _gender:String;
      
      private var var_2132:Boolean;
      
      private var var_1020:ProductDataParser;
      
      private var var_177:IHabboConfigurationManager;
      
      private var var_1019:HabboGroupInfoManager;
      
      private var var_1584:int = 0;
      
      public function SessionDataManager(param1:IContext, param2:uint = 0, param3:IAssetLibrary = null)
      {
         super(param1,param2,param3);
         var_692 = [];
         var_1507 = new UserTagManager(events);
         var_1019 = new HabboGroupInfoManager(this,events);
         var_851 = new IgnoredUsersManager(this);
         queueInterface(new IIDHabboWindowManager(),onWindowManagerReady);
         queueInterface(new IIDHabboCommunicationManager(),onHabboCommunicationReady);
         queueInterface(new IIDHabboConfigurationManager(),onConfigurationReady);
         queueInterface(new IIDHabboLocalizationManager(),onLocalizationReady);
         queueInterface(new IIDHabboRoomSessionManager(),onRoomSessionManagerReady);
      }
      
      private function onProductsReady(param1:Event = null) : void
      {
         var_1020.removeEventListener(ProductDataParser.const_134,onProductsReady);
         var_1020 = null;
         var_1278 = new Dictionary();
         _furnitureIds = new Dictionary();
         var _loc2_:String = var_177.getKey("furnidata.load.url");
         var _loc3_:String = var_177.getKey("external.hash");
         _loc2_ = _loc2_.replace("%hash%",_loc3_);
         var_1021 = new FurnitureDataParser(_loc2_,var_1278,_furnitureIds,_localization);
         var_1021.addEventListener(FurnitureDataParser.const_134,onFurnitureReady);
      }
      
      public function getUserTags(param1:int) : Array
      {
         return var_1507.getTags(param1);
      }
      
      private function onUserNameChange(param1:IMessageEvent) : void
      {
         var _loc2_:UserNameChangedMessageEvent = param1 as UserNameChangedMessageEvent;
         if(_loc2_ == null || _loc2_.getParser() == null)
         {
            return;
         }
         var _loc3_:UserNameChangedMessageParser = _loc2_.getParser();
         if(_loc3_.webId == _id)
         {
            _name = _loc3_.newName;
         }
      }
      
      private function onConfigurationInit(param1:Event = null) : void
      {
         var_785 = new Dictionary();
         var _loc2_:String = var_177.getKey("productdata.load.url");
         var _loc3_:String = var_177.getKey("external.hash");
         _loc2_ = _loc2_.replace("%hash%",_loc3_);
         var_1020 = new ProductDataParser(_loc2_,var_785);
         var_1020.addEventListener(ProductDataParser.const_134,onProductsReady);
      }
      
      public function getProductData(param1:String) : IProductData
      {
         return var_785[param1];
      }
      
      public function getFurnitureData(param1:int) : IFurnitureData
      {
         if(var_1278 == null)
         {
            return null;
         }
         return var_1278[String(param1)];
      }
      
      private function sendPickAllFurnitureMessage() : void
      {
         var _loc1_:IConnection = _communication.getHabboMainConnection(null);
         if(_loc1_ == null)
         {
            return;
         }
         _loc1_.send(new ChatMessageComposer(":pickall"));
      }
      
      public function get roomSessionManager() : IRoomSessionManager
      {
         return var_34;
      }
      
      public function getGroupBadgeId(param1:int) : String
      {
         return var_1019.getBadgeId(param1);
      }
      
      public function unignoreUser(param1:String) : void
      {
         var_851.unignoreUser(param1);
      }
      
      public function get systemOpen() : Boolean
      {
         return var_2131;
      }
      
      public function getGroupBadgeImage(param1:String) : BitmapData
      {
         return var_1277.getBadgeImage(param1,BadgeImageManager.const_840);
      }
      
      public function get configuration() : IHabboConfigurationManager
      {
         return var_177;
      }
      
      private function onUserObject(param1:IMessageEvent) : void
      {
         var _loc2_:UserObjectEvent = param1 as UserObjectEvent;
         var _loc3_:UserObjectMessageParser = _loc2_.getParser();
         _id = _loc3_.id;
         _name = _loc3_.name;
         var_1584 = _loc3_.respectTotal;
         _respectLeft = _loc3_.respectLeft;
         var_850 = _loc3_.petRespectLeft;
         var_514 = _loc3_.figure;
         _gender = _loc3_.sex;
         var_1174 = _loc3_.realName;
         var_851.initIgnoreList();
         if(false && var_177.getKey("facebook.user").length == 0)
         {
            ExternalInterface.call("FlashExternalInterface.openHabblet","news");
         }
      }
      
      public function pickAllFurniture(param1:int, param2:int) : void
      {
         var roomId:int = param1;
         var roomCategory:int = param2;
         if(var_34 == null || _windowManager == null)
         {
            return;
         }
         var session:IRoomSession = var_34.getSession(roomId,roomCategory);
         if(session == null)
         {
            return;
         }
         if(session.isRoomOwner || isAnyRoomController)
         {
            _windowManager.confirm("${generic.alert.title}","${room.confirm.pick_all}",0,function(param1:IConfirmDialog, param2:Event):void
            {
               param1.dispose();
               if(param2.type == WindowEvent.const_194)
               {
                  sendPickAllFurnitureMessage();
               }
            });
         }
      }
      
      public function getFurnitureDataByName(param1:String) : IFurnitureData
      {
         if(_furnitureIds == null)
         {
            return null;
         }
         return getFurnitureData(int(_furnitureIds[param1]));
      }
      
      public function getGroupDetails(param1:int) : HabboGroupDetails
      {
         return var_1019.getGroupDetails(param1);
      }
      
      public function get userId() : int
      {
         return _id;
      }
      
      public function get realName() : String
      {
         return var_1174;
      }
      
      private function onWindowManagerReady(param1:IID, param2:IUnknown) : void
      {
         _windowManager = param2 as IHabboWindowManager;
      }
      
      public function get petRespectLeft() : int
      {
         return var_850;
      }
      
      public function isIgnored(param1:String) : Boolean
      {
         return var_851.isIgnored(param1);
      }
      
      private function onLocalizationReady(param1:IID, param2:IUnknown) : void
      {
         if(param2 == null)
         {
            return;
         }
         _localization = param2 as IHabboLocalizationManager;
         initBadgeImageManager();
      }
      
      private function onAvailabilityStatus(param1:IMessageEvent) : void
      {
         var _loc2_:AvailabilityStatusMessageParser = (param1 as AvailabilityStatusMessageEvent).getParser();
         if(_loc2_ == null)
         {
            return;
         }
         var_2131 = _loc2_.isOpen;
         var_2132 = _loc2_.onShutDown;
      }
      
      public function getBadgeImage(param1:String) : BitmapData
      {
         return var_1277.getBadgeImage(param1);
      }
      
      public function giveRespect(param1:int) : void
      {
         var _loc2_:IConnection = _communication.getHabboMainConnection(null);
         if(param1 < 0 || _respectLeft < 1 || _loc2_ == null)
         {
            throw new Error("Failed to give respect to user: " + param1);
         }
         _loc2_.send(new RespectUserMessageComposer(param1));
         _respectLeft = _respectLeft - 1;
      }
      
      private function onConfigurationReady(param1:IID, param2:IUnknown) : void
      {
         if(param2 == null)
         {
            return;
         }
         var_177 = param2 as IHabboConfigurationManager;
         initBadgeImageManager();
         (var_177 as Component).events.addEventListener(HabboConfigurationEvent.INIT,onConfigurationInit);
      }
      
      public function showGroupBadgeInfo(param1:int) : void
      {
         if(var_1506 == null)
         {
            var_1506 = new GroupDetailsView(this);
         }
         var _loc2_:HabboGroupDetails = var_1019.getGroupDetails(param1);
         if(_loc2_ != null)
         {
            var_1506.showGroupDetails(param1);
         }
      }
      
      private function onFurnitureReady(param1:Event = null) : void
      {
         var_1021.removeEventListener(FurnitureDataParser.const_134,onFurnitureReady);
         var_1021 = null;
      }
      
      public function hasUserRight(param1:String) : Boolean
      {
         if(var_692 == null)
         {
            return false;
         }
         return var_692.indexOf(param1) >= 0;
      }
      
      public function givePetRespect(param1:int) : void
      {
         var _loc2_:IConnection = _communication.getHabboMainConnection(null);
         if(param1 < 0 || var_850 < 1 || _loc2_ == null)
         {
            throw new Error("Failed to give respect to pet: " + param1);
         }
         _loc2_.send(new RespectPetMessageComposer(param1));
         var_850 = var_850 - 1;
      }
      
      private function onUserChange(param1:IMessageEvent) : void
      {
         var _loc2_:UserChangeMessageEvent = param1 as UserChangeMessageEvent;
         if(_loc2_ == null)
         {
            return;
         }
         if(_loc2_.id == -1)
         {
            var_514 = _loc2_.figure;
            _gender = _loc2_.sex;
            events.dispatchEvent(new HabboSessionFigureUpdatedEvent(_id,var_514));
         }
      }
      
      public function get windowManager() : IHabboWindowManager
      {
         return _windowManager;
      }
      
      public function openHabboHomePage(param1:int) : void
      {
         var urlString:String = null;
         var userId:int = param1;
         if(var_177 != null)
         {
            urlString = var_177.getKey("link.format.userpage");
            urlString = urlString.replace("%ID%",String(userId));
            try
            {
               HabboWebTools.navigateToURL(urlString,"habboMain");
            }
            catch(e:Error)
            {
               Logger.log("Error occurred!");
            }
         }
      }
      
      public function ignoreUser(param1:String) : void
      {
         var_851.ignoreUser(param1);
      }
      
      private function onUserRights(param1:IMessageEvent) : void
      {
         var _loc2_:UserRightsMessageEvent = param1 as UserRightsMessageEvent;
         var_692 = _loc2_.rights;
      }
      
      private function onHabboCommunicationReady(param1:IID, param2:IUnknown) : void
      {
         _communication = param2 as IHabboCommunicationManager;
         if(_communication == null)
         {
            return;
         }
         _communication.addHabboConnectionMessageEvent(new UserRightsMessageEvent(onUserRights));
         _communication.addHabboConnectionMessageEvent(new UserObjectEvent(onUserObject));
         _communication.addHabboConnectionMessageEvent(new UserChangeMessageEvent(onUserChange));
         _communication.addHabboConnectionMessageEvent(new UserNameChangedMessageEvent(onUserNameChange));
         _communication.addHabboConnectionMessageEvent(new AvailabilityStatusMessageEvent(onAvailabilityStatus));
         var_1507.communication = _communication;
         var_1019.communication = _communication;
         var_851.registerMessageEvents();
      }
      
      public function get systemShutDown() : Boolean
      {
         return var_2132;
      }
      
      public function get gender() : String
      {
         return _gender;
      }
      
      public function get communication() : IHabboCommunicationManager
      {
         return _communication;
      }
      
      public function get isAnyRoomController() : Boolean
      {
         if(var_692 == null)
         {
            return false;
         }
         return var_692.indexOf("fuse_any_room_controller") >= 0;
      }
      
      private function initBadgeImageManager() : void
      {
         var _loc1_:* = null;
         if(var_1277 != null)
         {
            return;
         }
         if(var_177 == null || _localization == null)
         {
            return;
         }
         if(context is CoreComponent)
         {
            _loc1_ = (context as CoreComponent).assets;
         }
         var_1277 = new BadgeImageManager(_loc1_,events,var_177,_localization);
      }
      
      public function get respectLeft() : int
      {
         return _respectLeft;
      }
      
      private function onRoomSessionManagerReady(param1:IID = null, param2:IUnknown = null) : void
      {
         if(disposed)
         {
            return;
         }
         var_34 = param2 as IRoomSessionManager;
      }
      
      public function get userName() : String
      {
         return _name;
      }
      
      public function get figure() : String
      {
         return var_514;
      }
   }
}
