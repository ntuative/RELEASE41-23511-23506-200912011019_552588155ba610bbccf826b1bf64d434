package com.sulake.core.assets
{
   import com.sulake.core.assets.loaders.IAssetLoader;
   import com.sulake.core.runtime.IDisposable;
   import com.sulake.core.runtime.events.EventDispatcher;
   
   public class AssetLoaderStruct extends EventDispatcher implements IDisposable
   {
       
      
      private var var_672:IAssetLoader;
      
      private var var_1242:String;
      
      public function AssetLoaderStruct(param1:String, param2:IAssetLoader)
      {
         super();
         var_1242 = param1;
         var_672 = param2;
      }
      
      public function get assetLoader() : IAssetLoader
      {
         return var_672;
      }
      
      override public function dispose() : void
      {
         if(!disposed)
         {
            if(var_672 != null)
            {
               if(true)
               {
                  var_672.dispose();
                  var_672 = null;
               }
            }
            super.dispose();
         }
      }
      
      public function get assetName() : String
      {
         return var_1242;
      }
   }
}
