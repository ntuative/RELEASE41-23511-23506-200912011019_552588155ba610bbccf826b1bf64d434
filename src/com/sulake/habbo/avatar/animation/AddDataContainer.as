package com.sulake.habbo.avatar.animation
{
   public class AddDataContainer
   {
       
      
      private var var_1480:String;
      
      private var var_1500:String;
      
      private var var_954:String;
      
      private var var_406:Number = 1;
      
      private var _id:String;
      
      public function AddDataContainer(param1:XML)
      {
         super();
         _id = String(param1.@id);
         var_1480 = String(param1.@align);
         var_954 = String(param1.@base);
         var_1500 = String(param1.@ink);
         var _loc2_:String = String(param1.@blend);
         if(_loc2_.length > 0)
         {
            var_406 = Number(_loc2_);
            if(var_406 > 1)
            {
               var_406 /= 100;
            }
         }
      }
      
      public function get align() : String
      {
         return var_1480;
      }
      
      public function get ink() : String
      {
         return var_1500;
      }
      
      public function get base() : String
      {
         return var_954;
      }
      
      public function get isBlended() : Boolean
      {
         return var_406 != 1;
      }
      
      public function get blend() : Number
      {
         return var_406;
      }
      
      public function get id() : String
      {
         return _id;
      }
   }
}
