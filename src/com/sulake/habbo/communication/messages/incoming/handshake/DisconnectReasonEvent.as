package com.sulake.habbo.communication.messages.incoming.handshake
{
   import com.sulake.core.communication.messages.IMessageEvent;
   import com.sulake.core.communication.messages.MessageEvent;
   import com.sulake.habbo.communication.messages.parser.handshake.DisconnectReasonParser;
   
   public class DisconnectReasonEvent extends MessageEvent implements IMessageEvent
   {
      
      public static const const_1250:String = "DisconnectReasonPeerConnectionLost";
      
      public static const const_939:String = "DisconnectReasonTimeout";
      
      public static const const_549:String = "DisconnectReasonDisconnected";
      
      public static const const_306:String = "DisconnectReasonBanned";
      
      public static const const_779:String = "DisconnectReasonLoggedOut";
      
      public static const const_951:String = "DisconnectReasonConcurrentLogin";
       
      
      public function DisconnectReasonEvent(param1:Function)
      {
         super(param1,DisconnectReasonParser);
      }
      
      public function get reason() : String
      {
         var _loc1_:int = (this.var_21 as DisconnectReasonParser).reason;
         switch(_loc1_)
         {
            case -1:
               return const_549;
            case 0:
               return const_549;
            case 1:
               return const_779;
            case 1009:
            case 2:
               return const_951;
            case 3:
               return const_939;
            case 4:
               return const_1250;
            default:
               return const_549;
         }
      }
   }
}
