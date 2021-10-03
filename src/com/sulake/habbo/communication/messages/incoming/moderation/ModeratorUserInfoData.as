package com.sulake.habbo.communication.messages.incoming.moderation
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class ModeratorUserInfoData
   {
       
      
      private var var_1715:int;
      
      private var var_1716:int;
      
      private var var_1718:int;
      
      private var _userName:String;
      
      private var var_1717:int;
      
      private var var_1713:int;
      
      private var var_1714:int;
      
      private var _userId:int;
      
      private var var_609:Boolean;
      
      public function ModeratorUserInfoData(param1:IMessageDataWrapper)
      {
         super();
         _userId = param1.readInteger();
         _userName = param1.readString();
         var_1713 = param1.readInteger();
         var_1717 = param1.readInteger();
         var_609 = param1.readBoolean();
         var_1718 = param1.readInteger();
         var_1716 = param1.readInteger();
         var_1715 = param1.readInteger();
         var_1714 = param1.readInteger();
      }
      
      public function get banCount() : int
      {
         return var_1714;
      }
      
      public function get userId() : int
      {
         return _userId;
      }
      
      public function get online() : Boolean
      {
         return var_609;
      }
      
      public function get minutesSinceLastLogin() : int
      {
         return var_1717;
      }
      
      public function get abusiveCfhCount() : int
      {
         return var_1716;
      }
      
      public function get cautionCount() : int
      {
         return var_1715;
      }
      
      public function get cfhCount() : int
      {
         return var_1718;
      }
      
      public function get minutesSinceRegistration() : int
      {
         return var_1713;
      }
      
      public function get userName() : String
      {
         return _userName;
      }
   }
}
