package com.sulake.habbo.moderation
{
   import com.sulake.core.runtime.IDisposable;
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.components.IDropMenuWindow;
   import com.sulake.core.window.components.IFrameWindow;
   import com.sulake.core.window.components.ITextFieldWindow;
   import com.sulake.core.window.events.WindowEvent;
   import com.sulake.core.window.events.WindowMouseEvent;
   import com.sulake.habbo.communication.messages.outgoing.moderator.ModMessageMessageComposer;
   import com.sulake.habbo.window.utils.IAlertDialog;
   import flash.events.Event;
   
   public class SendMsgsCtrl implements IDisposable, TrackedWindow
   {
       
      
      private var _disposed:Boolean;
      
      private var var_1304:String;
      
      private var var_1047:int;
      
      private var var_723:IDropMenuWindow;
      
      private var var_55:ModerationManager;
      
      private var var_359:ITextFieldWindow;
      
      private var var_58:IFrameWindow;
      
      private var var_302:Boolean = true;
      
      public function SendMsgsCtrl(param1:ModerationManager, param2:int, param3:String)
      {
         super();
         var_55 = param1;
         var_1047 = param2;
         var_1304 = param3;
      }
      
      private function onInputClick(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowEvent.const_289)
         {
            return;
         }
         if(!var_302)
         {
            return;
         }
         var_359.text = "";
         var_302 = false;
      }
      
      public function getFrame() : IFrameWindow
      {
         return var_58;
      }
      
      private function onSendMessageButton(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         Logger.log("Sending message...");
         if(var_302 || false)
         {
            var_55.windowManager.alert("Alert","You must input a message to the user",0,onAlertClose);
            return;
         }
         var_55.connection.send(new ModMessageMessageComposer(var_1047,var_359.text));
         this.dispose();
      }
      
      public function getId() : String
      {
         return var_1304;
      }
      
      private function prepareMsgSelect(param1:IDropMenuWindow) : void
      {
         Logger.log("MSG TEMPLATES: " + var_55.initMsg.messageTemplates.length);
         param1.populate(var_55.initMsg.messageTemplates);
      }
      
      private function onClose(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         dispose();
      }
      
      private function onSelectTemplate(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowEvent.const_54)
         {
            return;
         }
         var _loc3_:String = var_55.initMsg.messageTemplates["null"];
         if(_loc3_ != null)
         {
            var_302 = false;
            var_359.text = _loc3_;
         }
      }
      
      public function get disposed() : Boolean
      {
         return _disposed;
      }
      
      public function dispose() : void
      {
         if(_disposed)
         {
            return;
         }
         _disposed = true;
         if(var_58 != null)
         {
            var_58.destroy();
            var_58 = null;
         }
         var_723 = null;
         var_359 = null;
         var_55 = null;
      }
      
      private function onAlertClose(param1:IAlertDialog, param2:Event) : void
      {
         param1.dispose();
      }
      
      public function show() : void
      {
         var_58 = IFrameWindow(var_55.getXmlWindow("send_msgs"));
         var_58.caption = "Msg To: " + var_1304;
         var_58.findChildByName("send_message_but").procedure = onSendMessageButton;
         var_359 = ITextFieldWindow(var_58.findChildByName("message_input"));
         var_359.procedure = onInputClick;
         var_723 = IDropMenuWindow(var_58.findChildByName("msgTemplatesSelect"));
         prepareMsgSelect(var_723);
         var_723.procedure = onSelectTemplate;
         var _loc1_:IWindow = var_58.findChildByTag("close");
         _loc1_.procedure = onClose;
         var_58.visible = true;
      }
      
      public function getType() : int
      {
         return WindowTracker.const_1115;
      }
   }
}
