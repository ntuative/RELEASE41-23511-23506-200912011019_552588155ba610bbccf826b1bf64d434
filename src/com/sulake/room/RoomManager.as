package com.sulake.room
{
   import com.sulake.core.runtime.Component;
   import com.sulake.core.runtime.IContext;
   import com.sulake.core.runtime.IID;
   import com.sulake.core.runtime.IUnknown;
   import com.sulake.core.utils.Map;
   import com.sulake.iid.IIDRoomObjectFactory;
   import com.sulake.iid.IIDRoomObjectVisualizationFactory;
   import com.sulake.room.events.RoomContentLoadedEvent;
   import com.sulake.room.exceptions.RoomManagerException;
   import com.sulake.room.object.IRoomObject;
   import com.sulake.room.object.IRoomObjectController;
   import com.sulake.room.object.IRoomObjectModelController;
   import com.sulake.room.object.IRoomObjectVisualizationFactory;
   import com.sulake.room.object.logic.IRoomObjectEventHandler;
   import com.sulake.room.object.visualization.IRoomObjectGraphicVisualization;
   import com.sulake.room.object.visualization.IRoomObjectVisualizationData;
   import com.sulake.room.object.visualization.utils.IGraphicAssetCollection;
   
   public class RoomManager extends Component implements IRoomManager, IRoomInstanceContainer
   {
      
      public static const const_588:int = -1;
      
      public static const const_905:int = 2;
      
      public static const const_1327:int = 0;
      
      public static const const_1271:int = 1;
      
      public static const ROOM_MANAGER_INITIALIZED:int = 3;
       
      
      private var _disposed:Boolean = false;
      
      private var var_763:XML = null;
      
      private var _state:int = 0;
      
      private var var_117:IRoomManagerListener;
      
      private var var_460:Array;
      
      private var var_374:IRoomObjectVisualizationFactory = null;
      
      private var var_461:Array;
      
      private var var_459:IRoomObjectFactory = null;
      
      private var var_1464:int;
      
      private var var_2248:IRoomContentLoader;
      
      private var var_51:IRoomContentLoader;
      
      private var var_110:Map;
      
      public function RoomManager(param1:IContext, param2:uint = 0)
      {
         super(param1,param2);
         var_110 = new Map();
         queueInterface(new IIDRoomObjectFactory(),objectFactoryReady);
         queueInterface(new IIDRoomObjectVisualizationFactory(),visualizationFactoryReady);
         var_461 = [];
         var_460 = [];
         _events.addEventListener(RoomContentLoadedEvent.const_427,onContentLoaded);
         _events.addEventListener(RoomContentLoadedEvent.const_372,onContentLoaded);
         _events.addEventListener(RoomContentLoadedEvent.const_653,onContentLoaded);
      }
      
      public function initialize(param1:XML, param2:IRoomManagerListener) : Boolean
      {
         var _loc5_:* = null;
         if(_state == const_1327)
         {
            if(var_763 != null)
            {
               return false;
            }
            var_763 = param1;
            var_117 = param2;
            return true;
         }
         if(_state >= const_905)
         {
            return false;
         }
         if(param1 == null)
         {
            return false;
         }
         if(var_51 == null)
         {
            return false;
         }
         var_1464 = 50;
         var_117 = param2;
         var _loc3_:Array = var_51.getPlaceHolderTypes();
         var _loc4_:int = 0;
         while(_loc4_ < _loc3_.length)
         {
            _loc5_ = _loc3_[_loc4_];
            if(var_461.indexOf(_loc5_) < 0)
            {
               var_51.loadObjectContent(_loc5_,_events);
               var_461.push(_loc5_);
            }
            _loc4_++;
         }
         _state = const_905;
         return true;
      }
      
      private function continueInitializing() : void
      {
         var _loc1_:* = null;
         if(var_459 == null || var_374 == null)
         {
            return;
         }
         _state = const_1271;
         if(var_763 != null)
         {
            _loc1_ = var_763;
            var_763 = null;
            initialize(_loc1_,var_117);
         }
      }
      
      public function createRoomObject(param1:String, param2:int, param3:String, param4:int) : IRoomObject
      {
         if(_state < ROOM_MANAGER_INITIALIZED)
         {
            throw new RoomManagerException();
         }
         var _loc5_:IRoomInstance = getRoom(param1);
         if(_loc5_ == null)
         {
            return null;
         }
         if(var_51 == null)
         {
            return null;
         }
         var _loc6_:RoomInstance = _loc5_ as RoomInstance;
         if(_loc6_ == null)
         {
            return null;
         }
         var _loc7_:* = null;
         var _loc8_:* = null;
         var _loc9_:* = null;
         var _loc10_:* = null;
         var _loc11_:* = null;
         var _loc12_:String = param3;
         if(!var_51.hasInternalContent(param3))
         {
            _loc7_ = var_51.getGraphicAssetCollection(param3);
            if(_loc7_ == null)
            {
               var_51.loadObjectContent(param3,_events);
               _loc12_ = var_51.getPlaceHolderType(param3);
               _loc7_ = var_51.getGraphicAssetCollection(_loc12_);
            }
            _loc8_ = var_51.getVisualizationXML(_loc12_);
            _loc9_ = var_51.getLogicXML(_loc12_);
            if(_loc8_ == null || _loc7_ == null)
            {
               return null;
            }
            _loc10_ = var_51.getVisualizationType(_loc12_);
            _loc11_ = var_51.getLogicType(_loc12_);
         }
         else
         {
            _loc10_ = param3;
            _loc11_ = param3;
         }
         var _loc13_:int = 1;
         var _loc14_:IRoomObject = _loc6_.createObjectInternal(param2,_loc13_,param4);
         var _loc15_:IRoomObjectController = _loc14_ as IRoomObjectController;
         if(_loc15_ == null)
         {
            return null;
         }
         var _loc16_:IRoomObjectModelController = _loc15_.getModelController();
         if(_loc16_ == null)
         {
            _loc5_.disposeObject(param2,param4);
            return null;
         }
         _loc15_.setType(param3);
         var _loc17_:IRoomObjectGraphicVisualization = var_374.createRoomObjectVisualization(_loc10_);
         if(_loc17_ == null)
         {
            _loc5_.disposeObject(param2,param4);
            return null;
         }
         _loc17_.assetCollection = _loc7_;
         var _loc18_:* = null;
         _loc18_ = var_374.getRoomObjectVisualizationData(_loc12_,_loc10_,_loc8_);
         if(!_loc17_.initialize(_loc18_))
         {
            _loc5_.disposeObject(param2,param4);
            return null;
         }
         _loc15_.setVisualization(_loc17_);
         var _loc19_:IRoomObjectEventHandler = var_459.createRoomObjectLogic(_loc11_);
         _loc15_.setEventHandler(_loc19_);
         if(_loc19_ != null && _loc9_ != null)
         {
            _loc19_.initialize(_loc9_);
         }
         return _loc15_;
      }
      
      public function isContentAvailable(param1:String) : Boolean
      {
         if(var_51 != null)
         {
            if(var_51.getGraphicAssetCollection(param1) != null)
            {
               return true;
            }
         }
         return false;
      }
      
      private function objectFactoryReady(param1:IID = null, param2:IUnknown = null) : void
      {
         if(disposed)
         {
            return;
         }
         var_459 = param2 as IRoomObjectFactory;
         continueInitializing();
      }
      
      public function removeObjectUpdateCategory(param1:int) : void
      {
         var _loc4_:* = null;
         var _loc2_:int = var_460.indexOf(param1);
         if(_loc2_ < 0)
         {
            return;
         }
         var_460.splice(_loc2_,1);
         var _loc3_:int = -1;
         while(_loc3_ >= 0)
         {
            _loc4_ = var_110.getWithIndex(_loc3_) as RoomInstance;
            if(_loc4_ != null)
            {
               _loc4_.removeObjectUpdateCategory(param1);
            }
            _loc3_--;
         }
      }
      
      override public function get disposed() : Boolean
      {
         return _disposed;
      }
      
      override public function dispose() : void
      {
         var _loc3_:* = null;
         if(disposed)
         {
            return;
         }
         super.dispose();
         var _loc1_:int = 0;
         var _loc2_:int = 0;
         if(var_110 != null)
         {
            _loc1_ = 0;
            _loc2_ = 0;
            while(_loc2_ < _loc1_)
            {
               _loc3_ = var_110.getWithIndex(_loc2_) as IRoomInstance;
               if(_loc3_ != null)
               {
                  _loc3_.dispose();
               }
               _loc2_++;
            }
            var_110.dispose();
            var_110 = null;
         }
         var_117 = null;
         if(var_459 != null)
         {
            release(new IIDRoomObjectFactory());
            var_459 = null;
         }
         if(var_374 != null)
         {
            release(new IIDRoomObjectVisualizationFactory());
            var_374 = null;
         }
         var_461 = null;
         var_460 = null;
         var_51 = null;
         _disposed = true;
      }
      
      public function disposeRoom(param1:String) : Boolean
      {
         var _loc2_:IRoomInstance = var_110.remove(param1) as IRoomInstance;
         if(_loc2_ != null)
         {
            _loc2_.dispose();
            return true;
         }
         return false;
      }
      
      public function createRoomObjectManager() : IRoomObjectManager
      {
         if(var_459 != null)
         {
            return var_459.createRoomObjectManager();
         }
         return null;
      }
      
      public function setContentLoader(param1:IRoomContentLoader) : void
      {
         if(var_51 != null)
         {
            var_51.dispose();
         }
         var_51 = param1;
      }
      
      private function onContentLoaded(param1:RoomContentLoadedEvent) : void
      {
         if(var_51 == null)
         {
            return;
         }
         var _loc2_:String = param1.contentType;
         if(_loc2_ == null)
         {
            if(var_117 != null)
            {
               var_117.contentLoaded(null,false);
            }
            return;
         }
         var _loc3_:XML = var_51.getVisualizationXML(_loc2_);
         if(_loc3_ == null)
         {
            if(var_117 != null)
            {
               var_117.contentLoaded(_loc2_,false);
            }
            return;
         }
         var _loc4_:IGraphicAssetCollection = var_51.getGraphicAssetCollection(_loc2_);
         if(_loc4_ == null)
         {
            if(var_117 != null)
            {
               var_117.contentLoaded(_loc2_,false);
            }
            return;
         }
         updateObjectContent(_loc2_);
         if(var_117 != null)
         {
            var_117.contentLoaded(_loc2_,true);
         }
         if(false)
         {
            processInitialContentLoad(_loc2_);
         }
      }
      
      public function addObjectUpdateCategory(param1:int) : void
      {
         var _loc4_:* = null;
         var _loc2_:int = var_460.indexOf(param1);
         if(_loc2_ >= 0)
         {
            return;
         }
         var_460.push(param1);
         var _loc3_:int = -1;
         while(_loc3_ >= 0)
         {
            _loc4_ = var_110.getWithIndex(_loc3_) as RoomInstance;
            if(_loc4_ != null)
            {
               _loc4_.addObjectUpdateCategory(param1);
            }
            _loc3_--;
         }
      }
      
      public function update(param1:uint) : void
      {
         var _loc3_:* = null;
         var _loc2_:int = -1;
         while(_loc2_ >= 0)
         {
            _loc3_ = var_110.getWithIndex(_loc2_) as RoomInstance;
            if(_loc3_ != null)
            {
               _loc3_.update();
            }
            _loc2_--;
         }
      }
      
      public function getRoom(param1:String) : IRoomInstance
      {
         return var_110.getValue(param1) as IRoomInstance;
      }
      
      private function processInitialContentLoad(param1:String) : void
      {
         var _loc2_:int = 0;
         if(param1 == null)
         {
            return;
         }
         if(_state == const_588)
         {
            return;
         }
         if(var_51 == null)
         {
            _state = const_588;
            return;
         }
         if(var_51.getGraphicAssetCollection(param1) != null)
         {
            _loc2_ = var_461.indexOf(param1);
            if(_loc2_ >= 0)
            {
               var_461.splice(_loc2_,1);
            }
            if(false)
            {
               _state = ROOM_MANAGER_INITIALIZED;
               if(var_117 != null)
               {
                  var_117.roomManagerInitialized();
               }
            }
         }
         else
         {
            _state = const_588;
            var_117.roomManagerInitialized(false);
         }
      }
      
      private function updateObjectContent(param1:String) : void
      {
         var _loc7_:* = null;
         var _loc8_:* = null;
         var _loc9_:* = null;
         var _loc10_:int = 0;
         var _loc11_:int = 0;
         var _loc12_:int = 0;
         var _loc13_:int = 0;
         var _loc14_:* = null;
         var _loc15_:* = null;
         var _loc16_:* = null;
         var _loc17_:* = null;
         var _loc18_:* = null;
         var _loc19_:* = null;
         var _loc20_:* = null;
         if(param1 == null)
         {
            return;
         }
         if(var_51 == null || var_374 == null)
         {
            return;
         }
         var _loc2_:XML = var_51.getVisualizationXML(param1);
         var _loc3_:XML = var_51.getLogicXML(param1);
         var _loc4_:IGraphicAssetCollection = var_51.getGraphicAssetCollection(param1);
         if(_loc2_ == null || _loc4_ == null)
         {
            return;
         }
         var _loc5_:* = null;
         var _loc6_:int = -1;
         while(_loc6_ >= 0)
         {
            _loc7_ = var_110.getWithIndex(_loc6_) as RoomInstance;
            _loc8_ = var_110.getKey(_loc6_);
            if(_loc7_ != null)
            {
               _loc9_ = _loc7_.getObjectManagerIds();
               _loc10_ = _loc9_.length - 1;
               while(_loc10_ >= 0)
               {
                  _loc11_ = int(_loc9_[_loc10_]);
                  _loc12_ = _loc7_.getObjectCount(_loc11_);
                  _loc13_ = _loc12_ - 1;
                  while(_loc13_ >= 0)
                  {
                     _loc14_ = _loc7_.getObjectWithIndex(_loc13_,_loc11_) as IRoomObjectController;
                     if(_loc14_ != null)
                     {
                        _loc15_ = _loc14_.getType();
                        _loc16_ = var_51.getContentType(_loc15_);
                        if(_loc16_ == param1)
                        {
                           _loc17_ = var_51.getVisualizationType(_loc15_);
                           _loc18_ = var_51.getLogicType(_loc15_);
                           _loc5_ = var_374.getRoomObjectVisualizationData(_loc15_,_loc17_,_loc2_);
                           _loc19_ = var_374.createRoomObjectVisualization(_loc17_);
                           if(_loc19_ != null)
                           {
                              _loc19_.assetCollection = _loc4_;
                              if(!_loc19_.initialize(_loc5_))
                              {
                                 _loc7_.disposeObject(_loc14_.getId(),_loc11_);
                              }
                              else
                              {
                                 _loc14_.setVisualization(_loc19_);
                                 _loc20_ = var_459.createRoomObjectLogic(_loc18_);
                                 _loc14_.setEventHandler(_loc20_);
                                 if(_loc20_ != null)
                                 {
                                    _loc20_.initialize(_loc3_);
                                 }
                                 if(var_117 != null)
                                 {
                                    var_117.objectInitialized(_loc8_,_loc14_.getId(),_loc11_);
                                 }
                              }
                           }
                           else
                           {
                              _loc7_.disposeObject(_loc14_.getId(),_loc11_);
                           }
                        }
                     }
                     _loc13_--;
                  }
                  _loc10_--;
               }
            }
            _loc6_--;
         }
      }
      
      public function createRoom(param1:String, param2:XML) : IRoomInstance
      {
         var _loc5_:int = 0;
         if(_state < ROOM_MANAGER_INITIALIZED)
         {
            throw new RoomManagerException();
         }
         if(var_110.getValue(param1) != null)
         {
            return null;
         }
         var _loc3_:RoomInstance = new RoomInstance(param1,this);
         var_110.add(String(param1),_loc3_);
         var _loc4_:int = -1;
         while(_loc4_ >= 0)
         {
            _loc5_ = 0;
            _loc3_.addObjectUpdateCategory(_loc5_);
            _loc4_--;
         }
         return _loc3_;
      }
      
      private function visualizationFactoryReady(param1:IID = null, param2:IUnknown = null) : void
      {
         if(disposed)
         {
            return;
         }
         var_374 = param2 as IRoomObjectVisualizationFactory;
         continueInitializing();
      }
   }
}
