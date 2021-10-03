package com.sulake.habbo.room.messages
{
   import com.sulake.room.messages.RoomObjectUpdateMessage;
   import com.sulake.room.utils.IVector3d;
   import com.sulake.room.utils.Vector3d;
   
   public class RoomObjectRoomMaskUpdateMessage extends RoomObjectUpdateMessage
   {
      
      public static const const_1120:String = "door";
      
      public static const const_353:String = "window";
      
      public static const const_495:String = "RORMUM_ADD_MASK";
      
      public static const const_445:String = "RORMUM_ADD_MASK";
      
      public static const const_212:String = "hole";
       
      
      private var var_1834:String = "";
      
      private var var_1836:String = "";
      
      private var var_1835:String = "window";
      
      private var var_1837:Vector3d = null;
      
      private var _type:String = "";
      
      public function RoomObjectRoomMaskUpdateMessage(param1:String, param2:String, param3:String = null, param4:IVector3d = null, param5:String = "window")
      {
         super(null,null);
         _type = param1;
         var_1836 = param2;
         var_1834 = param3;
         if(param4 != null)
         {
            var_1837 = new Vector3d(param4.x,param4.y,param4.z);
         }
         var_1835 = param5;
      }
      
      public function get maskCategory() : String
      {
         return var_1835;
      }
      
      public function get maskId() : String
      {
         return var_1836;
      }
      
      public function get maskLocation() : IVector3d
      {
         return var_1837;
      }
      
      public function get maskType() : String
      {
         return var_1834;
      }
      
      public function get type() : String
      {
         return _type;
      }
   }
}
