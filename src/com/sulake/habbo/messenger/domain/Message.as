package com.sulake.habbo.messenger.domain
{
   public class Message
   {
      
      public static const const_617:int = 2;
      
      public static const const_778:int = 6;
      
      public static const const_659:int = 1;
      
      public static const const_685:int = 3;
      
      public static const const_819:int = 4;
      
      public static const const_517:int = 5;
       
      
      private var var_2102:String;
      
      private var var_925:int;
      
      private var var_1710:String;
      
      private var _type:int;
      
      public function Message(param1:int, param2:int, param3:String, param4:String)
      {
         super();
         _type = param1;
         var_925 = param2;
         var_1710 = param3;
         var_2102 = param4;
      }
      
      public function get time() : String
      {
         return var_2102;
      }
      
      public function get senderId() : int
      {
         return var_925;
      }
      
      public function get messageText() : String
      {
         return var_1710;
      }
      
      public function get type() : int
      {
         return _type;
      }
   }
}
