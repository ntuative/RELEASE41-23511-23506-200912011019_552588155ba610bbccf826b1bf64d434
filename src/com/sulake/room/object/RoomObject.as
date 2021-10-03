package com.sulake.room.object
{
   import com.sulake.room.object.logic.IRoomObjectEventHandler;
   import com.sulake.room.object.logic.IRoomObjectMouseHandler;
   import com.sulake.room.object.visualization.IRoomObjectVisualization;
   import com.sulake.room.utils.IVector3d;
   import com.sulake.room.utils.Vector3d;
   
   public class RoomObject implements IRoomObjectController
   {
      
      private static var var_1137:int = 0;
       
      
      private var var_78:Vector3d;
      
      private var _updateID:uint;
      
      private var _type:String = "";
      
      private var _visualization:IRoomObjectVisualization;
      
      private var var_93:RoomObjectModel;
      
      private var var_369:IRoomObjectEventHandler;
      
      private var var_1385:Vector3d;
      
      private var var_1778:int = 0;
      
      private var _id:int;
      
      private var var_1384:Vector3d;
      
      private var var_225:Vector3d;
      
      private var var_450:Array;
      
      public function RoomObject(param1:int, param2:uint)
      {
         super();
         _id = param1;
         var_78 = new Vector3d();
         var_225 = new Vector3d();
         var_1385 = new Vector3d();
         var_1384 = new Vector3d();
         var_450 = new Array(param2);
         var _loc3_:Number = param2 - 1;
         while(_loc3_ >= 0)
         {
            var_450[_loc3_] = 0;
            _loc3_--;
         }
         var_93 = new RoomObjectModel();
         _visualization = null;
         var_369 = null;
         _updateID = 0;
         var_1778 = var_1137++;
      }
      
      public function getInstanceId() : int
      {
         return var_1778;
      }
      
      public function getId() : int
      {
         return _id;
      }
      
      public function getUpdateID() : uint
      {
         return _updateID;
      }
      
      public function dispose() : void
      {
         var_78 = null;
         var_225 = null;
         if(var_93 != null)
         {
            var_93.dispose();
            var_93 = null;
         }
         var_450 = null;
         setVisualization(null);
         setEventHandler(null);
      }
      
      public function getType() : String
      {
         return _type;
      }
      
      public function getLocation() : IVector3d
      {
         var_1385.assign(var_78);
         return var_1385;
      }
      
      public function setLocation(param1:IVector3d) : void
      {
         if(param1 == null)
         {
            return;
         }
         if(var_78.x != param1.x || var_78.y != param1.y || var_78.z != param1.z)
         {
            var_78.x = param1.x;
            var_78.y = param1.y;
            var_78.z = param1.z;
            ++_updateID;
         }
      }
      
      public function setDirection(param1:IVector3d) : void
      {
         if(param1 == null)
         {
            return;
         }
         if(var_225.x != param1.x || var_225.y != param1.y || var_225.z != param1.z)
         {
            var_225.x = (param1.x % 360 + 360) % 360;
            var_225.y = (param1.y % 360 + 360) % 360;
            var_225.z = (param1.z % 360 + 360) % 360;
            ++_updateID;
         }
      }
      
      public function setType(param1:String) : void
      {
         _type = param1;
      }
      
      public function getEventHandler() : IRoomObjectEventHandler
      {
         return var_369;
      }
      
      public function getDirection() : IVector3d
      {
         var_1384.assign(var_225);
         return var_1384;
      }
      
      public function setState(param1:int, param2:uint) : Boolean
      {
         if(param2 < var_450.length)
         {
            if(var_450[param2] != param1)
            {
               var_450[param2] = param1;
               ++_updateID;
            }
            return true;
         }
         return false;
      }
      
      public function setEventHandler(param1:IRoomObjectEventHandler) : void
      {
         if(param1 == var_369)
         {
            return;
         }
         var _loc2_:IRoomObjectEventHandler = var_369;
         if(_loc2_ != null)
         {
            var_369 = null;
            _loc2_.object = null;
         }
         var_369 = param1;
         if(var_369 != null)
         {
            var_369.object = this;
         }
      }
      
      public function getState(param1:uint) : int
      {
         if(param1 < var_450.length)
         {
            return var_450[param1];
         }
         return -1;
      }
      
      public function setVisualization(param1:IRoomObjectVisualization) : void
      {
         if(param1 != _visualization)
         {
            if(_visualization != null)
            {
               _visualization.dispose();
            }
            _visualization = param1;
            if(_visualization != null)
            {
               _visualization.object = this;
            }
         }
      }
      
      public function getVisualization() : IRoomObjectVisualization
      {
         return _visualization;
      }
      
      public function getModel() : IRoomObjectModel
      {
         return var_93;
      }
      
      public function getModelController() : IRoomObjectModelController
      {
         return var_93;
      }
      
      public function getMouseHandler() : IRoomObjectMouseHandler
      {
         return getEventHandler();
      }
   }
}
