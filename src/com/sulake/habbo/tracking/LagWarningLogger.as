package com.sulake.habbo.tracking
{
   import com.sulake.core.communication.connection.IConnection;
   import com.sulake.habbo.communication.IHabboCommunicationManager;
   import com.sulake.habbo.communication.messages.outgoing.tracking.LagWarningReportMessageComposer;
   import com.sulake.habbo.configuration.IHabboConfigurationManager;
   import flash.utils.getTimer;
   
   public class LagWarningLogger
   {
      
      public static const const_887:int = 0;
      
      public static const WARNING_TYPE_CHAT_DELAY:int = 1;
       
      
      private var var_1279:Boolean = true;
      
      private var var_1088:int = 0;
      
      private var var_835:int = 0;
      
      private var var_1089:int = 0;
      
      private var var_836:int = 0;
      
      private var _communication:IHabboCommunicationManager;
      
      private var var_1090:int = 15;
      
      private var var_177:IHabboConfigurationManager;
      
      private var _connection:IConnection;
      
      private var var_1087:int = 60;
      
      public function LagWarningLogger()
      {
         super();
         var_1089 = getTimer();
      }
      
      public function logWarnings() : void
      {
         if(!var_1279)
         {
            return;
         }
         if(nothingToReport)
         {
            return;
         }
         var _loc1_:LagWarningReportMessageComposer = new LagWarningReportMessageComposer(var_835,var_836);
         if(_connection != null)
         {
            _connection.send(_loc1_);
         }
         resetLog();
         ++var_1088;
      }
      
      private function get nothingToReport() : Boolean
      {
         return var_835 == 0 && var_836 == 0;
      }
      
      private function resetLog() : void
      {
         var_835 = 0;
         var_836 = 0;
      }
      
      public function update(param1:uint) : void
      {
         if(!var_1279)
         {
            return;
         }
         if(getTimer() - var_1089 > var_1087 * 1000 && var_1088 < var_1090)
         {
            var_1089 = getTimer();
            logWarnings();
         }
      }
      
      public function set configuration(param1:IHabboConfigurationManager) : void
      {
         var_177 = param1;
         var_1087 = int(var_177.getKey("lagwarninglog.interval","60"));
         var_1090 = int(var_177.getKey("lagwarninglog.reportlimit","15"));
         var_1279 = Boolean(int(var_177.getKey("lagwarninglog.enabled","1")));
      }
      
      public function registerWarning(param1:int) : void
      {
         switch(param1)
         {
            case WARNING_TYPE_CHAT_DELAY:
               var_836 += 1;
            case const_887:
               var_835 += 1;
         }
      }
      
      public function set communication(param1:IHabboCommunicationManager) : void
      {
         _communication = param1;
      }
      
      public function set connection(param1:IConnection) : void
      {
         _connection = param1;
      }
   }
}
