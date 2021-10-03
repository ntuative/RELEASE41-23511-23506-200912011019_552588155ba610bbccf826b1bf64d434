package com.sulake.habbo.sound.object
{
   import com.sulake.habbo.sound.IHabboSound;
   import flash.events.Event;
   import flash.media.Sound;
   import flash.media.SoundChannel;
   import flash.media.SoundTransform;
   
   public class HabboSound implements IHabboSound
   {
       
      
      private var var_973:SoundChannel = null;
      
      private var var_777:Boolean;
      
      private var var_974:Sound = null;
      
      private var var_684:Number;
      
      public function HabboSound(param1:Sound)
      {
         super();
         var_974 = param1;
         var_974.addEventListener(Event.COMPLETE,onComplete);
         var_684 = 1;
         var_777 = false;
      }
      
      public function get finished() : Boolean
      {
         return !var_777;
      }
      
      public function stop() : Boolean
      {
         var_973.stop();
         return true;
      }
      
      public function play() : Boolean
      {
         var_777 = false;
         var_973 = var_974.play(0);
         this.volume = var_684;
         return true;
      }
      
      public function set position(param1:Number) : void
      {
      }
      
      public function get volume() : Number
      {
         return var_684;
      }
      
      public function get ready() : Boolean
      {
         return true;
      }
      
      public function get position() : Number
      {
         return var_973.position;
      }
      
      public function get length() : Number
      {
         return var_974.length;
      }
      
      public function set volume(param1:Number) : void
      {
         var_684 = param1;
         if(var_973 != null)
         {
            var_973.soundTransform = new SoundTransform(var_684);
         }
      }
      
      private function onComplete(param1:Event) : void
      {
         var_777 = true;
      }
   }
}
