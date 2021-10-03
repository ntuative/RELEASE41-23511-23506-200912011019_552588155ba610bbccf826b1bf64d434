package com.sulake.habbo.catalog.viewer.widgets.events
{
   import flash.events.Event;
   
   public class CatalogWidgetColoursEvent extends Event
   {
       
      
      private var var_1265:Array;
      
      private var var_1978:String;
      
      private var var_1979:String;
      
      private var var_1980:String;
      
      public function CatalogWidgetColoursEvent(param1:Array, param2:String, param3:String, param4:String, param5:Boolean = false, param6:Boolean = false)
      {
         super(WidgetEvent.CWE_COLOUR_ARRAY,param5,param6);
         var_1265 = param1;
         var_1978 = param2;
         var_1979 = param3;
         var_1980 = param4;
      }
      
      public function get colours() : Array
      {
         return var_1265;
      }
      
      public function get backgroundAssetName() : String
      {
         return var_1978;
      }
      
      public function get colourAssetName() : String
      {
         return var_1979;
      }
      
      public function get chosenColourAssetName() : String
      {
         return var_1980;
      }
   }
}
