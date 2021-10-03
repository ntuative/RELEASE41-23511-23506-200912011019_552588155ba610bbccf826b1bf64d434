package com.sulake.habbo.widget.events
{
   public class RoomWidgetVoteUpdateEvent extends RoomWidgetUpdateEvent
   {
      
      public static const const_114:String = "RWPUE_VOTE_RESULT";
      
      public static const const_111:String = "RWPUE_VOTE_QUESTION";
       
      
      private var var_1181:int;
      
      private var var_982:String;
      
      private var var_695:Array;
      
      private var var_937:Array;
      
      public function RoomWidgetVoteUpdateEvent(param1:String, param2:String, param3:Array, param4:Array = null, param5:int = 0, param6:Boolean = false, param7:Boolean = false)
      {
         super(param1,param6,param7);
         var_982 = param2;
         var_937 = param3;
         var_695 = param4;
         if(var_695 == null)
         {
            var_695 = [];
         }
         var_1181 = param5;
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
