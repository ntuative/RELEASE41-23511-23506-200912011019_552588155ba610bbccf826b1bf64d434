package com.sulake.habbo.communication.messages.incoming.navigator
{
   public class NavigationNodeData
   {
       
      
      private var var_1128:int;
      
      private var var_1422:String;
      
      public function NavigationNodeData(param1:int, param2:String)
      {
         super();
         var_1128 = param1;
         var_1422 = param2;
         Logger.log("READ NODE: " + var_1128 + ", " + var_1422);
      }
      
      public function get nodeName() : String
      {
         return var_1422;
      }
      
      public function get nodeId() : int
      {
         return var_1128;
      }
   }
}
