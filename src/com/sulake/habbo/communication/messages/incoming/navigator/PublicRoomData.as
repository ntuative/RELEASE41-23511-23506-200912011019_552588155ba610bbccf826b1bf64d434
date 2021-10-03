package com.sulake.habbo.communication.messages.incoming.navigator
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.runtime.IDisposable;
   
   public class PublicRoomData implements IDisposable
   {
       
      
      private var var_1549:int;
      
      private var var_2030:String;
      
      private var var_1557:int;
      
      private var _disposed:Boolean;
      
      private var var_2029:int;
      
      private var var_1776:String;
      
      private var var_1128:int;
      
      public function PublicRoomData(param1:IMessageDataWrapper)
      {
         super();
         var_1776 = param1.readString();
         var_1549 = param1.readInteger();
         var_1557 = param1.readInteger();
         var_2030 = param1.readString();
         var_2029 = param1.readInteger();
         var_1128 = param1.readInteger();
      }
      
      public function get maxUsers() : int
      {
         return var_2029;
      }
      
      public function get worldId() : int
      {
         return var_1557;
      }
      
      public function get disposed() : Boolean
      {
         return _disposed;
      }
      
      public function dispose() : void
      {
         if(_disposed)
         {
            return;
         }
         _disposed = true;
      }
      
      public function get unitPropertySet() : String
      {
         return var_1776;
      }
      
      public function get unitPort() : int
      {
         return var_1549;
      }
      
      public function get castLibs() : String
      {
         return var_2030;
      }
      
      public function get nodeId() : int
      {
         return var_1128;
      }
   }
}
