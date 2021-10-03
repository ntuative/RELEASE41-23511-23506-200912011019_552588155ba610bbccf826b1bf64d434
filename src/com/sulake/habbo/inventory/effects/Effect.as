package com.sulake.habbo.inventory.effects
{
   import com.sulake.habbo.inventory.common.IThumbListDrawableItem;
   import com.sulake.habbo.widget.memenu.IWidgetAvatarEffect;
   import flash.display.BitmapData;
   
   public class Effect implements IWidgetAvatarEffect, IThumbListDrawableItem
   {
       
      
      private var _isSelected:Boolean = false;
      
      private var var_1956:Date;
      
      private var var_1210:Boolean = false;
      
      private var _type:int;
      
      private var var_351:BitmapData;
      
      private var var_273:Boolean = false;
      
      private var var_1077:int;
      
      private var var_551:int = 1;
      
      private var var_983:int;
      
      public function Effect()
      {
         super();
      }
      
      public function get icon() : BitmapData
      {
         return var_351;
      }
      
      public function set type(param1:int) : void
      {
         _type = param1;
      }
      
      public function setOneEffectExpired() : void
      {
         --var_551;
         if(var_551 < 0)
         {
            var_551 = 0;
         }
         var_983 = var_1077;
         var_273 = false;
         var_1210 = false;
      }
      
      public function set isSelected(param1:Boolean) : void
      {
         _isSelected = param1;
      }
      
      public function set secondsLeft(param1:int) : void
      {
         var_983 = param1;
      }
      
      public function get isActive() : Boolean
      {
         return var_273;
      }
      
      public function set iconImage(param1:BitmapData) : void
      {
         var_351 = param1;
      }
      
      public function get duration() : int
      {
         return var_1077;
      }
      
      public function get isInUse() : Boolean
      {
         return var_1210;
      }
      
      public function get effectsInInventory() : int
      {
         return var_551;
      }
      
      public function get iconImage() : BitmapData
      {
         return var_351;
      }
      
      public function get isSelected() : Boolean
      {
         return _isSelected;
      }
      
      public function set isActive(param1:Boolean) : void
      {
         if(param1 && !var_273)
         {
            var_1956 = new Date();
         }
         var_273 = param1;
      }
      
      public function set effectsInInventory(param1:int) : void
      {
         var_551 = param1;
      }
      
      public function get secondsLeft() : int
      {
         var _loc1_:int = 0;
         if(var_273)
         {
            _loc1_ = var_983 - (new Date().valueOf() - var_1956.valueOf()) / 1000;
            _loc1_ = Math.floor(_loc1_);
            if(_loc1_ < 0)
            {
               _loc1_ = 0;
            }
            return _loc1_;
         }
         return var_983;
      }
      
      public function set isInUse(param1:Boolean) : void
      {
         var_1210 = param1;
      }
      
      public function set duration(param1:int) : void
      {
         var_1077 = param1;
      }
      
      public function get type() : int
      {
         return _type;
      }
   }
}
