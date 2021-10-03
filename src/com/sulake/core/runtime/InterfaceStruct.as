package com.sulake.core.runtime
{
   import flash.utils.getQualifiedClassName;
   
   final class InterfaceStruct
   {
       
      
      private var var_961:IID;
      
      private var var_382:uint;
      
      private var var_1183:IUnknown;
      
      private var var_1184:String;
      
      function InterfaceStruct(param1:IID, param2:IUnknown)
      {
         super();
         var_961 = param1;
         var_1184 = getQualifiedClassName(var_961);
         var_1183 = param2;
         var_382 = 0;
      }
      
      public function get iid() : IID
      {
         return var_961;
      }
      
      public function get references() : uint
      {
         return var_382;
      }
      
      public function release() : uint
      {
         return references > 0 ? uint(--var_382) : uint(0);
      }
      
      public function get unknown() : IUnknown
      {
         return var_1183;
      }
      
      public function get iis() : String
      {
         return var_1184;
      }
      
      public function reserve() : uint
      {
         return ++var_382;
      }
      
      public function dispose() : void
      {
         var_961 = null;
         var_1184 = null;
         var_1183 = null;
         var_382 = 0;
      }
   }
}
