package com.sulake.core.runtime
{
   class ComponentInterfaceQueue implements IDisposable
   {
       
      
      private var var_1182:IID;
      
      private var _isDisposed:Boolean;
      
      private var var_770:Array;
      
      function ComponentInterfaceQueue(param1:IID)
      {
         super();
         var_1182 = param1;
         var_770 = new Array();
         _isDisposed = false;
      }
      
      public function get receivers() : Array
      {
         return var_770;
      }
      
      public function get identifier() : IID
      {
         return var_1182;
      }
      
      public function get disposed() : Boolean
      {
         return _isDisposed;
      }
      
      public function dispose() : void
      {
         if(!_isDisposed)
         {
            _isDisposed = true;
            var_1182 = null;
            while(false)
            {
               var_770.pop();
            }
            var_770 = null;
         }
      }
   }
}
