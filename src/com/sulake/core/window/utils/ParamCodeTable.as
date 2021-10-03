package com.sulake.core.window.utils
{
   import com.sulake.core.window.enum.WindowParam;
   import flash.utils.Dictionary;
   
   public class ParamCodeTable extends WindowParam
   {
       
      
      public function ParamCodeTable()
      {
         super();
      }
      
      public static function fillTables(param1:Dictionary, param2:Dictionary = null) : void
      {
         var _loc3_:* = null;
         param1["null"] = const_102;
         param1["bound_to_parent_rect"] = const_79;
         param1["child_window"] = const_915;
         param1["embedded_controller"] = const_312;
         param1["resize_to_accommodate_children"] = const_63;
         param1["input_event_processor"] = const_48;
         param1["internal_event_handling"] = const_542;
         param1["mouse_dragging_target"] = const_207;
         param1["mouse_dragging_trigger"] = const_318;
         param1["mouse_scaling_target"] = const_257;
         param1["mouse_scaling_trigger"] = const_354;
         param1["horizontal_mouse_scaling_trigger"] = const_198;
         param1["vertical_mouse_scaling_trigger"] = const_184;
         param1["observe_parent_input_events"] = const_966;
         param1["optimize_region_to_layout_size"] = const_436;
         param1["parent_window"] = const_788;
         param1["relative_horizontal_scale_center"] = const_160;
         param1["relative_horizontal_scale_fixed"] = const_116;
         param1["relative_horizontal_scale_move"] = const_294;
         param1["relative_horizontal_scale_strech"] = const_245;
         param1["relative_scale_center"] = const_806;
         param1["relative_scale_fixed"] = const_585;
         param1["relative_scale_move"] = const_945;
         param1["relative_scale_strech"] = const_892;
         param1["relative_vertical_scale_center"] = const_168;
         param1["relative_vertical_scale_fixed"] = const_112;
         param1["relative_vertical_scale_move"] = const_279;
         param1["relative_vertical_scale_strech"] = const_221;
         param1["on_resize_align_left"] = const_665;
         param1["on_resize_align_right"] = const_422;
         param1["on_resize_align_center"] = const_367;
         param1["on_resize_align_top"] = const_712;
         param1["on_resize_align_bottom"] = const_348;
         param1["on_resize_align_middle"] = const_458;
         param1["on_accommodate_align_left"] = const_913;
         param1["on_accommodate_align_right"] = const_455;
         param1["on_accommodate_align_center"] = const_511;
         param1["on_accommodate_align_top"] = const_857;
         param1["on_accommodate_align_bottom"] = WINDOW_PARAM_ON_ACCOMMODATE_ALIGN_BOTTOM;
         param1["on_accommodate_align_middle"] = const_642;
         param1["route_input_events_to_parent"] = const_442;
         param1["use_parent_graphic_context"] = const_32;
         param1["draggable_with_mouse"] = const_980;
         param1["scalable_with_mouse"] = const_959;
         param1["reflect_horizontal_resize_to_parent"] = const_424;
         param1["reflect_vertical_resize_to_parent"] = const_398;
         param1["reflect_resize_to_parent"] = const_226;
         if(param2 != null)
         {
            for(_loc3_ in param1)
            {
               if(param2[param1[_loc3_]] != null)
               {
                  if(param1[_loc3_] != 0)
                  {
                     Logger.log("Conflictiong flags in window params: \"" + _loc3_ + "\"!");
                  }
               }
               param2[param1[_loc3_]] = _loc3_;
            }
         }
      }
   }
}
