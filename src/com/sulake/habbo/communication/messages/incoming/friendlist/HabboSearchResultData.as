package com.sulake.habbo.communication.messages.incoming.friendlist
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class HabboSearchResultData
   {
       
      
      private var var_2175:Boolean;
      
      private var var_2176:int;
      
      private var var_2178:Boolean;
      
      private var var_1349:String;
      
      private var var_1174:String;
      
      private var var_1525:int;
      
      private var var_1698:String;
      
      private var var_2177:String;
      
      private var var_1697:String;
      
      public function HabboSearchResultData(param1:IMessageDataWrapper)
      {
         super();
         this.var_1525 = param1.readInteger();
         this.var_1349 = param1.readString();
         this.var_1698 = param1.readString();
         this.var_2175 = param1.readBoolean();
         this.var_2178 = param1.readBoolean();
         param1.readString();
         this.var_2176 = param1.readInteger();
         this.var_1697 = param1.readString();
         this.var_2177 = param1.readString();
         this.var_1174 = param1.readString();
      }
      
      public function get realName() : String
      {
         return this.var_1174;
      }
      
      public function get avatarName() : String
      {
         return this.var_1349;
      }
      
      public function get avatarId() : int
      {
         return this.var_1525;
      }
      
      public function get isAvatarOnline() : Boolean
      {
         return this.var_2175;
      }
      
      public function get lastOnlineDate() : String
      {
         return this.var_2177;
      }
      
      public function get avatarFigure() : String
      {
         return this.var_1697;
      }
      
      public function get canFollow() : Boolean
      {
         return this.var_2178;
      }
      
      public function get avatarMotto() : String
      {
         return this.var_1698;
      }
      
      public function get avatarGender() : int
      {
         return this.var_2176;
      }
   }
}
