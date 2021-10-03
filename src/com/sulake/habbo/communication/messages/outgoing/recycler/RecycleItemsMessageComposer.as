package com.sulake.habbo.communication.messages.outgoing.recycler
{
   import com.sulake.core.communication.messages.IMessageComposer;
   
   public class RecycleItemsMessageComposer implements IMessageComposer
   {
       
      
      private var var_807:Array;
      
      public function RecycleItemsMessageComposer(param1:Array)
      {
         super();
         var_807 = new Array();
         var_807.push(param1.length);
         var_807 = var_807.concat(param1);
      }
      
      public function dispose() : void
      {
      }
      
      public function getMessageArray() : Array
      {
         return var_807;
      }
   }
}
