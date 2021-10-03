package com.sulake.core.runtime.events
{
   import flash.utils.Dictionary;
   
   public class EventListenerStruct
   {
       
      
      public var var_2232:Boolean;
      
      public var priority:int;
      
      private var var_131:Dictionary;
      
      public var var_2140:Boolean;
      
      public function EventListenerStruct(param1:Function, param2:Boolean = false, param3:int = 0, param4:Boolean = false)
      {
         super();
         var_131 = new Dictionary(param4);
         this.callback = param1;
         this.var_2140 = param2;
         this.priority = param3;
         this.var_2232 = param4;
      }
      
      public function set callback(param1:Function) : void
      {
         var _loc2_:* = null;
         for(_loc2_ in var_131)
         {
            delete var_131[_loc2_];
         }
         var_131[param1] = null;
      }
      
      public function get callback() : Function
      {
         var _loc1_:* = null;
         var _loc2_:int = 0;
         var _loc3_:* = var_131;
         for(_loc1_ in _loc3_)
         {
            return _loc1_ as Function;
         }
         return null;
      }
   }
}
