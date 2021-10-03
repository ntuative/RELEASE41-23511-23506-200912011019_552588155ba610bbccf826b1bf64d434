package com.sulake.habbo.help.tutorial
{
   import com.sulake.core.assets.BitmapDataAsset;
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.core.window.components.IBitmapWrapperWindow;
   import com.sulake.core.window.components.IItemListWindow;
   import com.sulake.core.window.events.WindowEvent;
   import com.sulake.core.window.events.WindowMouseEvent;
   import com.sulake.habbo.help.enum.HabboHelpTutorialEvent;
   import com.sulake.habbo.toolbar.HabboToolbarIconEnum;
   import com.sulake.habbo.toolbar.events.HabboToolbarSetIconEvent;
   import com.sulake.habbo.toolbar.events.HabboToolbarShowMenuEvent;
   import flash.display.BitmapData;
   
   public class TutorialClothesChangeView implements ITutorialUIView
   {
       
      
      private var var_55:TutorialUI;
      
      private var var_546:IWindowContainer;
      
      public function TutorialClothesChangeView(param1:IItemListWindow, param2:TutorialUI)
      {
         super();
         var_55 = param2;
         var _loc3_:IWindowContainer = param2.buildXmlWindow("tutorial_change_clothes") as IWindowContainer;
         if(_loc3_ == null)
         {
            return;
         }
         _loc3_.procedure = windowProcedure;
         param1.addListItem(_loc3_ as IWindow);
         setToolbarIconHighlight(true);
         var_55.help.toolbar.events.addEventListener(HabboToolbarShowMenuEvent.const_45,onShowMenuEvent);
         var_55.prepareForTutorial();
      }
      
      public function setToolbarIconHighlight(param1:Boolean) : void
      {
         var _loc2_:HabboToolbarSetIconEvent = new HabboToolbarSetIconEvent(HabboToolbarSetIconEvent.const_151,HabboToolbarIconEnum.MEMENU);
         if(param1)
         {
            _loc2_.iconState = "highlight_blue";
            showToolbarIconHighlightArrow();
         }
         else
         {
            _loc2_.iconState = "0";
            hideToolbarIconHighlightArrow();
         }
         var_55.help.toolbar.events.dispatchEvent(_loc2_);
      }
      
      private function windowProcedure(param1:WindowEvent, param2:IWindow) : void
      {
         switch(param2.name)
         {
            case "button_cancel":
               if(param1.type == WindowMouseEvent.const_52)
               {
                  var_55.showView(TutorialUI.const_81);
               }
         }
      }
      
      private function onShowMenuEvent(param1:HabboToolbarShowMenuEvent) : void
      {
         if(param1.menuId == HabboToolbarIconEnum.MEMENU && param1.type == HabboToolbarShowMenuEvent.const_45)
         {
            setToolbarIconHighlight(false);
            hideToolbarIconHighlightArrow();
            var_55.help.events.dispatchEvent(new HabboHelpTutorialEvent(HabboHelpTutorialEvent.const_468));
         }
      }
      
      private function hideToolbarIconHighlightArrow() : void
      {
         if(var_546 != null)
         {
            var_546.dispose();
            var_546 = null;
         }
      }
      
      public function get id() : String
      {
         return TutorialUI.const_285;
      }
      
      private function showToolbarIconHighlightArrow() : void
      {
         var _loc2_:* = null;
         if(var_546 != null)
         {
            return;
         }
         var_546 = var_55.buildXmlWindow("tutorial_arrow") as IWindowContainer;
         var _loc1_:IBitmapWrapperWindow = var_546.findChildByName("arrow") as IBitmapWrapperWindow;
         if(_loc1_ != null)
         {
            _loc2_ = BitmapDataAsset(var_55.assets.getAssetByName("tutorial_highlight_blue_arrow"));
            _loc1_.bitmap = (_loc2_.content as BitmapData).clone();
         }
         var_55.help.toolbar.events.dispatchEvent(new HabboToolbarShowMenuEvent(HabboToolbarShowMenuEvent.const_45,HabboToolbarIconEnum.MEMENU_ARROW,var_546));
      }
      
      public function dispose() : void
      {
         setToolbarIconHighlight(false);
         var_55.help.toolbar.events.removeEventListener(HabboToolbarShowMenuEvent.const_45,onShowMenuEvent);
      }
   }
}
