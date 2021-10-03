package com.sulake.habbo.navigator.domain
{
   import com.sulake.habbo.navigator.HabboNavigator;
   import com.sulake.habbo.navigator.mainview.MainViewCtrl;
   import com.sulake.habbo.navigator.mainview.tabpagedecorators.EventsTabPageDecorator;
   import com.sulake.habbo.navigator.mainview.tabpagedecorators.MyRoomsTabPageDecorator;
   import com.sulake.habbo.navigator.mainview.tabpagedecorators.OfficialTabPageDecorator;
   import com.sulake.habbo.navigator.mainview.tabpagedecorators.RoomsTabPageDecorator;
   import com.sulake.habbo.navigator.mainview.tabpagedecorators.SearchTabPageDecorator;
   
   public class Tabs
   {
      
      public static const const_637:int = 6;
      
      public static const const_214:int = 5;
      
      public static const const_677:int = 2;
      
      public static const const_323:int = 9;
      
      public static const const_224:int = 4;
      
      public static const const_238:int = 2;
      
      public static const const_491:int = 4;
      
      public static const const_217:int = 8;
      
      public static const const_567:int = 7;
      
      public static const const_269:int = 3;
      
      public static const const_298:int = 1;
      
      public static const const_190:int = 5;
      
      public static const const_361:int = 12;
      
      public static const const_277:int = 1;
      
      public static const const_349:int = 11;
      
      public static const const_591:int = 3;
      
      public static const const_1452:int = 10;
       
      
      private var _navigator:HabboNavigator;
      
      private var var_403:Array;
      
      public function Tabs(param1:HabboNavigator)
      {
         super();
         _navigator = param1;
         var_403 = new Array();
         var_403.push(new Tab(_navigator,const_298,const_361,new EventsTabPageDecorator(_navigator),MainViewCtrl.const_438));
         var_403.push(new Tab(_navigator,const_238,const_277,new RoomsTabPageDecorator(_navigator),MainViewCtrl.const_438));
         var_403.push(new Tab(_navigator,const_224,const_349,new OfficialTabPageDecorator(_navigator),MainViewCtrl.const_554));
         var_403.push(new Tab(_navigator,const_269,const_214,new MyRoomsTabPageDecorator(_navigator),MainViewCtrl.const_438));
         var_403.push(new Tab(_navigator,const_190,const_217,new SearchTabPageDecorator(_navigator),MainViewCtrl.const_647));
         setSelectedTab(const_298);
      }
      
      public function getSelected() : Tab
      {
         var _loc1_:* = null;
         for each(_loc1_ in var_403)
         {
            if(_loc1_.selected)
            {
               return _loc1_;
            }
         }
         return null;
      }
      
      public function getTab(param1:int) : Tab
      {
         var _loc2_:* = null;
         for each(_loc2_ in var_403)
         {
            if(_loc2_.id == param1)
            {
               return _loc2_;
            }
         }
         return null;
      }
      
      private function clearSelected() : void
      {
         var _loc1_:* = null;
         for each(_loc1_ in var_403)
         {
            _loc1_.selected = false;
         }
      }
      
      public function onFrontPage() : Boolean
      {
         return this.getSelected().id == const_224;
      }
      
      public function get tabs() : Array
      {
         return var_403;
      }
      
      public function setSelectedTab(param1:int) : void
      {
         this.clearSelected();
         getTab(param1).selected = true;
      }
   }
}
