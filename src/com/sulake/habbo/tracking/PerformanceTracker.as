package com.sulake.habbo.tracking
{
   import com.sulake.core.communication.connection.IConnection;
   import com.sulake.core.utils.debug.GarbageMonitor;
   import com.sulake.habbo.communication.messages.outgoing.tracking.PerformanceLogMessageComposer;
   import com.sulake.habbo.configuration.IHabboConfigurationManager;
   import flash.external.ExternalInterface;
   import flash.system.Capabilities;
   import flash.system.System;
   import flash.utils.getTimer;
   
   public class PerformanceTracker
   {
       
      
      private var var_1344:GarbageMonitor = null;
      
      private var var_1089:int = 0;
      
      private var var_1083:Boolean = false;
      
      private var var_1666:String = "";
      
      private var var_1343:String = "";
      
      private var var_314:Number = 0;
      
      private var var_1090:int = 10;
      
      private var var_2169:Array;
      
      private var var_580:int = 0;
      
      private var var_1087:int = 60;
      
      private var var_901:int = 0;
      
      private var var_900:int = 0;
      
      private var var_1662:String = "";
      
      private var var_1680:Number = 0;
      
      private var var_1086:int = 1000;
      
      private var var_1682:Boolean = true;
      
      private var var_1681:Number = 0.15;
      
      private var var_177:IHabboConfigurationManager = null;
      
      private var var_1665:String = "";
      
      private var var_1088:int = 0;
      
      private var _connection:IConnection = null;
      
      public function PerformanceTracker()
      {
         var_2169 = [];
         super();
         var_1343 = Capabilities.version;
         var_1666 = Capabilities.os;
         var_1083 = Capabilities.isDebugger;
         var_1665 = !true ? ExternalInterface.call("window.navigator.userAgent.toString") : "unknown";
         var_1344 = new GarbageMonitor();
         updateGarbageMonitor();
         var_1089 = getTimer();
      }
      
      private function updateGarbageMonitor() : Object
      {
         var _loc2_:* = null;
         var _loc1_:Array = var_1344.list;
         if(_loc1_ == null || _loc1_.length == 0)
         {
            _loc2_ = new GarbageTester("tester");
            var_1344.insert(_loc2_,"tester");
            return _loc2_;
         }
         return null;
      }
      
      public function dispose() : void
      {
      }
      
      public function get averageUpdateInterval() : int
      {
         return var_314;
      }
      
      private function differenceInPercents(param1:Number, param2:Number) : Number
      {
         if(param1 == param2)
         {
            return 0;
         }
         var _loc3_:Number = param1;
         var _loc4_:Number = param2;
         if(param2 > param1)
         {
            _loc3_ = param2;
            _loc4_ = param1;
         }
         return 100 * (1 - _loc4_ / _loc3_);
      }
      
      public function set reportInterval(param1:int) : void
      {
         var_1087 = param1;
      }
      
      public function set connection(param1:IConnection) : void
      {
         _connection = param1;
      }
      
      public function get flashVersion() : String
      {
         return var_1343;
      }
      
      public function update(param1:uint) : void
      {
         var _loc4_:Number = NaN;
         var _loc5_:Boolean = false;
         var _loc6_:Number = NaN;
         var _loc2_:Object = updateGarbageMonitor();
         if(_loc2_ != null)
         {
            ++var_900;
            Logger.log("Garbage collection");
         }
         var _loc3_:Boolean = false;
         if(param1 > var_1086)
         {
            ++var_901;
            _loc3_ = true;
         }
         else
         {
            ++var_580;
            if(var_580 <= 1)
            {
               var_314 = param1;
            }
            else
            {
               _loc4_ = Number(var_580);
               var_314 = var_314 * (_loc4_ - 1) / _loc4_ + Number(param1) / _loc4_;
            }
         }
         if(getTimer() - var_1089 > var_1087 * 1000 && var_1088 < var_1090)
         {
            Logger.log("*** Performance tracker: average frame rate " + 1000 / var_314);
            _loc5_ = true;
            if(var_1682 && var_1088 > 0)
            {
               _loc6_ = differenceInPercents(var_1680,var_314);
               if(_loc6_ < var_1681)
               {
                  _loc5_ = false;
               }
            }
            var_1089 = getTimer();
            if(_loc5_ || _loc3_)
            {
               var_1680 = var_314;
               if(sendReport())
               {
                  ++var_1088;
               }
            }
         }
      }
      
      public function set reportLimit(param1:int) : void
      {
         var_1090 = param1;
      }
      
      public function set slowUpdateLimit(param1:int) : void
      {
         var_1086 = param1;
      }
      
      private function sendReport() : Boolean
      {
         var _loc1_:* = null;
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         if(_connection != null)
         {
            _loc1_ = null;
            _loc2_ = getTimer() / 1000;
            _loc3_ = -1;
            _loc4_ = 0;
            _loc1_ = new PerformanceLogMessageComposer(_loc2_,var_1665,var_1343,var_1666,var_1662,var_1083,_loc4_,_loc3_,var_900,var_314,var_901);
            _connection.send(_loc1_);
            var_900 = 0;
            var_314 = 0;
            var_580 = 0;
            var_901 = 0;
            return true;
         }
         return false;
      }
      
      public function set configuration(param1:IHabboConfigurationManager) : void
      {
         var_177 = param1;
         var_1087 = int(var_177.getKey("performancetest.interval","60"));
         var_1086 = int(var_177.getKey("performancetest.slowupdatelimit","1000"));
         var_1090 = int(var_177.getKey("performancetest.reportlimit","10"));
         var_1681 = Number(var_177.getKey("performancetest.distribution.deviancelimit.percent","10"));
         var_1682 = Boolean(int(var_177.getKey("performancetest.distribution.enabled","1")));
      }
   }
}
