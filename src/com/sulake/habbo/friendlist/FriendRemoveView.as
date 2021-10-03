package com.sulake.habbo.friendlist
{
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.core.window.events.WindowEvent;
   import com.sulake.core.window.events.WindowMouseEvent;
   import com.sulake.habbo.communication.messages.outgoing.friendlist.RemoveBuddyMessageComposer;
   import com.sulake.habbo.friendlist.domain.Friend;
   import flash.utils.Dictionary;
   
   public class FriendRemoveView extends AlertView
   {
       
      
      private var _selected:Array;
      
      public function FriendRemoveView(param1:HabboFriendList)
      {
         super(param1,"friend_remove_confirm");
         _selected = param1.categories.getSelectedFriends();
      }
      
      private function method_5(param1:WindowEvent, param2:IWindow) : void
      {
         var _loc4_:* = null;
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         Logger.log("Remove Ok clicked");
         var _loc3_:RemoveBuddyMessageComposer = new RemoveBuddyMessageComposer();
         for each(_loc4_ in _selected)
         {
            _loc3_.addRemovedFriend(_loc4_.id);
         }
         friendList.send(_loc3_);
         dispose();
      }
      
      override public function dispose() : void
      {
         _selected = null;
         super.dispose();
      }
      
      override function setupContent(param1:IWindowContainer) : void
      {
         var _loc3_:* = null;
         var _loc4_:* = null;
         var _loc5_:* = null;
         param1.findChildByName("cancel").procedure = onClose;
         param1.findChildByName("ok").procedure = method_5;
         var _loc2_:Array = new Array();
         for each(_loc3_ in _selected)
         {
            _loc2_.push(_loc3_.name);
         }
         _loc4_ = Util.arrayToString(_loc2_);
         _loc5_ = new Dictionary();
         friendList.registerParameter("friendlist.removefriendconfirm.userlist","user_names",_loc4_);
      }
   }
}
