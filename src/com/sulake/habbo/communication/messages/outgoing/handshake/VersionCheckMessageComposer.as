package com.sulake.habbo.communication.messages.outgoing.handshake
{
   import com.sulake.core.communication.messages.IMessageComposer;
   
   public class VersionCheckMessageComposer implements IMessageComposer
   {
       
      
      private var var_2068:String;
      
      private var var_1052:String;
      
      private var var_2067:int;
      
      public function VersionCheckMessageComposer(param1:int, param2:String, param3:String)
      {
         super();
         var_2067 = param1;
         var_1052 = param2;
         var_2068 = param3;
      }
      
      public function getMessageArray() : Array
      {
         return [var_2067,var_1052,var_2068];
      }
      
      public function dispose() : void
      {
      }
   }
}
