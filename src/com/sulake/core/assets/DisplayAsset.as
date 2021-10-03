package com.sulake.core.assets
{
   import flash.display.DisplayObject;
   
   public class DisplayAsset implements IAsset
   {
       
      
      protected var var_33:DisplayObject;
      
      protected var _disposed:Boolean = false;
      
      protected var var_859:String;
      
      protected var var_418:AssetTypeDeclaration;
      
      public function DisplayAsset(param1:AssetTypeDeclaration, param2:String = null)
      {
         super();
         var_418 = param1;
         var_859 = param2;
      }
      
      public function get declaration() : AssetTypeDeclaration
      {
         return var_418;
      }
      
      public function get disposed() : Boolean
      {
         return _disposed;
      }
      
      public function setParamsDesc(param1:XMLList) : void
      {
      }
      
      public function setFromOtherAsset(param1:IAsset) : void
      {
         if(param1 is DisplayAsset)
         {
            var_33 = DisplayAsset(param1).var_33;
            var_418 = DisplayAsset(param1).var_418;
            return;
         }
         throw new Error("Provided asset should be of type DisplayAsset!");
      }
      
      public function get url() : String
      {
         return var_859;
      }
      
      public function setUnknownContent(param1:Object) : void
      {
         if(param1 is DisplayObject)
         {
            var_33 = param1 as DisplayObject;
            if(var_33 != null)
            {
               return;
            }
            throw new Error("Failed to convert DisplayObject to DisplayAsset!");
         }
         if(param1 is DisplayAsset)
         {
            var_33 = DisplayAsset(param1).var_33;
            var_418 = DisplayAsset(param1).var_418;
            if(var_33 == null)
            {
               throw new Error("Failed to read content from DisplayAsset!");
            }
         }
      }
      
      public function get content() : Object
      {
         return var_33;
      }
      
      public function dispose() : void
      {
         if(!_disposed)
         {
            if(false)
            {
               if(var_33.loaderInfo.loader != null)
               {
                  var_33.loaderInfo.loader.unload();
               }
            }
            var_33 = null;
            var_418 = null;
            _disposed = true;
            var_859 = null;
         }
      }
   }
}
