package com.sulake.habbo.session.events
{
   import com.sulake.habbo.session.IRoomSession;
   
   public class RoomSessionVoteEvent extends RoomSessionEvent
   {
      
      public static const const_114:String = "RSPE_VOTE_RESULT";
      
      public static const const_111:String = "RSPE_VOTE_QUESTION";
       
      
      private var var_1181:int = 0;
      
      private var var_982:String = "";
      
      private var var_695:Array;
      
      private var var_937:Array;
      
      public function RoomSessionVoteEvent(param1:String, param2:IRoomSession, param3:String, param4:Array, param5:Array = null, param6:int = 0, param7:Boolean = false, param8:Boolean = false)
      {
         var_937 = [];
         var_695 = [];
         super(param1,param2,param7,param8);
         var_982 = param3;
         var_937 = param4;
         var_695 = param5;
         if(var_695 == null)
         {
            var_695 = [];
         }
         var_1181 = param6;
      }
      
      public function get votes() : Array
      {
         return var_695.slice();
      }
      
      public function get totalVotes() : int
      {
         return var_1181;
      }
      
      public function get question() : String
      {
         return var_982;
      }
      
      public function get choices() : Array
      {
         return var_937.slice();
      }
   }
}
