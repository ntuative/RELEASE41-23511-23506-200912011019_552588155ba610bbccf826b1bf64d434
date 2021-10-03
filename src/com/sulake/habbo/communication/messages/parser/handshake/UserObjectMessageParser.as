package com.sulake.habbo.communication.messages.parser.handshake
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class UserObjectMessageParser implements IMessageParser
   {
       
      
      private var _id:int;
      
      private var var_514:String;
      
      private var var_2188:String;
      
      private var var_2190:int;
      
      private var var_2186:int;
      
      private var var_1219:String;
      
      private var var_1174:String;
      
      private var _name:String;
      
      private var var_850:int;
      
      private var _respectLeft:int;
      
      private var var_2189:int;
      
      private var var_1584:int;
      
      private var var_2187:String;
      
      public function UserObjectMessageParser()
      {
         super();
      }
      
      public function get method_12() : int
      {
         return this.var_2186;
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function get realName() : String
      {
         return this.var_1174;
      }
      
      public function get customData() : String
      {
         return this.var_2188;
      }
      
      public function get name() : String
      {
         return this._name;
      }
      
      public function get petRespectLeft() : int
      {
         return this.var_850;
      }
      
      public function get photoFilm() : int
      {
         return this.var_2190;
      }
      
      public function get id() : int
      {
         return this._id;
      }
      
      public function get poolFigure() : String
      {
         return this.var_2187;
      }
      
      public function get figure() : String
      {
         return this.var_514;
      }
      
      public function get respectTotal() : int
      {
         return this.var_1584;
      }
      
      public function get sex() : String
      {
         return this.var_1219;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         this._id = int(param1.readString());
         this._name = param1.readString();
         this.var_514 = param1.readString();
         this.var_1219 = param1.readString();
         this.var_2188 = param1.readString();
         this.var_1174 = param1.readString();
         this.var_2189 = param1.readInteger();
         this.var_2187 = param1.readString();
         this.var_2190 = param1.readInteger();
         this.var_2186 = param1.readInteger();
         this.var_1584 = param1.readInteger();
         this._respectLeft = param1.readInteger();
         this.var_850 = param1.readInteger();
         return true;
      }
      
      public function get tickets() : int
      {
         return this.var_2189;
      }
      
      public function get respectLeft() : int
      {
         return this._respectLeft;
      }
   }
}
