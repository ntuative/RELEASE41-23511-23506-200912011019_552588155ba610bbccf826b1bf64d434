package com.sulake.habbo.communication.messages.parser.friendlist
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   import com.sulake.habbo.communication.messages.incoming.friendlist.FriendCategoryData;
   import com.sulake.habbo.communication.messages.incoming.friendlist.FriendData;
   
   public class MessengerInitMessageParser implements IMessageParser
   {
       
      
      private var var_2181:int;
      
      private var var_2183:int;
      
      private var var_2179:int;
      
      private var var_234:Array;
      
      private var var_2180:int;
      
      private var var_2182:int;
      
      private var var_326:Array;
      
      public function MessengerInitMessageParser()
      {
         super();
      }
      
      public function flush() : Boolean
      {
         this.var_326 = new Array();
         this.var_234 = new Array();
         return true;
      }
      
      public function get method_8() : int
      {
         return this.var_2181;
      }
      
      public function get friends() : Array
      {
         return this.var_234;
      }
      
      public function get normalFriendLimit() : int
      {
         return this.var_2179;
      }
      
      public function get categories() : Array
      {
         return this.var_326;
      }
      
      public function get friendRequestLimit() : int
      {
         return this.var_2183;
      }
      
      public function get userFriendLimit() : int
      {
         return this.var_2182;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var _loc4_:int = 0;
         this.var_2182 = param1.readInteger();
         this.var_2179 = param1.readInteger();
         this.var_2181 = param1.readInteger();
         var _loc2_:int = param1.readInteger();
         _loc4_ = 0;
         while(_loc4_ < _loc2_)
         {
            this.var_326.push(new FriendCategoryData(param1));
            _loc4_++;
         }
         var _loc3_:int = param1.readInteger();
         _loc4_ = 0;
         while(_loc4_ < _loc3_)
         {
            this.var_234.push(new FriendData(param1));
            _loc4_++;
         }
         this.var_2183 = param1.readInteger();
         this.var_2180 = param1.readInteger();
         return true;
      }
      
      public function get friendRequestCount() : int
      {
         return this.var_2180;
      }
   }
}
