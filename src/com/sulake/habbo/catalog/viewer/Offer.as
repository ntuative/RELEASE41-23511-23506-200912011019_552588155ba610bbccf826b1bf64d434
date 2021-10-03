package com.sulake.habbo.catalog.viewer
{
   import com.sulake.habbo.communication.messages.incoming.catalog.CatalogPageMessageOfferData;
   import com.sulake.habbo.communication.messages.incoming.catalog.CatalogPageMessageProductData;
   import com.sulake.habbo.session.furniture.IFurnitureData;
   import com.sulake.habbo.session.product.IProductData;
   
   public class Offer
   {
      
      public static const const_849:String = "price_type_none";
      
      public static const const_425:String = "pricing_model_multi";
      
      public static const const_320:String = "price_type_credits";
      
      public static const const_363:String = "price_type_credits_and_pixels";
      
      public static const const_380:String = "pricing_model_bundle";
      
      public static const const_459:String = "pricing_model_single";
      
      public static const const_610:String = "price_type_credits_or_credits_and_pixels";
      
      public static const const_1175:String = "pricing_model_unknown";
      
      public static const const_432:String = "price_type_pixels";
       
      
      private var var_790:int;
      
      private var var_1212:int;
      
      private var var_791:int;
      
      private var var_390:String;
      
      private var var_557:String;
      
      private var var_1969:int;
      
      private var var_645:ICatalogPage;
      
      private var var_1213:String;
      
      private var var_389:IProductContainer;
      
      public function Offer(param1:CatalogPageMessageOfferData, param2:ICatalogPage)
      {
         var _loc4_:* = null;
         var _loc5_:* = null;
         var _loc6_:* = null;
         var _loc7_:* = null;
         super();
         var_1212 = param1.offerId;
         var_1213 = param1.localizationId;
         var_790 = param1.priceInCredits;
         var_791 = param1.priceInPixels;
         var_645 = param2;
         var _loc3_:Array = new Array();
         for each(_loc4_ in param1.products)
         {
            _loc5_ = param2.viewer.catalog.getProductData(_loc4_.productType);
            _loc6_ = param2.viewer.catalog.getFurnitureData(_loc4_.furniClassId);
            _loc7_ = new Product(_loc4_,_loc5_,_loc6_);
            _loc3_.push(_loc7_);
         }
         analyzePricingModel(_loc3_);
         analyzePriceType();
         createProductContainer(_loc3_);
      }
      
      public function get pricingModel() : String
      {
         return var_390;
      }
      
      public function get page() : ICatalogPage
      {
         return var_645;
      }
      
      public function set previewCallbackId(param1:int) : void
      {
         var_1969 = param1;
      }
      
      public function get productContainer() : IProductContainer
      {
         return var_389;
      }
      
      public function get localizationId() : String
      {
         return var_1213;
      }
      
      public function get offerId() : int
      {
         return var_1212;
      }
      
      public function get priceInPixels() : int
      {
         return var_791;
      }
      
      public function dispose() : void
      {
         var_1212 = 0;
         var_1213 = "";
         var_790 = 0;
         var_791 = 0;
         var_645 = null;
         if(var_389 != null)
         {
            var_389.dispose();
            var_389 = null;
         }
      }
      
      public function get priceType() : String
      {
         return var_557;
      }
      
      public function get previewCallbackId() : int
      {
         return var_1969;
      }
      
      public function get priceInCredits() : int
      {
         return var_790;
      }
      
      private function analyzePricingModel(param1:Array) : void
      {
         var _loc2_:* = null;
         if(param1.length == 1)
         {
            _loc2_ = param1[0];
            if(_loc2_.productCount == 1)
            {
               var_390 = const_459;
            }
            else
            {
               var_390 = const_425;
            }
         }
         else if(param1.length > 1)
         {
            var_390 = const_380;
         }
         else
         {
            var_390 = const_1175;
         }
      }
      
      private function createProductContainer(param1:Array) : void
      {
         switch(var_390)
         {
            case const_459:
               var_389 = new SingleProductContainer(this,param1);
               break;
            case const_425:
               var_389 = new MultiProductContainer(this,param1);
               break;
            case const_380:
               var_389 = new BundleProductContainer(this,param1);
               break;
            default:
               Logger.log("[Offer] Unknown pricing model" + var_390);
         }
      }
      
      private function analyzePriceType() : void
      {
         if(var_790 > 0 && var_791 > 0)
         {
            var_557 = const_363;
         }
         else if(var_790 > 0)
         {
            var_557 = const_320;
         }
         else if(var_791 > 0)
         {
            var_557 = const_432;
         }
         else
         {
            var_557 = const_849;
         }
      }
   }
}
