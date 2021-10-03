package com.sulake.core.window.events
{
   import com.sulake.core.window.IWindow;
   import flash.events.Event;
   
   public class WindowNotifyEvent extends WindowEvent
   {
      
      public static const const_1146:String = "WN_CREATED";
      
      public static const const_862:String = "WN_DISABLE";
      
      public static const const_952:String = "WN_DEACTIVATED";
      
      public static const const_940:String = "WN_OPENED";
      
      public static const const_827:String = "WN_CLOSED";
      
      public static const const_852:String = "WN_DESTROY";
      
      public static const const_1535:String = "WN_ARRANGED";
      
      public static const const_460:String = "WN_PARENT_RESIZED";
      
      public static const const_942:String = "WN_ENABLE";
      
      public static const const_976:String = "WN_RELOCATE";
      
      public static const const_776:String = "WN_FOCUS";
      
      public static const const_958:String = "WN_PARENT_RELOCATED";
      
      public static const const_434:String = "WN_PARAM_UPDATED";
      
      public static const const_707:String = "WN_PARENT_ACTIVATED";
      
      public static const const_239:String = "WN_RESIZED";
      
      public static const const_886:String = "WN_CLOSE";
      
      public static const const_842:String = "WN_PARENT_REMOVED";
      
      public static const const_233:String = "WN_CHILD_RELOCATED";
      
      public static const const_531:String = "WN_ENABLED";
      
      public static const const_228:String = "WN_CHILD_RESIZED";
      
      public static const const_845:String = "WN_MINIMIZED";
      
      public static const const_514:String = "WN_DISABLED";
      
      public static const const_195:String = "WN_CHILD_ACTIVATED";
      
      public static const const_378:String = "WN_STATE_UPDATED";
      
      public static const const_632:String = "WN_UNSELECTED";
      
      public static const const_344:String = "WN_STYLE_UPDATED";
      
      public static const const_1464:String = "WN_UPDATE";
      
      public static const const_397:String = "WN_PARENT_ADDED";
      
      public static const const_711:String = "WN_RESIZE";
      
      public static const const_555:String = "WN_CHILD_REMOVED";
      
      public static const const_1502:String = "";
      
      public static const const_954:String = "WN_RESTORED";
      
      public static const const_288:String = "WN_SELECTED";
      
      public static const const_823:String = "WN_MINIMIZE";
      
      public static const const_775:String = "WN_FOCUSED";
      
      public static const const_1260:String = "WN_LOCK";
      
      public static const const_300:String = "WN_CHILD_ADDED";
      
      public static const const_919:String = "WN_UNFOCUSED";
      
      public static const const_351:String = "WN_RELOCATED";
      
      public static const const_979:String = "WN_DEACTIVATE";
      
      public static const const_1127:String = "WN_CRETAE";
      
      public static const const_829:String = "WN_RESTORE";
      
      public static const const_291:String = "WN_ACTVATED";
      
      public static const const_1150:String = "WN_LOCKED";
      
      public static const const_366:String = "WN_SELECT";
      
      public static const const_924:String = "WN_MAXIMIZE";
      
      public static const const_802:String = "WN_OPEN";
      
      public static const const_719:String = "WN_UNSELECT";
      
      public static const const_1453:String = "WN_ARRANGE";
      
      public static const const_1313:String = "WN_UNLOCKED";
      
      public static const const_1494:String = "WN_UPDATED";
      
      public static const const_834:String = "WN_ACTIVATE";
      
      public static const const_1332:String = "WN_UNLOCK";
      
      public static const const_832:String = "WN_MAXIMIZED";
      
      public static const const_909:String = "WN_DESTROYED";
      
      public static const const_789:String = "WN_UNFOCUS";
       
      
      public function WindowNotifyEvent(param1:String, param2:IWindow, param3:IWindow, param4:Boolean = false)
      {
         super(param1,param2,param3,false,param4);
      }
      
      override public function toString() : String
      {
         return formatToString("WindowNotifyEvent","type","cancelable");
      }
      
      override public function clone() : Event
      {
         return new WindowNotifyEvent(type,_window,var_1518,cancelable);
      }
   }
}
