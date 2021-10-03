package com.sulake.core.window.graphics
{
   import com.sulake.core.runtime.IDisposable;
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.enum.WindowParam;
   import com.sulake.core.window.enum.WindowStyle;
   import com.sulake.core.window.graphics.renderer.ISkinRenderer;
   import flash.display.BitmapData;
   import flash.geom.ColorTransform;
   import flash.geom.Matrix;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   
   public class WindowRendererItem implements IDisposable
   {
      
      private static const const_489:uint = 0;
      
      private static const const_759:uint = 1;
      
      private static const const_760:uint = 2;
       
      
      private var var_682:ISkinContainer;
      
      private var _drawBufferAllocator:DrawBufferAllocator;
      
      private var _disposed:Boolean;
      
      private var var_236:Rectangle;
      
      private var var_235:Boolean;
      
      private var var_98:BitmapData;
      
      private var var_866:Matrix;
      
      private var var_139:WindowRenderer;
      
      private var var_1012:uint;
      
      private var _colorTransform:ColorTransform;
      
      private var var_681:uint;
      
      public function WindowRendererItem(param1:WindowRenderer, param2:DrawBufferAllocator, param3:ISkinContainer)
      {
         super();
         _disposed = false;
         var_139 = param1;
         var_682 = param3;
         _drawBufferAllocator = param2;
         var_1012 = 4294967295;
         var_681 = 0;
         _colorTransform = new ColorTransform();
         var_866 = new Matrix();
         var_236 = new Rectangle();
      }
      
      public function get buffer() : BitmapData
      {
         return var_98;
      }
      
      public function invalidate(param1:IWindow, param2:Rectangle, param3:uint) : Boolean
      {
         var _loc4_:Boolean = false;
         switch(param3)
         {
            case WindowRedrawFlag.const_69:
               var_235 = true;
               _loc4_ = true;
               break;
            case WindowRedrawFlag.RESIZE:
               var_235 = true;
               _loc4_ = true;
               break;
            case WindowRedrawFlag.const_473:
               if(param1.testParamFlag(WindowParam.const_32))
               {
                  _loc4_ = true;
               }
               else
               {
                  IGraphicContextHost(param1).getGraphicContext(true).setDrawRegion(param1.rectangle,false);
               }
               break;
            case WindowRedrawFlag.const_841:
               var_681 = var_682.getTheActualState(param1.type,param1.style,param1.state);
               if(var_681 != var_1012)
               {
                  var_235 = true;
                  _loc4_ = true;
               }
               break;
            case WindowRedrawFlag.const_987:
               if(param1.testParamFlag(WindowParam.const_32))
               {
                  var_235 = true;
                  _loc4_ = true;
               }
               else
               {
                  IGraphicContextHost(param1).getGraphicContext(true).blend = param1.blend;
               }
               break;
            case WindowRedrawFlag.const_249:
               _loc4_ = true;
         }
         if(_loc4_)
         {
            var_236.left = Math.min(var_236.left,param2.left);
            var_236.top = Math.min(var_236.top,param2.top);
            var_236.right = Math.max(var_236.right,param2.right);
            var_236.bottom = Math.max(var_236.bottom,param2.bottom);
         }
         return _loc4_;
      }
      
      public function testForStateChange(param1:IWindow) : Boolean
      {
         return var_682.getTheActualState(param1.type,param1.style,param1.state) != var_1012;
      }
      
      public function get dirty() : Rectangle
      {
         return var_236;
      }
      
      public function render(param1:IWindow, param2:Point, param3:Rectangle) : Boolean
      {
         var _loc4_:* = null;
         var _loc10_:* = 0;
         var _loc5_:uint = !!param1.background ? uint(const_760) : uint(const_489);
         var _loc6_:ISkinRenderer = resolveSkinRenderer(param1);
         if(_loc6_ != null)
         {
            _loc5_ = !!_loc6_.isStateDrawable(var_681) ? uint(const_759) : uint(_loc5_);
         }
         var _loc7_:int = Math.max(param1.width,1);
         var _loc8_:int = Math.max(param1.height,1);
         if(_loc5_ != const_489)
         {
            if(var_98 == null)
            {
               var_98 = _drawBufferAllocator.allocate(_loc7_,_loc8_,true,param1.color);
               var_235 = true;
            }
            else if(var_98.width != _loc7_ || var_98.height != _loc8_)
            {
               _drawBufferAllocator.free(var_98);
               var_98 = _drawBufferAllocator.allocate(_loc7_,_loc8_,true,param1.color);
               var_235 = true;
            }
         }
         var _loc9_:IGraphicContext = IGraphicContextHost(param1).getGraphicContext(false);
         if(_loc9_)
         {
            _loc9_.setDrawRegion(param1.rectangle,!param1.testParamFlag(WindowParam.const_32));
         }
         if(_loc5_ != const_489)
         {
            var_1012 = var_681;
            _loc4_ = param1.fetchDrawBuffer() as BitmapData;
            if(_loc4_ != null)
            {
               _loc4_.lock();
               if(_loc5_ == const_759)
               {
                  if(!param1.testParamFlag(WindowParam.const_32))
                  {
                     _loc4_.fillRect(param3,0);
                  }
                  if(var_235)
                  {
                     var_235 = false;
                     var_98.fillRect(var_98.rect,param1.color);
                     _loc6_.draw(param1,var_98,var_98.rect,var_681,false);
                     if(!param1.background)
                     {
                        _loc10_ = uint(param1.color);
                        if((_loc10_ & 16777215) < 16777215)
                        {
                           var_98.colorTransform(_loc4_.rect,new ColorTransform(((_loc10_ & 16711680) >> 16) / 255 * 1,((_loc10_ & 65280) >> 8) / 255 * 1,(_loc10_ & 255) / 255 * 1));
                        }
                     }
                  }
                  if(param1.blend < 1 && param1.testParamFlag(WindowParam.const_32))
                  {
                     var_866.tx = param2.x;
                     var_866.ty = param2.y;
                     _colorTransform.alphaMultiplier = param1.blend;
                     param3.offset(param2.x,param2.y);
                     _loc4_.draw(var_98,var_866,_colorTransform,null,param3,false);
                     param3.offset(-param2.x,-param2.y);
                  }
                  else
                  {
                     _loc4_.copyPixels(var_98,param3,param2,null,null,true);
                  }
               }
               else if(_loc5_ == const_760)
               {
                  if(param1.testParamFlag(WindowParam.const_32))
                  {
                     var_98.fillRect(var_98.rect,param1.color);
                     _loc4_.copyPixels(var_98,param3,param2,null,null,true);
                  }
                  else
                  {
                     _loc4_.fillRect(new Rectangle(param2.x,param2.y,param3.width,param3.height),param1.color);
                     _loc9_.blend = param1.blend;
                  }
               }
               _loc4_.unlock();
            }
            var_236.left = int.MAX_VALUE;
            var_236.top = int.MAX_VALUE;
            var_236.right = int.MIN_VALUE;
            var_236.bottom = int.MIN_VALUE;
         }
         return true;
      }
      
      public function get disposed() : Boolean
      {
         return _disposed;
      }
      
      public function dispose() : void
      {
         if(!_disposed)
         {
            _disposed = true;
            var_139 = null;
            var_682 = null;
            if(var_98 != null)
            {
               _drawBufferAllocator.free(var_98);
               var_98 = null;
            }
         }
      }
      
      private function drawRect(param1:BitmapData, param2:Rectangle, param3:uint) : void
      {
         var _loc4_:int = 0;
         _loc4_ = param2.left;
         while(_loc4_ < param2.right)
         {
            param1.setPixel32(_loc4_,param2.top,param3);
            param1.setPixel32(_loc4_,param2.bottom - 1,param3);
            _loc4_++;
         }
         _loc4_ = param2.top;
         while(_loc4_ < param2.bottom)
         {
            param1.setPixel32(param2.left,_loc4_,param3);
            param1.setPixel32(param2.right - 1,_loc4_,param3);
            _loc4_++;
         }
      }
      
      private function resolveSkinRenderer(param1:IWindow) : ISkinRenderer
      {
         var _loc2_:ISkinRenderer = var_682.getSkinRendererByType(param1.type,param1.style);
         if(_loc2_ == null)
         {
            if(param1.style != WindowStyle.const_944)
            {
               _loc2_ = var_682.getSkinRendererByType(param1.type,WindowStyle.const_944);
            }
         }
         return _loc2_;
      }
   }
}
