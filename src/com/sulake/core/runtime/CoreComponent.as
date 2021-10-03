package com.sulake.core.runtime
{
   import com.sulake.core.Core;
   import com.sulake.core.assets.AssetLibraryCollection;
   import com.sulake.core.assets.AssetLoaderStruct;
   import com.sulake.core.assets.XmlAsset;
   import com.sulake.core.assets.loaders.AssetLoaderEvent;
   import com.sulake.core.utils.ErrorReportStorage;
   import com.sulake.core.utils.LibraryLoader;
   import com.sulake.core.utils.LibraryLoaderEvent;
   import com.sulake.core.utils.profiler.ProfilerViewer;
   import flash.display.DisplayObject;
   import flash.display.DisplayObjectContainer;
   import flash.events.Event;
   import flash.events.ProgressEvent;
   import flash.net.URLRequest;
   import flash.system.ApplicationDomain;
   import flash.system.LoaderContext;
   import flash.utils.getQualifiedClassName;
   import flash.utils.getTimer;
   
   public final class CoreComponent extends ComponentContext implements ICore
   {
      
      private static const const_150:uint = 3;
      
      private static const const_1006:String = "library";
      
      public static const const_1155:int = 6;
      
      private static const const_1007:String = "library";
      
      public static const const_1325:int = 99;
      
      private static const const_1005:String = "library";
      
      private static const const_1004:String = "zip-libraries";
      
      public static const const_1197:int = 10;
      
      public static const const_894:int = 1;
      
      public static const const_1188:int = 2;
      
      public static const const_1225:int = 20;
      
      private static const const_1003:String = "library";
      
      private static const const_1008:String = "asset-libraries";
      
      public static const const_1171:int = 5;
      
      public static const const_522:int = 30;
      
      public static const const_607:int = 4;
      
      public static const const_1339:int = 3;
      
      private static const const_1002:String = "service-libraries";
      
      private static const const_1009:String = "component-libraries";
       
      
      private var var_504:Number = 0;
      
      private var var_105:ICoreConfigStatusListener;
      
      private var var_361:uint;
      
      private var var_245:Array;
      
      private var var_246:uint;
      
      private var var_122:DisplayObjectContainer;
      
      private var var_720:Profiler;
      
      private var var_243:Array;
      
      private var var_212:Array;
      
      private var var_505:Array;
      
      private var var_599:Array;
      
      private var var_244:Array;
      
      private var var_598:ProfilerViewer;
      
      public function CoreComponent(param1:DisplayObjectContainer, param2:uint)
      {
         super(this,Component.COMPONENT_FLAG_CONTEXT,new AssetLibraryCollection("_core_assets"));
         var_865 = (param2 & 0) != 0;
         var_505 = new Array();
         var_599 = new Array();
         var _loc3_:int = 0;
         while(_loc3_ < CoreComponent.const_150)
         {
            var_505.push(new Array());
            var_599.push(0);
            _loc3_++;
         }
         var_361 = getTimer();
         attachComponent(this,[new IIDCore()]);
         var_122 = param1;
         switch(param2 & 0)
         {
            case Core.const_1152:
               debug("Core; using simple frame update handler");
               var_122.addEventListener(Event.ENTER_FRAME,simpleFrameUpdateHandler);
               break;
            case Core.const_781:
               debug("Core; using complex frame update handler");
               var_122.addEventListener(Event.ENTER_FRAME,complexFrameUpdateHandler);
               break;
            case Core.const_1148:
               debug("Core; using profiler frame update handler");
               var_122.addEventListener(Event.ENTER_FRAME,profilerFrameUpdateHandler);
               var_720 = new Profiler(this);
               attachComponent(var_720,[new IIDProfiler()]);
               var_598 = new ProfilerViewer();
               var_122.addChild(var_598);
         }
      }
      
      override public function removeUpdateReceiver(param1:ICoreUpdateReceiver) : void
      {
         var _loc2_:int = 0;
         var _loc3_:* = null;
         var _loc4_:int = 0;
         while(_loc4_ < CoreComponent.const_150)
         {
            _loc3_ = var_505[_loc4_] as Array;
            _loc2_ = _loc3_.indexOf(param1);
            if(_loc2_ > -1)
            {
               _loc3_[_loc2_] = null;
               return;
            }
            _loc4_++;
         }
      }
      
      public function getLastErrorMessage() : String
      {
         return var_868;
      }
      
      override public function error(param1:String, param2:Boolean, param3:int = -1, param4:Error = null) : void
      {
         if(param2)
         {
            if(param4 != null)
            {
               ErrorReportStorage.setParameter("error_data",String(param4.getStackTrace()));
            }
            ErrorReportStorage.setParameter("error_cat",String(param3));
            ErrorReportStorage.setParameter("error_desc",param1);
         }
         super.error(param1,param2,param3);
         if(param2)
         {
            dispose();
         }
      }
      
      public function initialize() : void
      {
         _events.dispatchEvent(new Event(Component.COMPONENT_EVENT_RUNNING));
         Logger.log(toXMLString());
      }
      
      private function updateConfigStatusListener() : void
      {
         var _loc1_:* = NaN;
         if(var_105)
         {
            _loc1_ = NaN;
            if(var_504 > 0)
            {
               _loc1_ += var_504 + var_212.length - 1;
            }
            else
            {
               _loc1_ += var_212.length;
            }
            var_105.percent = (Number(var_246) - _loc1_) / Number(var_246);
         }
      }
      
      private function profilerFrameUpdateHandler(param1:Event) : void
      {
         var criticality:uint = 0;
         var receivers:Array = null;
         var receiver:ICoreUpdateReceiver = null;
         var length:uint = 0;
         var index:uint = 0;
         var event:Event = param1;
         var msCurrentTime:uint = getTimer();
         var msSinceLastUpdate:uint = msCurrentTime - var_361;
         var_361 = msCurrentTime;
         var_720.start();
         criticality = 0;
         while(criticality < CoreComponent.const_150)
         {
            var_599[criticality] = 0;
            receivers = var_505[criticality];
            index = 0;
            length = receivers.length;
            while(index != length)
            {
               receiver = ICoreUpdateReceiver(receivers[index]);
               if(receiver == null || receiver.disposed)
               {
                  receivers.splice(index,1);
                  length--;
               }
               else
               {
                  try
                  {
                     var_720.update(receiver,msSinceLastUpdate);
                  }
                  catch(e:Error)
                  {
                     error("Error in update receiver \"" + getQualifiedClassName(receiver) + "\": " + e.message,true,e.errorID,e);
                     return;
                  }
                  index++;
               }
            }
            criticality++;
         }
         var_720.stop();
         var_598.refresh(var_720);
      }
      
      private function complexFrameUpdateHandler(param1:Event) : void
      {
         var criticality:uint = 0;
         var receivers:Array = null;
         var receiver:ICoreUpdateReceiver = null;
         var length:uint = 0;
         var index:uint = 0;
         var skip:Boolean = false;
         var t:uint = 0;
         var event:Event = param1;
         var msCurrentTime:uint = getTimer();
         var msSinceLastUpdate:uint = msCurrentTime - var_361;
         var maxTimePerFrame:uint = 1000 / DisplayObject(var_122).stage.frameRate;
         var_361 = msCurrentTime;
         criticality = 0;
         while(criticality < CoreComponent.const_150)
         {
            t = getTimer();
            skip = false;
            if(t - msCurrentTime > maxTimePerFrame)
            {
               if(var_599[criticality] < criticality)
               {
                  ++0;
                  skip = true;
               }
            }
            if(!skip)
            {
               var_599[criticality] = 0;
               receivers = var_505[criticality];
               index = 0;
               length = receivers.length;
               while(index != length)
               {
                  receiver = ICoreUpdateReceiver(receivers[index]);
                  if(receiver == null || receiver.disposed)
                  {
                     receivers.splice(index,1);
                     length--;
                  }
                  else
                  {
                     try
                     {
                        receiver.update(msSinceLastUpdate);
                     }
                     catch(e:Error)
                     {
                        trace(e.getStackTrace());
                        error("Error in update receiver \"" + getQualifiedClassName(receiver) + "\": " + e.message,true,e.errorID,e);
                        return;
                     }
                     index++;
                  }
               }
            }
            criticality++;
         }
      }
      
      private function simpleFrameUpdateHandler(param1:Event) : void
      {
         var criticality:uint = 0;
         var receivers:Array = null;
         var receiver:ICoreUpdateReceiver = null;
         var length:uint = 0;
         var index:uint = 0;
         var event:Event = param1;
         var msCurrentTime:uint = getTimer();
         var msSinceLastUpdate:uint = msCurrentTime - var_361;
         var_361 = msCurrentTime;
         criticality = 0;
         while(criticality < CoreComponent.const_150)
         {
            var_599[criticality] = 0;
            receivers = var_505[criticality];
            index = 0;
            length = receivers.length;
            while(index != length)
            {
               receiver = ICoreUpdateReceiver(receivers[index]);
               if(receiver == null || receiver.disposed)
               {
                  receivers.splice(index,1);
                  length--;
               }
               else
               {
                  try
                  {
                     receiver.update(msSinceLastUpdate);
                  }
                  catch(e:Error)
                  {
                     error("Error in update receiver \"" + getQualifiedClassName(receiver) + "\": " + e.message,true,e.errorID,e);
                     return;
                  }
                  index++;
               }
            }
            criticality++;
         }
      }
      
      public function loadExternalConfigDocument(param1:URLRequest, param2:ICoreConfigStatusListener = null) : void
      {
         if(var_105)
         {
            if(var_105 != param2)
            {
               var_105.dispose();
            }
         }
         if(param2)
         {
            var_105 = param2;
         }
         var _loc3_:AssetLoaderStruct = _assets.loadAssetFromFile("config.xml",param1);
         debug("Loading config document \"" + _loc3_.assetLoader.url + "\"");
         _loc3_.addEventListener(AssetLoaderEvent.const_30,configLoadedHandler);
         _loc3_.addEventListener(AssetLoaderEvent.const_44,configLoadedHandler);
      }
      
      override public function dispose() : void
      {
         var _loc1_:* = 0;
         var _loc2_:* = null;
         var _loc3_:int = 0;
         if(!disposed)
         {
            debug("Disposing core");
            var_122.removeEventListener(Event.ENTER_FRAME,simpleFrameUpdateHandler);
            var_122.removeEventListener(Event.ENTER_FRAME,complexFrameUpdateHandler);
            var_122.removeEventListener(Event.ENTER_FRAME,profilerFrameUpdateHandler);
            var_122 = null;
            _loc3_ = 0;
            while(_loc3_ < CoreComponent.const_150)
            {
               _loc2_ = var_505[_loc3_] as Array;
               _loc1_ = uint(_loc2_.length);
               while(_loc1_-- > 0)
               {
                  _loc2_.pop();
               }
               _loc3_++;
            }
            if(var_212 != null)
            {
               _loc1_ = 0;
               while(_loc1_-- > 0)
               {
                  var_212.pop();
               }
            }
            if(var_244 != null)
            {
               _loc1_ = 0;
               while(_loc1_-- > 0)
               {
                  var_244.pop();
               }
            }
            if(var_245 != null)
            {
               _loc1_ = 0;
               while(_loc1_-- > 0)
               {
                  var_245.pop();
               }
            }
            if(var_243 != null)
            {
               _loc1_ = 0;
               while(_loc1_-- > 0)
               {
                  var_243.pop();
               }
            }
            if(var_598 != null)
            {
               var_598.dispose();
               var_598 = null;
            }
            if(var_105)
            {
               var_105.dispose();
               var_105 = null;
            }
            super.dispose();
         }
      }
      
      public function readConfigDocument(param1:XML, param2:ICoreConfigStatusListener = null) : void
      {
         var _loc3_:* = null;
         var _loc4_:* = null;
         var _loc5_:* = null;
         var _loc6_:* = null;
         if(var_105)
         {
            if(var_105 != param2)
            {
               var_105.dispose();
            }
         }
         if(param2)
         {
            var_105 = param2;
         }
         debug("Parsing config document");
         if(var_212 == null)
         {
            var_212 = new Array();
         }
         _loc3_ = param1.child(const_1004)[0];
         if(_loc3_ != null)
         {
            _loc4_ = _loc3_.child(const_1006);
            for each(_loc5_ in _loc4_)
            {
               _loc6_ = _loc5_.attribute("url").toString();
               var_212.push(_loc6_);
               ++var_246;
            }
         }
         if(var_244 == null)
         {
            var_244 = new Array();
         }
         _loc3_ = param1.child(const_1008)[0];
         if(_loc3_ != null)
         {
            _loc4_ = _loc3_.child(const_1007);
            for each(_loc5_ in _loc4_)
            {
               _loc6_ = _loc5_.attribute("url").toString();
               var_244.push(_loc6_);
               ++var_246;
            }
         }
         if(var_245 == null)
         {
            var_245 = new Array();
         }
         _loc3_ = param1.child(const_1002)[0];
         if(_loc3_ != null)
         {
            _loc4_ = _loc3_.child(const_1003);
            for each(_loc5_ in _loc4_)
            {
               _loc6_ = _loc5_.attribute("url").toString();
               var_245.push(_loc6_);
               ++var_246;
            }
         }
         if(var_243 == null)
         {
            var_243 = new Array();
         }
         _loc3_ = param1.child(const_1009)[0];
         if(_loc3_ != null)
         {
            _loc4_ = _loc3_.child(const_1005);
            for each(_loc5_ in _loc4_)
            {
               _loc6_ = _loc5_.attribute("url").toString();
               var_243.push(_loc6_);
               ++var_246;
            }
         }
         if(var_105)
         {
            var_105.percent = 0;
         }
         updateLoadingProcess();
      }
      
      private function updateLoadingProcess(param1:LibraryLoaderEvent = null) : void
      {
         var _loc2_:* = null;
         var _loc3_:* = null;
         var _loc4_:* = null;
         if(param1 != null)
         {
            if(param1.type == LibraryLoaderEvent.LIBRARY_LOADER_EVENT_COMPLETE || param1.type == LibraryLoaderEvent.LIBRARY_LOADER_EVENT_ERROR)
            {
               _loc2_ = param1.target as LibraryLoader;
               _loc2_.removeEventListener(LibraryLoaderEvent.LIBRARY_LOADER_EVENT_COMPLETE,updateLoadingProcess);
               _loc2_.removeEventListener(LibraryLoaderEvent.LIBRARY_LOADER_EVENT_ERROR,errorInLoadingProcess);
               _loc2_.removeEventListener(ProgressEvent.PROGRESS,updateArchiveLoadingItemProgress);
               _loc3_ = _loc2_.url;
               debug("Loading library \"" + _loc3_ + "\" " + (param1.type == LibraryLoaderEvent.LIBRARY_LOADER_EVENT_COMPLETE ? "ready" : "failed\n" + _loc2_.getLastErrorMessage()));
               if(false)
               {
                  if(var_212[0] == _loc3_)
                  {
                     var_504 = 0;
                     var_212.splice(0,1);
                  }
               }
               if(false)
               {
                  if(var_244[0] == _loc3_)
                  {
                     var_244.splice(0,1);
                  }
               }
               if(false)
               {
                  if(var_245[0] == _loc3_)
                  {
                     var_245.splice(0,1);
                  }
               }
               if(false)
               {
                  if(var_243[0] == _loc3_)
                  {
                     var_243.splice(0,1);
                  }
               }
            }
         }
         if(false)
         {
            _loc3_ = "null";
            _loc2_ = _assets.loadFromArchive(new URLRequest(_loc3_),null);
            if(_loc2_.ready)
            {
               var_212.splice(0,1);
               updateLoadingProcess();
            }
            else
            {
               _loc2_.addEventListener(LibraryLoaderEvent.LIBRARY_LOADER_EVENT_COMPLETE,updateLoadingProcess);
               _loc2_.addEventListener(LibraryLoaderEvent.LIBRARY_LOADER_EVENT_ERROR,errorInLoadingProcess);
               _loc2_.addEventListener(ProgressEvent.PROGRESS,updateArchiveLoadingItemProgress);
               debug("Loading zip library " + _loc3_);
            }
            updateConfigStatusListener();
            return;
         }
         if(false)
         {
            _loc3_ = "null";
            _loc4_ = new LoaderContext(false,new ApplicationDomain());
            _loc2_ = _assets.loadFromFile(new URLRequest(_loc3_),true,_loc4_);
            if(_loc2_.ready)
            {
               var_244.splice(0,1);
               updateLoadingProcess();
            }
            else
            {
               var_504 = 1;
               _loc2_.addEventListener(LibraryLoaderEvent.LIBRARY_LOADER_EVENT_COMPLETE,updateLoadingProcess);
               _loc2_.addEventListener(LibraryLoaderEvent.LIBRARY_LOADER_EVENT_ERROR,errorInLoadingProcess);
               debug("Loading asset library " + _loc3_);
            }
            updateConfigStatusListener();
            return;
         }
         if(false)
         {
            _loc3_ = "null";
            _loc2_ = loadFromFile(new URLRequest(_loc3_),new LoaderContext(false,ApplicationDomain.currentDomain,null));
            if(_loc2_.ready)
            {
               var_245.splice(0,1);
               updateLoadingProcess();
            }
            else
            {
               _loc2_.addEventListener(LibraryLoaderEvent.LIBRARY_LOADER_EVENT_COMPLETE,updateLoadingProcess);
               _loc2_.addEventListener(LibraryLoaderEvent.LIBRARY_LOADER_EVENT_ERROR,errorInLoadingProcess);
               debug("Loading service library " + _loc3_);
            }
            updateConfigStatusListener();
            return;
         }
         if(false)
         {
            _loc3_ = "null";
            _loc2_ = loadFromFile(new URLRequest(_loc3_),new LoaderContext(false,ApplicationDomain.currentDomain,null));
            if(_loc2_.ready)
            {
               var_243.splice(0,1);
               updateLoadingProcess();
            }
            else
            {
               _loc2_.addEventListener(LibraryLoaderEvent.LIBRARY_LOADER_EVENT_COMPLETE,updateLoadingProcess);
               _loc2_.addEventListener(LibraryLoaderEvent.LIBRARY_LOADER_EVENT_ERROR,errorInLoadingProcess);
               debug("Loading component library " + _loc3_);
            }
            updateConfigStatusListener();
            return;
         }
         if(var_105)
         {
            var_105.complete();
         }
         debug("All libraries loaded, Core is now running");
      }
      
      private function errorInLoadingProcess(param1:LibraryLoaderEvent = null) : void
      {
         var _loc2_:LibraryLoader = LibraryLoader(param1.target);
         error("Failed to download library \"" + _loc2_.url + "\": " + _loc2_.getLastErrorMessage(),true,const_1188);
         updateLoadingProcess(param1);
      }
      
      private function updateArchiveLoadingItemProgress(param1:ProgressEvent) : void
      {
         var_504 = 1 - param1.bytesLoaded / param1.bytesTotal;
         if(var_504 > 0)
         {
            updateConfigStatusListener();
         }
      }
      
      public function getLastDebugMessage() : String
      {
         return var_2145;
      }
      
      override public function registerUpdateReceiver(param1:ICoreUpdateReceiver, param2:uint) : void
      {
         removeUpdateReceiver(param1);
         param2 = param2 >= CoreComponent.const_150 ? 4294967295 : uint(param2);
         var _loc3_:Array = var_505[param2] as Array;
         _loc3_.push(param1);
      }
      
      private function configLoadedHandler(param1:AssetLoaderEvent) : void
      {
         var _loc2_:* = null;
         var _loc3_:* = null;
         var _loc4_:* = null;
         _loc2_ = param1.target as AssetLoaderStruct;
         _loc2_.removeEventListener(AssetLoaderEvent.const_30,configLoadedHandler);
         _loc2_.removeEventListener(AssetLoaderEvent.const_44,configLoadedHandler);
         if(param1.type == AssetLoaderEvent.const_30)
         {
            debug("Config document \"" + _loc2_.assetLoader.url + "\" loaded");
            _loc3_ = _assets.getAssetByName(_loc2_.assetName) as XmlAsset;
            _loc4_ = _loc3_.content as XML;
            readConfigDocument(_loc4_,var_105);
         }
         else
         {
            error("Failed to download external configuration document " + _loc2_.assetLoader.url + "!",true,const_894);
            _events.dispatchEvent(new Event(Component.COMPONENT_EVENT_ERROR));
         }
      }
      
      public function get root() : DisplayObjectContainer
      {
         return var_122;
      }
   }
}
