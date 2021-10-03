package com.sulake.core.window.utils
{
   import com.sulake.core.runtime.IDisposable;
   
   public class TextMargins implements IMargins, IDisposable
   {
       
      
      private var _disposed:Boolean = false;
      
      private var var_823:int;
      
      private var _right:int;
      
      private var var_824:int;
      
      private var var_825:int;
      
      private var var_182:Function;
      
      public function TextMargins(param1:int, param2:int, param3:int, param4:int, param5:Function)
      {
         super();
         var_824 = param1;
         var_825 = param2;
         _right = param3;
         var_823 = param4;
         var_182 = param5 != null ? param5 : nullCallback;
      }
      
      public function set bottom(param1:int) : void
      {
         var_823 = param1;
         var_182(this);
      }
      
      public function get left() : int
      {
         return var_824;
      }
      
      public function get isZeroes() : Boolean
      {
         return var_824 == 0 && _right == 0 && var_825 == 0 && var_823 == 0;
      }
      
      public function get right() : int
      {
         return _right;
      }
      
      public function get disposed() : Boolean
      {
         return _disposed;
      }
      
      public function set top(param1:int) : void
      {
         var_825 = param1;
         var_182(this);
      }
      
      public function get top() : int
      {
         return var_825;
      }
      
      public function set left(param1:int) : void
      {
         var_824 = param1;
         var_182(this);
      }
      
      public function get bottom() : int
      {
         return var_823;
      }
      
      public function clone(param1:Function) : TextMargins
      {
         return new TextMargins(var_824,var_825,_right,var_823,param1);
      }
      
      public function dispose() : void
      {
         var_182 = null;
         _disposed = true;
      }
      
      public function set right(param1:int) : void
      {
         _right = param1;
         var_182(this);
      }
      
      private function nullCallback(param1:IMargins) : void
      {
      }
   }
}
