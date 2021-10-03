package com.sulake.habbo.avatar.pets
{
   public class PetEditorInfo
   {
       
      
      private var var_1708:Boolean;
      
      private var var_1709:Boolean;
      
      public function PetEditorInfo(param1:XML)
      {
         super();
         var_1708 = Boolean(parseInt(param1.@club));
         var_1709 = Boolean(parseInt(param1.@selectable));
      }
      
      public function get isClub() : Boolean
      {
         return var_1708;
      }
      
      public function get isSelectable() : Boolean
      {
         return var_1709;
      }
   }
}
