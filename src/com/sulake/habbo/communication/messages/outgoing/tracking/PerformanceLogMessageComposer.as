package com.sulake.habbo.communication.messages.outgoing.tracking
{
   import com.sulake.core.communication.messages.IMessageComposer;
   
   public class PerformanceLogMessageComposer implements IMessageComposer
   {
       
      
      private var var_901:int = 0;
      
      private var var_1083:int = 0;
      
      private var var_1666:String = "";
      
      private var var_900:int = 0;
      
      private var var_1662:String = "";
      
      private var var_1667:int = 0;
      
      private var var_1343:String = "";
      
      private var var_1661:int = 0;
      
      private var var_1664:int = 0;
      
      private var var_1665:String = "";
      
      private var var_1663:int = 0;
      
      public function PerformanceLogMessageComposer(param1:int, param2:String, param3:String, param4:String, param5:String, param6:Boolean, param7:int, param8:int, param9:int, param10:int, param11:int)
      {
         super();
         var_1661 = param1;
         var_1665 = param2;
         var_1343 = param3;
         var_1666 = param4;
         var_1662 = param5;
         if(param6)
         {
            var_1083 = 1;
         }
         else
         {
            var_1083 = 0;
         }
         var_1667 = param7;
         var_1664 = param8;
         var_900 = param9;
         var_1663 = param10;
         var_901 = param11;
      }
      
      public function getMessageArray() : Array
      {
         return [var_1661,var_1665,var_1343,var_1666,var_1662,var_1083,var_1667,var_1664,var_900,var_1663,var_901];
      }
      
      public function dispose() : void
      {
      }
   }
}
