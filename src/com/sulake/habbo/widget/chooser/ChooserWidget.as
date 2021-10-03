package com.sulake.habbo.widget.chooser
{
   import com.sulake.core.assets.IAssetLibrary;
   import com.sulake.habbo.localization.IHabboLocalizationManager;
   import com.sulake.habbo.widget.RoomWidgetBase;
   import com.sulake.habbo.widget.events.RoomWidgetChooserContentEvent;
   import com.sulake.habbo.widget.events.RoomWidgetRoomObjectUpdateEvent;
   import com.sulake.habbo.widget.messages.RoomWidgetRequestWidgetMessage;
   import com.sulake.habbo.widget.messages.RoomWidgetRoomObjectMessage;
   import com.sulake.habbo.window.IHabboWindowManager;
   import flash.events.IEventDispatcher;
   
   public class ChooserWidget extends RoomWidgetBase
   {
       
      
      private const const_1366:int = 1;
      
      private const const_1553:int = 0;
      
      private var _userChooser:ChooserView;
      
      private var var_371:ChooserView;
      
      public function ChooserWidget(param1:IHabboWindowManager, param2:IAssetLibrary = null, param3:IHabboLocalizationManager = null)
      {
         super(param1,param2,param3);
      }
      
      private function onChooserContent(param1:RoomWidgetChooserContentEvent) : void
      {
         if(param1 == null || param1.items == null)
         {
            return;
         }
         switch(param1.type)
         {
            case RoomWidgetChooserContentEvent.const_449:
               if(var_371 == null)
               {
                  var_371 = new ChooserView(this,"${widget.chooser.furni.title}");
               }
               if(var_371 == null)
               {
                  return;
               }
               var_371.populate(param1.items,param1.isAnyRoomController);
               break;
            case RoomWidgetChooserContentEvent.const_467:
               if(_userChooser == null)
               {
                  _userChooser = new ChooserView(this,"${widget.chooser.user.title}");
               }
               if(_userChooser == null)
               {
                  return;
               }
               _userChooser.populate(param1.items,false);
               break;
         }
      }
      
      override public function registerUpdateEvents(param1:IEventDispatcher) : void
      {
         if(param1 == null)
         {
            return;
         }
         param1.addEventListener(RoomWidgetChooserContentEvent.const_449,onChooserContent);
         param1.addEventListener(RoomWidgetChooserContentEvent.const_467,onChooserContent);
         param1.addEventListener(RoomWidgetRoomObjectUpdateEvent.const_125,onUpdateFurniChooser);
         param1.addEventListener(RoomWidgetRoomObjectUpdateEvent.const_705,onUpdateFurniChooser);
         param1.addEventListener(RoomWidgetRoomObjectUpdateEvent.const_248,onUpdateUserChooser);
         param1.addEventListener(RoomWidgetRoomObjectUpdateEvent.const_558,onUpdateUserChooser);
         super.registerUpdateEvents(param1);
      }
      
      override public function dispose() : void
      {
         if(var_371 != null)
         {
            var_371.dispose();
            var_371 = null;
         }
         if(_userChooser != null)
         {
            _userChooser.dispose();
            _userChooser = null;
         }
         super.dispose();
      }
      
      private function onUpdateFurniChooser(param1:RoomWidgetRoomObjectUpdateEvent) : void
      {
         if(var_371 == null || !var_371.isOpen())
         {
            return;
         }
         var _loc2_:RoomWidgetRequestWidgetMessage = new RoomWidgetRequestWidgetMessage(RoomWidgetRequestWidgetMessage.const_376);
         messageListener.processWidgetMessage(_loc2_);
      }
      
      private function onUpdateUserChooser(param1:RoomWidgetRoomObjectUpdateEvent) : void
      {
         if(_userChooser == null || !_userChooser.isOpen())
         {
            return;
         }
         var _loc2_:RoomWidgetRequestWidgetMessage = new RoomWidgetRequestWidgetMessage(RoomWidgetRequestWidgetMessage.const_297);
         messageListener.processWidgetMessage(_loc2_);
      }
      
      override public function initialize(param1:int) : void
      {
         var _loc2_:* = null;
         super.initialize(param1);
         if(param1 == const_1366)
         {
            _loc2_ = new RoomWidgetRequestWidgetMessage(RoomWidgetRequestWidgetMessage.const_297);
            messageListener.processWidgetMessage(_loc2_);
         }
      }
      
      override public function get state() : int
      {
         if(_userChooser != null && _userChooser.isOpen())
         {
            return const_1366;
         }
         return const_1553;
      }
      
      public function choose(param1:int, param2:int) : void
      {
         var _loc3_:RoomWidgetRoomObjectMessage = new RoomWidgetRoomObjectMessage(RoomWidgetRoomObjectMessage.const_674,param1,param2);
         messageListener.processWidgetMessage(_loc3_);
      }
      
      override public function unregisterUpdateEvents(param1:IEventDispatcher) : void
      {
         if(param1 == null)
         {
            return;
         }
         param1.removeEventListener(RoomWidgetChooserContentEvent.const_449,onChooserContent);
         param1.removeEventListener(RoomWidgetChooserContentEvent.const_467,onChooserContent);
         param1.removeEventListener(RoomWidgetRoomObjectUpdateEvent.const_125,onUpdateFurniChooser);
         param1.removeEventListener(RoomWidgetRoomObjectUpdateEvent.const_705,onUpdateFurniChooser);
         param1.removeEventListener(RoomWidgetRoomObjectUpdateEvent.const_248,onUpdateUserChooser);
         param1.removeEventListener(RoomWidgetRoomObjectUpdateEvent.const_558,onUpdateUserChooser);
      }
   }
}
