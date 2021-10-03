package com.sulake.habbo.communication.messages.parser.moderation
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   import com.sulake.habbo.communication.messages.incoming.moderation.OffenceCategoryData;
   
   public class ModeratorInitMessageParser implements IMessageParser
   {
       
      
      private var _roomMessageTemplates:Array;
      
      private var var_1759:Boolean;
      
      private var var_1379:Array;
      
      private var var_1755:Boolean;
      
      private var var_1757:Boolean;
      
      private var var_1752:Boolean;
      
      private var var_158:Array;
      
      private var var_1758:Boolean;
      
      private var var_1756:Boolean;
      
      private var var_1378:Array;
      
      private var var_1754:Boolean;
      
      private var var_1753:Boolean;
      
      public function ModeratorInitMessageParser()
      {
         super();
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function get banPermission() : Boolean
      {
         return var_1753;
      }
      
      public function get roomKickPermission() : Boolean
      {
         return var_1759;
      }
      
      public function get alertPermission() : Boolean
      {
         return var_1755;
      }
      
      public function get cfhPermission() : Boolean
      {
         return var_1758;
      }
      
      public function get roomMessageTemplates() : Array
      {
         return _roomMessageTemplates;
      }
      
      public function get roomAlertPermission() : Boolean
      {
         return var_1756;
      }
      
      public function get messageTemplates() : Array
      {
         return var_1379;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var _loc2_:IssueInfoMessageParser = new IssueInfoMessageParser();
         var_158 = [];
         var_1379 = [];
         _roomMessageTemplates = [];
         var_1378 = [];
         var _loc3_:int = param1.readInteger();
         var _loc4_:int = 0;
         while(_loc4_ < _loc3_)
         {
            if(!_loc2_.parse(param1))
            {
               return false;
            }
            var_158.push(_loc2_.issueData);
            _loc4_++;
         }
         _loc3_ = param1.readInteger();
         _loc4_ = 0;
         while(_loc4_ < _loc3_)
         {
            var_1379.push(param1.readString());
            _loc4_++;
         }
         _loc3_ = param1.readInteger();
         _loc4_ = 0;
         while(_loc4_ < _loc3_)
         {
            var_1378.push(new OffenceCategoryData(param1));
            _loc4_++;
         }
         var_1758 = param1.readBoolean();
         var_1752 = param1.readBoolean();
         var_1755 = param1.readBoolean();
         var_1757 = param1.readBoolean();
         var_1753 = param1.readBoolean();
         var_1756 = param1.readBoolean();
         var_1759 = param1.readBoolean();
         _loc3_ = param1.readInteger();
         _loc4_ = 0;
         while(_loc4_ < _loc3_)
         {
            _roomMessageTemplates.push(param1.readString());
            _loc4_++;
         }
         var_1754 = param1.readBoolean();
         return true;
      }
      
      public function get kickPermission() : Boolean
      {
         return var_1757;
      }
      
      public function get offenceCategories() : Array
      {
         return var_1378;
      }
      
      public function get issues() : Array
      {
         return var_158;
      }
      
      public function get bobbaFilterPermission() : Boolean
      {
         return var_1754;
      }
      
      public function get chatlogsPermission() : Boolean
      {
         return var_1752;
      }
   }
}
