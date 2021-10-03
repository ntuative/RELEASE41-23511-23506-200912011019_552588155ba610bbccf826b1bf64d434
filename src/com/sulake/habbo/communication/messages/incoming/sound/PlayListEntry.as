package com.sulake.habbo.communication.messages.incoming.sound
{
   public class PlayListEntry
   {
       
      
      private var var_1821:int;
      
      private var var_1818:int = 0;
      
      private var var_1820:String;
      
      private var var_1819:int;
      
      private var var_1822:String;
      
      public function PlayListEntry(param1:int, param2:int, param3:String, param4:String)
      {
         super();
         var_1821 = param1;
         var_1819 = param2;
         var_1822 = param3;
         var_1820 = param4;
      }
      
      public function get length() : int
      {
         return var_1819;
      }
      
      public function get name() : String
      {
         return var_1822;
      }
      
      public function get creator() : String
      {
         return var_1820;
      }
      
      public function get startPlayHeadPos() : int
      {
         return var_1818;
      }
      
      public function get id() : int
      {
         return var_1821;
      }
      
      public function set startPlayHeadPos(param1:int) : void
      {
         var_1818 = param1;
      }
   }
}
