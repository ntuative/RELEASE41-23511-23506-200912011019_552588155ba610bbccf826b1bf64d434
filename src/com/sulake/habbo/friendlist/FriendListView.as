package com.sulake.habbo.friendlist
{
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.core.window.components.IFrameWindow;
   import com.sulake.core.window.components.ITextWindow;
   import com.sulake.core.window.events.WindowEvent;
   import com.sulake.core.window.events.WindowMouseEvent;
   import com.sulake.habbo.friendlist.events.HabboFriendListTrackingEvent;
   import com.sulake.habbo.toolbar.HabboToolbarIconEnum;
   import com.sulake.habbo.toolbar.events.HabboToolbarShowMenuEvent;
   import com.sulake.habbo.window.enum.HabboWindowParam;
   import flash.utils.Dictionary;
   
   public class FriendListView
   {
      
      private static const const_1369:String = "noconvinfo";
      
      private static const const_1370:String = "messageinput";
       
      
      private var var_1406:int = -1;
      
      private var var_830:IWindowContainer;
      
      private var _friendList:HabboFriendList;
      
      private var var_1405:int = -1;
      
      private var var_1180:ITextWindow;
      
      private var var_1179:FriendListTabsView;
      
      private var var_27:IFrameWindow;
      
      private var var_257:IWindowContainer;
      
      private var var_1864:Boolean;
      
      public function FriendListView(param1:HabboFriendList)
      {
         super();
         _friendList = param1;
         var_1179 = new FriendListTabsView(_friendList);
      }
      
      private function prepare() : void
      {
         var_27 = IFrameWindow(_friendList.getXmlWindow("main_window"));
         var_27.findChildByTag("close").procedure = onWindowClose;
         var_830 = IWindowContainer(var_27.content.findChildByName("main_content"));
         var_257 = IWindowContainer(var_27.content.findChildByName("footer"));
         var_1179.prepare(var_830);
         var_27.procedure = onWindow;
         var_27.content.setParamFlag(HabboWindowParam.const_796,false);
         var_27.content.setParamFlag(HabboWindowParam.const_1272,true);
         var_27.header.setParamFlag(HabboWindowParam.const_561,false);
         var_27.header.setParamFlag(HabboWindowParam.const_948,true);
         var_27.content.setParamFlag(HabboWindowParam.const_561,false);
         var_27.content.setParamFlag(HabboWindowParam.const_948,true);
         var_27.findChildByName("open_edit_ctgs_but").procedure = onEditCategoriesButtonClick;
         var_1180 = ITextWindow(var_27.findChildByName("info_text"));
         var_1180.text = "";
         _friendList.refreshButton(var_27,"open_edit_ctgs",true,null,0);
         var_27.title.color = 4294623744;
         var_27.title.textColor = 4287851525;
         refresh("prepare");
         var_27.height = 350;
         var_27.width = 230;
      }
      
      private function onWindowClose(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         Logger.log("Close window");
         var_27.visible = false;
         _friendList.trackFriendListEvent(HabboFriendListTrackingEvent.HABBO_FRIENDLIST_TRACKIG_EVENT_CLOSED);
      }
      
      public function showInfo(param1:WindowEvent, param2:String) : void
      {
         var _loc3_:WindowMouseEvent = param1 as WindowMouseEvent;
         if(_loc3_ == null)
         {
            return;
         }
         if(_loc3_.type == WindowMouseEvent.const_28)
         {
            var_1180.text = "";
         }
         else if(_loc3_.type == WindowMouseEvent.WINDOW_EVENT_MOUSE_OVER)
         {
            var_1180.text = param2;
         }
      }
      
      public function openFriendList() : void
      {
         if(var_27 == null)
         {
            prepare();
            _friendList.toolbar.events.dispatchEvent(new HabboToolbarShowMenuEvent(HabboToolbarShowMenuEvent.const_45,HabboToolbarIconEnum.FRIENDLIST,var_27));
         }
         else
         {
            var_27.visible = true;
            var_27.activate();
         }
      }
      
      private function getTitleBar() : IWindowContainer
      {
         return var_27.findChildByName("titlebar") as IWindowContainer;
      }
      
      public function get tabsView() : FriendListTabsView
      {
         return var_1179;
      }
      
      private function refreshWindowSize() : void
      {
         this.var_1864 = true;
         var_257.visible = false;
         var_257.y = Util.getLowestPoint(var_27.content);
         var_257.width = _friendList.tabs.windowWidth;
         var_257.visible = true;
         var_27.content.height = Util.getLowestPoint(var_27.content);
         var_27.content.width = _friendList.tabs.windowWidth - 10;
         var_27.header.width = _friendList.tabs.windowWidth - 10;
         var_27.height = var_27.content.height + 30;
         var_27.width = _friendList.tabs.windowWidth;
         this.var_1864 = false;
         var_27.scaler.setParamFlag(HabboWindowParam.const_498,false);
         var_27.scaler.setParamFlag(HabboWindowParam.const_799,this._friendList.tabs.findSelectedTab() != null);
         var_27.scaler.setParamFlag(HabboWindowParam.const_561,false);
         var_27.scaler.setParamFlag(HabboWindowParam.const_796,false);
         var_27.scaler.x = 0 - var_27.scaler.width;
         var_27.scaler.y = 0 - var_27.scaler.height;
         var_1405 = var_27.height;
         var_1406 = var_27.width;
         Logger.log("RESIZED: " + _friendList.tabs.windowWidth);
      }
      
      public function isFriendListOpen() : Boolean
      {
         return var_27 != null && false;
      }
      
      public function refresh(param1:String) : void
      {
         if(this.var_27 == null)
         {
            return;
         }
         var_1179.refresh(param1);
         refreshWindowSize();
      }
      
      public function get mainWindow() : IWindowContainer
      {
         return var_27;
      }
      
      private function onWindow(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowEvent.const_43 || param2 != var_27)
         {
            return;
         }
         if(this.var_1864)
         {
            return;
         }
         var _loc3_:int = var_1405 == -1 ? 0 : int(0 - var_1405);
         var _loc4_:int = var_1406 == -1 ? 0 : int(0 - var_1406);
         _friendList.tabs.tabContentHeight = Math.max(100,_friendList.tabs.tabContentHeight + _loc3_);
         _friendList.tabs.windowWidth = Math.max(147,_friendList.tabs.windowWidth + _loc4_);
         refresh("resize: " + _loc3_);
      }
      
      private function onEditCategoriesButtonClick(param1:WindowEvent, param2:IWindow) : void
      {
         _friendList.view.showInfo(param1,"${friendlist.tip.preferences}");
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         Logger.log("Edit categories clicked");
         var _loc3_:WindowMouseEvent = param1 as WindowMouseEvent;
         _friendList.openHabboWebPage("link.format.friendlist.pref",new Dictionary(),_loc3_.stageX,_loc3_.stageY);
      }
      
      public function close() : void
      {
         if(this.var_27 != null)
         {
            this.var_27.visible = false;
         }
      }
   }
}
