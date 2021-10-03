package com.sulake.habbo.communication.messages.incoming.recycler
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class PrizeLevelMessageData
   {
       
      
      private var var_1863:int;
      
      private var var_1104:int;
      
      private var var_606:Array;
      
      public function PrizeLevelMessageData(param1:IMessageDataWrapper)
      {
         super();
         var_1104 = param1.readInteger();
         var_1863 = param1.readInteger();
         var_606 = new Array();
         var _loc2_:int = param1.readInteger();
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_)
         {
            var_606.push(new PrizeMessageData(param1));
            _loc3_++;
         }
      }
      
      public function get probabilityDenominator() : int
      {
         return var_1863;
      }
      
      public function get prizes() : Array
      {
         return var_606;
      }
      
      public function get prizeLevelId() : int
      {
         return var_1104;
      }
   }
}
