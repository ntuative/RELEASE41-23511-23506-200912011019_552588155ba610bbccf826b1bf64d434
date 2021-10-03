package com.sulake.habbo.room.object.logic
{
   import com.sulake.habbo.room.events.RoomObjectMoveEvent;
   import com.sulake.habbo.room.events.warnings.AvatarWalkWarpingWarningEvent;
   import com.sulake.habbo.room.messages.RoomObjectAvatarCarryObjectUpdateMessage;
   import com.sulake.habbo.room.messages.RoomObjectAvatarChatUpdateMessage;
   import com.sulake.habbo.room.messages.RoomObjectAvatarDanceUpdateMessage;
   import com.sulake.habbo.room.messages.RoomObjectAvatarEffectUpdateMessage;
   import com.sulake.habbo.room.messages.RoomObjectAvatarFigureUpdateMessage;
   import com.sulake.habbo.room.messages.RoomObjectAvatarFlatControlUpdateMessage;
   import com.sulake.habbo.room.messages.RoomObjectAvatarGestureUpdateMessage;
   import com.sulake.habbo.room.messages.RoomObjectAvatarPostureUpdateMessage;
   import com.sulake.habbo.room.messages.RoomObjectAvatarSelectedMessage;
   import com.sulake.habbo.room.messages.RoomObjectAvatarSignUpdateMessage;
   import com.sulake.habbo.room.messages.RoomObjectAvatarSleepUpdateMessage;
   import com.sulake.habbo.room.messages.RoomObjectAvatarTypingUpdateMessage;
   import com.sulake.habbo.room.messages.RoomObjectAvatarUpdateMessage;
   import com.sulake.habbo.room.messages.RoomObjectAvatarUseObjectUpdateMessage;
   import com.sulake.habbo.room.messages.RoomObjectAvatarWaveUpdateMessage;
   import com.sulake.habbo.room.messages.RoomObjectMoveUpdateMessage;
   import com.sulake.habbo.room.object.RoomObjectVariableEnum;
   import com.sulake.habbo.room.object.RoomObjectVisualizationEnum;
   import com.sulake.room.events.RoomObjectEvent;
   import com.sulake.room.events.RoomObjectMouseEvent;
   import com.sulake.room.events.RoomSpriteMouseEvent;
   import com.sulake.room.messages.RoomObjectUpdateMessage;
   import com.sulake.room.object.IRoomObjectModelController;
   import com.sulake.room.utils.IRoomGeometry;
   import com.sulake.room.utils.IVector3d;
   import com.sulake.room.utils.Vector3d;
   import flash.events.MouseEvent;
   
   public class AvatarLogic extends MovingObjectLogic
   {
      
      private static const const_756:Number = 1.5;
       
      
      private var var_339:Vector3d = null;
      
      private var _selected:Boolean = false;
      
      public function AvatarLogic()
      {
         super();
      }
      
      override public function dispose() : void
      {
         var _loc1_:* = null;
         if(_selected && object != null)
         {
            if(eventDispatcher != null)
            {
               _loc1_ = new RoomObjectMoveEvent(RoomObjectMoveEvent.const_382,object.getId(),object.getType());
               eventDispatcher.dispatchEvent(_loc1_);
            }
         }
         super.dispose();
         var_339 = null;
      }
      
      override public function update() : void
      {
         var _loc1_:* = null;
         var _loc2_:* = null;
         super.update();
         if(_selected && object != null)
         {
            if(eventDispatcher != null)
            {
               _loc1_ = object.getLocation();
               if(var_339 == null || var_339.x != _loc1_.x || var_339.y != _loc1_.y || var_339.z != _loc1_.z)
               {
                  if(var_339 == null)
                  {
                     var_339 = new Vector3d();
                  }
                  var_339.assign(_loc1_);
                  _loc2_ = new RoomObjectMoveEvent(RoomObjectMoveEvent.POSITION_CHANGED,object.getId(),object.getType());
                  eventDispatcher.dispatchEvent(_loc2_);
               }
            }
         }
      }
      
      override public function mouseEvent(param1:RoomSpriteMouseEvent, param2:IRoomGeometry) : void
      {
         var _loc6_:int = 0;
         var _loc7_:* = null;
         var _loc8_:* = null;
         if(object == null || param1 == null)
         {
            return;
         }
         switch(param1.type)
         {
            case MouseEvent.CLICK:
               _loc6_ = object.getId();
               _loc7_ = object.getType();
               if(eventDispatcher != null)
               {
                  _loc8_ = new RoomObjectMouseEvent(RoomObjectMouseEvent.const_218,_loc6_,_loc7_);
                  eventDispatcher.dispatchEvent(_loc8_);
               }
         }
      }
      
      override public function processUpdateMessage(param1:RoomObjectUpdateMessage) : void
      {
         var _loc2_:* = null;
         var _loc3_:* = null;
         var _loc4_:* = null;
         var _loc5_:* = null;
         var _loc6_:* = null;
         var _loc7_:* = null;
         var _loc8_:* = null;
         var _loc9_:* = null;
         var _loc10_:* = null;
         var _loc11_:* = null;
         var _loc12_:* = null;
         var _loc13_:* = null;
         var _loc14_:* = null;
         var _loc15_:* = null;
         var _loc16_:* = null;
         var _loc17_:* = null;
         var _loc18_:* = null;
         var _loc19_:* = null;
         var _loc20_:* = null;
         var _loc21_:* = null;
         if(param1 == null || object == null)
         {
            return;
         }
         if(param1 is RoomObjectAvatarUpdateMessage)
         {
            _loc2_ = param1 as RoomObjectMoveUpdateMessage;
            if(_loc2_ != null && targetIsWarping(_loc2_.method_9))
            {
               Logger.log("Target warp warning!");
               _loc3_ = new AvatarWalkWarpingWarningEvent();
               eventDispatcher.dispatchEvent(_loc3_);
            }
         }
         super.processUpdateMessage(param1);
         if(object != null)
         {
            _loc4_ = object.getModelController();
            if(object.getType() == RoomObjectVisualizationEnum.const_124 || object.getType() == RoomObjectVisualizationEnum.BOT)
            {
               if(param1 is RoomObjectAvatarUpdateMessage)
               {
                  _loc5_ = param1 as RoomObjectAvatarUpdateMessage;
                  if(_loc5_ != null)
                  {
                     _loc4_.setNumber(RoomObjectVariableEnum.const_278,_loc5_.dirHead);
                  }
               }
               if(param1 is RoomObjectAvatarWaveUpdateMessage)
               {
                  _loc6_ = param1 as RoomObjectAvatarWaveUpdateMessage;
                  if(_loc6_.isWaving)
                  {
                     _loc4_.setNumber(RoomObjectVariableEnum.const_313,new Date().valueOf());
                  }
                  else
                  {
                     _loc4_.setNumber(RoomObjectVariableEnum.const_313,-1);
                  }
               }
               if(param1 is RoomObjectAvatarTypingUpdateMessage)
               {
                  _loc7_ = param1 as RoomObjectAvatarTypingUpdateMessage;
                  _loc4_.setNumber(RoomObjectVariableEnum.const_786,Number(_loc7_.isTyping));
               }
               if(param1 is RoomObjectAvatarFigureUpdateMessage)
               {
                  _loc8_ = param1 as RoomObjectAvatarFigureUpdateMessage;
                  _loc9_ = _loc4_.getString(RoomObjectVariableEnum.const_162);
                  _loc10_ = _loc8_.figure;
                  if(_loc9_ != null && _loc9_.indexOf(".bds-") != -1)
                  {
                     _loc10_ += _loc9_.substr(_loc9_.indexOf(".bds-"));
                  }
                  _loc4_.setString(RoomObjectVariableEnum.const_162,_loc10_);
               }
               if(param1 is RoomObjectAvatarDanceUpdateMessage)
               {
                  _loc11_ = param1 as RoomObjectAvatarDanceUpdateMessage;
                  _loc4_.setNumber(RoomObjectVariableEnum.const_943,_loc11_.danceStyle);
               }
               if(param1 is RoomObjectAvatarSleepUpdateMessage)
               {
                  _loc12_ = param1 as RoomObjectAvatarSleepUpdateMessage;
                  _loc4_.setNumber(RoomObjectVariableEnum.const_355,Number(_loc12_.isSleeping));
               }
               if(param1 is RoomObjectAvatarEffectUpdateMessage)
               {
                  _loc13_ = param1 as RoomObjectAvatarEffectUpdateMessage;
                  _loc4_.setNumber(RoomObjectVariableEnum.const_768,_loc13_.effect);
               }
               if(param1 is RoomObjectAvatarCarryObjectUpdateMessage)
               {
                  _loc14_ = param1 as RoomObjectAvatarCarryObjectUpdateMessage;
                  _loc4_.setNumber(RoomObjectVariableEnum.const_630,_loc14_.itemType);
                  if(_loc14_.itemType > 0)
                  {
                     _loc4_.setNumber(RoomObjectVariableEnum.const_622,new Date().valueOf());
                  }
                  else
                  {
                     _loc4_.setNumber(RoomObjectVariableEnum.const_622,-1);
                  }
               }
               if(param1 is RoomObjectAvatarUseObjectUpdateMessage)
               {
                  _loc15_ = param1 as RoomObjectAvatarUseObjectUpdateMessage;
                  _loc4_.setNumber(RoomObjectVariableEnum.const_837,_loc15_.itemType);
               }
               if(param1 is RoomObjectAvatarGestureUpdateMessage)
               {
                  _loc16_ = param1 as RoomObjectAvatarGestureUpdateMessage;
                  _loc4_.setNumber(RoomObjectVariableEnum.const_446,_loc16_.gesture);
                  _loc4_.setNumber(RoomObjectVariableEnum.const_386,new Date().valueOf());
               }
               if(param1 is RoomObjectAvatarChatUpdateMessage)
               {
                  _loc17_ = param1 as RoomObjectAvatarChatUpdateMessage;
                  _loc4_.setNumber(RoomObjectVariableEnum.const_640,_loc17_.numberOfWords);
                  _loc4_.setNumber(RoomObjectVariableEnum.const_500,new Date().valueOf());
               }
               if(param1 is RoomObjectAvatarSignUpdateMessage)
               {
                  _loc18_ = param1 as RoomObjectAvatarSignUpdateMessage;
                  _loc4_.setNumber(RoomObjectVariableEnum.const_925,_loc18_.signType);
                  _loc4_.setNumber(RoomObjectVariableEnum.const_860,new Date().valueOf());
               }
               if(param1 is RoomObjectAvatarPostureUpdateMessage)
               {
                  _loc19_ = param1 as RoomObjectAvatarPostureUpdateMessage;
                  _loc4_.setString(RoomObjectVariableEnum.const_244,_loc19_.postureType);
                  _loc4_.setString(RoomObjectVariableEnum.const_601,_loc19_.parameter);
               }
               if(param1 is RoomObjectAvatarFlatControlUpdateMessage)
               {
                  _loc20_ = param1 as RoomObjectAvatarFlatControlUpdateMessage;
                  _loc4_.setString(RoomObjectVariableEnum.const_660,_loc20_.rawData);
                  _loc4_.setNumber(RoomObjectVariableEnum.const_1162,Number(_loc20_.isAdmin));
               }
               if(param1 is RoomObjectAvatarSelectedMessage)
               {
                  _loc21_ = param1 as RoomObjectAvatarSelectedMessage;
                  _selected = _loc21_.selected;
                  var_339 = null;
               }
            }
         }
      }
      
      private function targetIsWarping(param1:IVector3d) : Boolean
      {
         var _loc2_:IVector3d = object.getLocation();
         if(param1 == null)
         {
            return false;
         }
         if(_loc2_.x == 0 && _loc2_.y == 0)
         {
            return false;
         }
         if(Math.abs(_loc2_.x - param1.x) > const_756 || Math.abs(_loc2_.y - param1.y) > const_756)
         {
            return true;
         }
         return false;
      }
   }
}
