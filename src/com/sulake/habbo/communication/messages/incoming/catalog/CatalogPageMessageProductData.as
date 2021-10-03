package com.sulake.habbo.communication.messages.incoming.catalog
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class CatalogPageMessageProductData
   {
      
      public static const const_303:String = "e";
      
      public static const const_136:String = "i";
      
      public static const const_159:String = "s";
       
      
      private var var_904:String;
      
      private var var_1094:String;
      
      private var var_1095:int;
      
      private var var_1696:int;
      
      private var var_903:int;
      
      public function CatalogPageMessageProductData(param1:IMessageDataWrapper)
      {
         super();
         var_1094 = param1.readString();
         var_1696 = param1.readInteger();
         var_904 = param1.readString();
         var_903 = param1.readInteger();
         var_1095 = param1.readInteger();
      }
      
      public function get productCount() : int
      {
         return var_903;
      }
      
      public function get productType() : String
      {
         return var_1094;
      }
      
      public function get expiration() : int
      {
         return var_1095;
      }
      
      public function get furniClassId() : int
      {
         return var_1696;
      }
      
      public function get extraParam() : String
      {
         return var_904;
      }
   }
}
