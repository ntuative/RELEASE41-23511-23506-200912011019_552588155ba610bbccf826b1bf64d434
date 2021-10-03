package com.sulake.habbo.catalog.viewer.widgets
{
   import com.sulake.core.assets.XmlAsset;
   import com.sulake.core.localization.ICoreLocalizationManager;
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.core.window.components.IButtonWindow;
   import com.sulake.core.window.components.ITextWindow;
   import com.sulake.core.window.events.WindowMouseEvent;
   import com.sulake.habbo.catalog.HabboCatalog;
   import com.sulake.habbo.catalog.viewer.Offer;
   import com.sulake.habbo.catalog.viewer.widgets.events.SelectProductEvent;
   import com.sulake.habbo.catalog.viewer.widgets.events.SetExtraPurchaseParameterEvent;
   import com.sulake.habbo.catalog.viewer.widgets.events.WidgetEvent;
   
   public class PurchaseCatalogWidget extends CatalogWidget implements ICatalogWidget
   {
       
      
      private var var_1912:XML;
      
      private var var_1425:ITextWindow;
      
      private var var_1423:ITextWindow;
      
      private var var_1909:XML;
      
      private var var_782:IWindowContainer;
      
      private var var_2201:ITextWindow;
      
      private var var_1911:String = "";
      
      private var var_2249:IButtonWindow;
      
      private var var_1913:XML;
      
      private var var_1424:ITextWindow;
      
      private var var_1910:XML;
      
      private var var_781:IButtonWindow;
      
      private var var_170:Offer;
      
      public function PurchaseCatalogWidget(param1:IWindowContainer)
      {
         super(param1);
      }
      
      private function attachStub(param1:String) : void
      {
         var _loc2_:* = null;
         switch(param1)
         {
            case Offer.const_320:
               _loc2_ = page.viewer.catalog.windowManager.buildFromXML(var_1909) as IWindowContainer;
               break;
            case Offer.const_432:
               _loc2_ = page.viewer.catalog.windowManager.buildFromXML(var_1910) as IWindowContainer;
               break;
            case Offer.const_363:
               _loc2_ = page.viewer.catalog.windowManager.buildFromXML(var_1912) as IWindowContainer;
               break;
            case Offer.const_610:
               _loc2_ = page.viewer.catalog.windowManager.buildFromXML(var_1913) as IWindowContainer;
               break;
            default:
               Logger.log("Unknown price-type, can\'t attach...undefined");
         }
         if(_loc2_ != null)
         {
            if(var_782 != null)
            {
               _window.removeChild(var_782);
               var_782.dispose();
            }
            var_782 = _loc2_;
            _window.addChild(_loc2_);
            var_782.x = 0;
            var_782.y = 0;
         }
         var_1424 = _window.findChildByName("ctlg_price_credits") as ITextWindow;
         var_1423 = _window.findChildByName("ctlg_price_pixels") as ITextWindow;
         var_1425 = _window.findChildByName("ctlg_price_credits_pixels") as ITextWindow;
         var_2201 = _window.findChildByName("ctlg_special_txt") as ITextWindow;
         var_781 = window.findChildByName("ctlg_buy_button") as IButtonWindow;
         if(var_781 != null)
         {
            var_781.addEventListener(WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK,onPurchase);
            var_781.disable();
         }
      }
      
      private function onPurchase(param1:WindowMouseEvent) : void
      {
         if(var_170 != null)
         {
            Logger.log("Init Purchase: undefined undefined");
            (page.viewer.catalog as HabboCatalog).showPurchaseConfirmation(var_170,page,var_1911);
         }
      }
      
      override public function init() : void
      {
         var _loc1_:XmlAsset = page.viewer.catalog.assets.getAssetByName("purchaseWidgetCreditsStub") as XmlAsset;
         if(_loc1_ != null)
         {
            var_1909 = _loc1_.content as XML;
         }
         var _loc2_:XmlAsset = page.viewer.catalog.assets.getAssetByName("purchaseWidgetPixelsStub") as XmlAsset;
         if(_loc2_ != null)
         {
            var_1910 = _loc2_.content as XML;
         }
         var _loc3_:XmlAsset = page.viewer.catalog.assets.getAssetByName("purchaseWidgetCreditsPixelsStub") as XmlAsset;
         if(_loc3_ != null)
         {
            var_1912 = _loc3_.content as XML;
         }
         var _loc4_:XmlAsset = page.viewer.catalog.assets.getAssetByName("purchaseWidgetCreditsOrCreditsAndPixelsStub") as XmlAsset;
         if(_loc4_ != null)
         {
            var_1913 = _loc4_.content as XML;
         }
         events.addEventListener(WidgetEvent.CWE_SELECT_PRODUCT,onSelectProduct);
         events.addEventListener(WidgetEvent.const_910,onSetParameter);
      }
      
      private function onSetParameter(param1:SetExtraPurchaseParameterEvent) : void
      {
         var_1911 = param1.parameter;
      }
      
      private function onSelectProduct(param1:SelectProductEvent) : void
      {
         var _loc2_:ICoreLocalizationManager = (page.viewer.catalog as HabboCatalog).localization;
         var_170 = param1.offer;
         attachStub(var_170.priceType);
         if(var_1424 != null)
         {
            _loc2_.registerParameter("catalog.purchase.price.credits","credits",String(var_170.priceInCredits));
            var_1424.caption = "${catalog.purchase.price.credits}";
         }
         if(var_1423 != null)
         {
            _loc2_.registerParameter("catalog.purchase.price.pixels","pixels",String(var_170.priceInPixels));
            var_1423.caption = "${catalog.purchase.price.pixels}";
         }
         if(var_1425 != null)
         {
            _loc2_.registerParameter("catalog.purchase.price.credits+pixels","credits",String(var_170.priceInCredits));
            _loc2_.registerParameter("catalog.purchase.price.credits+pixels","pixels",String(var_170.priceInPixels));
            var_1425.caption = "${catalog.purchase.price.credits+pixels}";
         }
         if(var_781 != null)
         {
            var_781.enable();
         }
      }
   }
}
