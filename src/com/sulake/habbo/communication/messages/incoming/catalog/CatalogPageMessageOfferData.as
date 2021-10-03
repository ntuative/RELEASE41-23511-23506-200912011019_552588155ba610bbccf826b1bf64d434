package com.sulake.habbo.communication.messages.incoming.catalog
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class CatalogPageMessageOfferData
   {
       
      
      private var var_785:Array;
      
      private var var_790:int;
      
      private var var_1213:String;
      
      private var var_1212:int;
      
      private var var_791:int;
      
      public function CatalogPageMessageOfferData(param1:IMessageDataWrapper)
      {
         super();
         var_1212 = param1.readInteger();
         var_1213 = param1.readString();
         var_790 = param1.readInteger();
         var_791 = param1.readInteger();
         var _loc2_:int = param1.readInteger();
         var_785 = new Array();
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_)
         {
            var_785.push(new CatalogPageMessageProductData(param1));
            _loc3_++;
         }
      }
      
      public function get products() : Array
      {
         return var_785;
      }
      
      public function get priceInCredits() : int
      {
         return var_790;
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
   }
}
