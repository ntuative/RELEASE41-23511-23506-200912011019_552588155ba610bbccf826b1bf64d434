package com.sulake.habbo.communication.messages.incoming.friendlist
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class FriendData
   {
       
      
      private var var_514:String;
      
      private var var_1176:String;
      
      private var var_1177:String;
      
      private var var_1175:int;
      
      private var _gender:int;
      
      private var var_1174:String;
      
      private var _name:String;
      
      private var var_1173:Boolean;
      
      private var var_609:Boolean;
      
      private var _id:int;
      
      public function FriendData(param1:IMessageDataWrapper)
      {
         super();
         this._id = param1.readInteger();
         this._name = param1.readString();
         this._gender = param1.readInteger();
         this.var_609 = param1.readBoolean();
         this.var_1173 = param1.readBoolean();
         this.var_514 = param1.readString();
         this.var_1175 = param1.readInteger();
         this.var_1177 = param1.readString();
         this.var_1176 = param1.readString();
         this.var_1174 = param1.readString();
      }
      
      public function get gender() : int
      {
         return _gender;
      }
      
      public function get realName() : String
      {
         return var_1174;
      }
      
      public function get name() : String
      {
         return _name;
      }
      
      public function get motto() : String
      {
         return var_1177;
      }
      
      public function get categoryId() : int
      {
         return var_1175;
      }
      
      public function get online() : Boolean
      {
         return var_609;
      }
      
      public function get followingAllowed() : Boolean
      {
         return var_1173;
      }
      
      public function get lastAccess() : String
      {
         return var_1176;
      }
      
      public function get id() : int
      {
         return _id;
      }
      
      public function get figure() : String
      {
         return var_514;
      }
   }
}
