package com.sulake.habbo.help.help.data
{
   public class FaqItem
   {
       
      
      private var var_1240:int;
      
      private var var_1239:String;
      
      private var var_2125:String;
      
      private var _index:int;
      
      private var var_2124:Boolean = false;
      
      private var _category:FaqCategory;
      
      public function FaqItem(param1:int, param2:String, param3:int, param4:FaqCategory)
      {
         super();
         var_1240 = param1;
         var_2125 = param2;
         _index = param3;
         _category = param4;
      }
      
      public function get answerText() : String
      {
         return var_1239;
      }
      
      public function get questionId() : int
      {
         return var_1240;
      }
      
      public function get questionText() : String
      {
         return var_2125;
      }
      
      public function set answerText(param1:String) : void
      {
         var_1239 = param1;
         var_2124 = true;
      }
      
      public function get hasAnswer() : Boolean
      {
         return var_2124;
      }
      
      public function get category() : FaqCategory
      {
         return _category;
      }
      
      public function get index() : int
      {
         return _index;
      }
   }
}
