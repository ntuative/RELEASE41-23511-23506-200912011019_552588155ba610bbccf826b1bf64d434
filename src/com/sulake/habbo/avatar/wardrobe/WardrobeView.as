package com.sulake.habbo.avatar.wardrobe
{
   import com.sulake.core.assets.IAssetLibrary;
   import com.sulake.core.assets.XmlAsset;
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.core.window.components.IItemListWindow;
   import com.sulake.core.window.events.WindowEvent;
   import com.sulake.core.window.events.WindowMouseEvent;
   import com.sulake.habbo.avatar.common.IAvatarEditorCategoryView;
   import com.sulake.habbo.catalog.enum.CatalogPageName;
   import com.sulake.habbo.window.IHabboWindowManager;
   import flash.events.Event;
   
   public class WardrobeView implements IAvatarEditorCategoryView
   {
       
      
      private var var_1356:IWindowContainer;
      
      private var _assetLibrary:IAssetLibrary;
      
      private var _window:IWindowContainer;
      
      private var var_612:IItemListWindow;
      
      private var var_512:IItemListWindow;
      
      private var _windowManager:IHabboWindowManager;
      
      private var var_735:IItemListWindow;
      
      private var var_93:WardrobeModel;
      
      private var var_736:int = 0;
      
      private var var_511:Array;
      
      public function WardrobeView(param1:WardrobeModel, param2:IHabboWindowManager, param3:IAssetLibrary)
      {
         var_511 = [];
         super();
         var_93 = param1;
         _assetLibrary = param3;
         _windowManager = param2;
         var _loc4_:XmlAsset = _assetLibrary.getAssetByName("avatareditor_wardrobe_base") as XmlAsset;
         _window = IWindowContainer(_windowManager.buildFromXML(_loc4_.content as XML));
         var_612 = _window.findChildByName("mylooks") as IItemListWindow;
         var_512 = _window.findChildByName("hotlooks") as IItemListWindow;
         var_735 = _window.findChildByName("selector") as IItemListWindow;
         var_1356 = _window.findChildByName("habboClubNotificationContainer") as IWindowContainer;
         _window.findChildByName("hotlooksMore").alphaTreshold = 0;
         _window.findChildByName("habboClubLink").alphaTreshold = 0;
         _window.visible = false;
         _window.procedure = windowEventProc;
         initSelector();
      }
      
      private function windowEventProc(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type == WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            switch(param2.name)
            {
               case "hotlooksMore":
                  Logger.log("More hot looks");
                  ++var_736;
                  updateHotLooks();
                  break;
               case "habboClubLink":
                  Logger.log("Open Catalog Habbo Club");
                  var_93.controller.catalog.openCatalogPage(CatalogPageName.const_319,true);
            }
         }
         else if(param1.type == WindowEvent.const_54)
         {
         }
      }
      
      private function myLooksEventProc(param1:Event, param2:IWindow = null) : void
      {
         if(param2 == null)
         {
            param2 = param1.target as IWindow;
         }
         if(param1.type == WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            var_93.selectMyLook(var_612.getListItemIndex(param2.parent));
         }
      }
      
      private function initSelector() : void
      {
         var _loc1_:* = null;
         for each(_loc1_ in var_511)
         {
            var_735.removeListItem(_loc1_.window);
            _loc1_.dispose();
         }
         var_511 = [];
         while(true)
         {
            _loc1_ = new Selector(var_93.controller);
            var_735.addListItem(_loc1_.window);
            _loc1_.window.addEventListener(WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK,myLooksSelectorEventProc);
            var_511.push(_loc1_);
         }
      }
      
      public function updateHotLooks() : void
      {
         var _loc3_:* = null;
         while(false)
         {
            var_512.removeListItemAt(0);
         }
         var _loc1_:int = 0;
         if(var_93.hotLooks.length < 8)
         {
            _loc1_ = 0;
         }
         else
         {
            _loc1_ = var_736 * 8;
         }
         if(_loc1_ > var_93.hotLooks.length)
         {
            var_736 = 0;
            _loc1_ = 0;
         }
         var _loc2_:int = 0;
         for each(_loc3_ in var_93.hotLooks)
         {
            if(_loc2_ >= _loc1_ && true)
            {
               var_512.addListItem(_loc3_.view.window);
               _loc3_.view.window.procedure = hotLooksEventProc;
            }
            _loc2_++;
         }
      }
      
      public function updateMyLooks(param1:int) : void
      {
         var _loc2_:* = null;
         if(!var_93.controller.isHabboClubMember)
         {
            var_1356.visible = true;
            _window.findChildByName("myLooksContainer").visible = false;
            _window.findChildByName("myLooksChooser").visible = false;
         }
         else
         {
            var_1356.visible = false;
            _window.findChildByName("myLooksContainer").visible = true;
            _window.findChildByName("myLooksChooser").visible = true;
            while(false)
            {
               var_612.removeListItemAt(0);
            }
            for each(_loc2_ in var_93.myLooks)
            {
               var_612.addListItem(_loc2_.view.window);
               _loc2_.view.window.procedure = myLooksEventProc;
            }
         }
      }
      
      private function myLooksSelectorEventProc(param1:Event, param2:IWindow = null) : void
      {
         var _loc3_:int = 0;
         if(param2 == null)
         {
            param2 = param1.target as IWindow;
         }
         if(param1.type == WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            _loc3_ = var_735.getListItemIndex(param2);
            var_93.storeNewMyLook(_loc3_);
         }
      }
      
      public function dispose() : void
      {
         var _loc1_:* = null;
         for each(_loc1_ in var_511)
         {
            var_735.removeListItem(_loc1_.window);
            _loc1_.dispose();
         }
         var_511 = [];
         while(false)
         {
            var_612.removeListItemAt(0);
         }
         while(false)
         {
            var_512.removeListItemAt(0);
         }
         _window.dispose();
         _window = null;
      }
      
      private function hotLooksEventProc(param1:Event, param2:IWindow = null) : void
      {
         var _loc3_:int = 0;
         if(param2 == null)
         {
            param2 = param1.target as IWindow;
         }
         if(param1.type == WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            _loc3_ = var_736 * 8 + var_512.getListItemIndex(param2.parent);
            var_93.selectHotLook(_loc3_);
         }
      }
      
      public function getWindowContainer() : IWindowContainer
      {
         return _window;
      }
   }
}
