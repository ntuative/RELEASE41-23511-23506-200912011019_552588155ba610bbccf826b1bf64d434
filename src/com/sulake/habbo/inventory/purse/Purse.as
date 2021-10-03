package com.sulake.habbo.inventory.purse
{
   public class Purse
   {
       
      
      private var var_1536:Boolean = false;
      
      private var var_1532:int = 0;
      
      private var var_1535:int = 0;
      
      private var var_1534:int = 0;
      
      private var var_1537:int = 0;
      
      private var var_1533:int = 0;
      
      public function Purse()
      {
         super();
      }
      
      public function set creditBalance(param1:int) : void
      {
         var_1537 = Math.max(0,param1);
      }
      
      public function get clubPastPeriods() : int
      {
         return var_1532;
      }
      
      public function get clubHasEverBeenMember() : Boolean
      {
         return var_1536;
      }
      
      public function set clubHasEverBeenMember(param1:Boolean) : void
      {
         var_1536 = param1;
      }
      
      public function set clubPastPeriods(param1:int) : void
      {
         var_1532 = Math.max(0,param1);
      }
      
      public function set clubDays(param1:int) : void
      {
         var_1535 = Math.max(0,param1);
      }
      
      public function get creditBalance() : int
      {
         return var_1537;
      }
      
      public function set pixelBalance(param1:int) : void
      {
         var_1534 = Math.max(0,param1);
      }
      
      public function get clubDays() : int
      {
         return var_1535;
      }
      
      public function get pixelBalance() : int
      {
         return var_1534;
      }
      
      public function set clubPeriods(param1:int) : void
      {
         var_1533 = Math.max(0,param1);
      }
      
      public function get clubPeriods() : int
      {
         return var_1533;
      }
   }
}
