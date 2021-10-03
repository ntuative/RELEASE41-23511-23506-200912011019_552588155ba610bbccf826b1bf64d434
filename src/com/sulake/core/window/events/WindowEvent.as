package com.sulake.core.window.events
{
   import com.sulake.core.window.IWindow;
   import flash.events.Event;
   
   public class WindowEvent extends Event
   {
      
      public static const const_330:String = "WE_CHILD_RESIZED";
      
      public static const const_1189:String = "WE_CLOSE";
      
      public static const const_1245:String = "WE_DESTROY";
      
      public static const const_235:String = "WE_CHANGE";
      
      public static const const_1274:String = "WE_RESIZE";
      
      public static const WINDOW_EVENT_MESSAGE:String = "WE_MESSAGE";
      
      public static const const_1437:String = "WE_PARENT_RESIZE";
      
      public static const const_84:String = "WE_UPDATE";
      
      public static const const_1221:String = "WE_MAXIMIZE";
      
      public static const const_406:String = "WE_DESTROYED";
      
      public static const const_921:String = "WE_UNSELECT";
      
      public static const const_1195:String = "WE_MAXIMIZED";
      
      public static const const_1506:String = "WE_UNLOCKED";
      
      public static const const_474:String = "WE_CHILD_REMOVED";
      
      public static const const_194:String = "WE_OK";
      
      public static const const_43:String = "WE_RESIZED";
      
      public static const const_1248:String = "WE_ACTIVATE";
      
      public static const const_255:String = "WE_ENABLED";
      
      public static const const_472:String = "WE_CHILD_RELOCATED";
      
      public static const const_1167:String = "WE_CREATE";
      
      public static const const_513:String = "WE_SELECT";
      
      public static const const_165:String = "";
      
      public static const const_1529:String = "WE_LOCKED";
      
      public static const const_1424:String = "WE_PARENT_RELOCATE";
      
      public static const const_1391:String = "WE_CHILD_REMOVE";
      
      public static const const_1536:String = "WE_CHILD_RELOCATE";
      
      public static const const_1442:String = "WE_LOCK";
      
      public static const const_289:String = "WE_FOCUSED";
      
      public static const const_618:String = "WE_UNSELECTED";
      
      public static const const_893:String = "WE_DEACTIVATED";
      
      public static const const_1318:String = "WE_MINIMIZED";
      
      public static const const_1443:String = "WE_ARRANGED";
      
      public static const const_1530:String = "WE_UNLOCK";
      
      public static const const_1516:String = "WE_ATTACH";
      
      public static const const_1233:String = "WE_OPEN";
      
      public static const const_1262:String = "WE_RESTORE";
      
      public static const const_1465:String = "WE_PARENT_RELOCATED";
      
      public static const const_1219:String = "WE_RELOCATE";
      
      public static const const_1505:String = "WE_CHILD_RESIZE";
      
      public static const const_1513:String = "WE_ARRANGE";
      
      public static const const_1241:String = "WE_OPENED";
      
      public static const const_1341:String = "WE_CLOSED";
      
      public static const const_1472:String = "WE_DETACHED";
      
      public static const const_1382:String = "WE_UPDATED";
      
      public static const const_1172:String = "WE_UNFOCUSED";
      
      public static const const_400:String = "WE_RELOCATED";
      
      public static const const_1159:String = "WE_DEACTIVATE";
      
      public static const const_185:String = "WE_DISABLED";
      
      public static const const_586:String = "WE_CANCEL";
      
      public static const const_654:String = "WE_ENABLE";
      
      public static const const_1338:String = "WE_ACTIVATED";
      
      public static const const_1322:String = "WE_FOCUS";
      
      public static const const_1499:String = "WE_DETACH";
      
      public static const const_1281:String = "WE_RESTORED";
      
      public static const const_1269:String = "WE_UNFOCUS";
      
      public static const const_54:String = "WE_SELECTED";
      
      public static const const_1333:String = "WE_PARENT_RESIZED";
      
      public static const const_1222:String = "WE_CREATED";
      
      public static const const_1466:String = "WE_ATTACHED";
      
      public static const const_1306:String = "WE_MINIMIZE";
      
      public static const WINDOW_EVENT_DISABLE:String = "WE_DISABLE";
       
      
      protected var _type:String = "";
      
      protected var var_1518:IWindow;
      
      protected var _window:IWindow;
      
      protected var var_1295:Boolean;
      
      public function WindowEvent(param1:String, param2:IWindow, param3:IWindow, param4:Boolean = false, param5:Boolean = false)
      {
         _type = param1;
         _window = param2;
         var_1518 = param3;
         var_1295 = false;
         super(param1,param4,param5);
      }
      
      public function isWindowOperationPrevented() : Boolean
      {
         return var_1295;
      }
      
      public function get related() : IWindow
      {
         return var_1518;
      }
      
      public function get window() : IWindow
      {
         return _window;
      }
      
      public function set type(param1:String) : void
      {
         _type = param1;
      }
      
      override public function get type() : String
      {
         return _type;
      }
      
      override public function toString() : String
      {
         return formatToString("WindowEvent","type","bubbles","cancelable","window");
      }
      
      override public function clone() : Event
      {
         return new WindowEvent(_type,window,related,bubbles,cancelable);
      }
      
      public function preventWindowOperation() : void
      {
         if(cancelable)
         {
            var_1295 = true;
            stopImmediatePropagation();
            return;
         }
         throw new Error("Attempted to prevent window operation that is not canceable!");
      }
   }
}
