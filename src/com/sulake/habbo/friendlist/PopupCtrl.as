package com.sulake.habbo.friendlist
{
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.core.window.components.IBitmapWrapperWindow;
   import com.sulake.habbo.window.enum.HabboWindowParam;
   import flash.events.TimerEvent;
   import flash.geom.Point;
   import flash.utils.Timer;
   
   public class PopupCtrl
   {
       
      
      private var var_1578:int;
      
      private var var_710:Timer;
      
      private var var_1579:int;
      
      private var var_588:Timer;
      
      private var var_54:IWindowContainer;
      
      private var _friendList:HabboFriendList;
      
      private var var_1084:String;
      
      public function PopupCtrl(param1:HabboFriendList, param2:int, param3:int, param4:String)
      {
         var_710 = new Timer(500,1);
         var_588 = new Timer(100,1);
         super();
         _friendList = param1;
         var_1084 = param4;
         var_1579 = param2;
         var_1578 = param3;
         var_710.addEventListener(TimerEvent.TIMER,onDisplayTimer);
         var_588.addEventListener(TimerEvent.TIMER,onHideTimer);
      }
      
      public function refreshContent(param1:IWindowContainer) : void
      {
      }
      
      private function onDisplayTimer(param1:TimerEvent) : void
      {
         this.var_54.visible = true;
         this.var_54.activate();
      }
      
      private function refreshPopupArrows(param1:IWindowContainer, param2:Boolean) : void
      {
         refreshPopupArrow(param1,true,param2);
         refreshPopupArrow(param1,false,!param2);
      }
      
      public function showPopup(param1:IWindowContainer, param2:IWindow) : void
      {
         if(var_54 == null)
         {
            var_54 = IWindowContainer(_friendList.getXmlWindow(var_1084));
            var_54.visible = false;
            param1.addChild(var_54);
         }
         refreshContent(var_54);
         var_54.width = Util.getRightmostPoint(var_54) + 10;
         var_54.height = Util.getLowestPoint(var_54) + 10;
         var _loc3_:Point = new Point();
         var _loc4_:Point = new Point();
         param1.getGlobalPosition(_loc3_);
         param2.getGlobalPosition(_loc4_);
         var_54.x = _loc4_.x - _loc3_.x + var_1579 + param2.width;
         var_54.y = _loc4_.y - _loc3_.y - 0 + param2.height * 0.5;
         var _loc5_:Point = new Point();
         var_54.getGlobalPosition(_loc5_);
         if(_loc5_.x + var_54.width > var_54.desktop.width)
         {
            var_54.x = 0 + _loc4_.x - _loc3_.x + var_1578;
            refreshPopupArrows(var_54,false);
         }
         else
         {
            refreshPopupArrows(var_54,true);
         }
         if(true)
         {
            var_710.reset();
            var_710.start();
         }
         var_588.reset();
      }
      
      private function onHideTimer(param1:TimerEvent) : void
      {
         if(var_54 != null)
         {
            var_54.visible = false;
         }
      }
      
      public function closePopup() : void
      {
         var_588.reset();
         var_710.reset();
         var_588.start();
      }
      
      private function refreshPopupArrow(param1:IWindowContainer, param2:Boolean, param3:Boolean) : void
      {
         var _loc4_:String = "popup_arrow_" + (!!param2 ? "left" : "right");
         var _loc5_:IBitmapWrapperWindow = IBitmapWrapperWindow(param1.findChildByName(_loc4_));
         if(!param3)
         {
            if(_loc5_ != null)
            {
               _loc5_.visible = false;
            }
         }
         else
         {
            if(_loc5_ == null)
            {
               _loc5_ = _friendList.getButton(_loc4_,_loc4_,null);
               _loc5_.setParamFlag(HabboWindowParam.const_68,false);
               param1.addChild(_loc5_);
            }
            _loc5_.visible = true;
            _loc5_.y = param1.height * 0.5 - _loc5_.height * 0.5;
            _loc5_.x = !!param2 ? int(1 - _loc5_.width) : int(param1.width - 1);
         }
      }
      
      public function get friendList() : HabboFriendList
      {
         return _friendList;
      }
   }
}
