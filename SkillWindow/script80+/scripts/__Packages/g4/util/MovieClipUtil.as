class g4.util.MovieClipUtil
{
   function MovieClipUtil()
   {
   }
   static function playMovieClip(movieClip, startFrame, targetFrame, callback, callbackParams)
   {
      if(startFrame == null && Number(startFrame) == -1 && String(startFrame) == "")
      {
         startFrame = movieClip._currentframe;
      }
      if(targetFrame == null && Number(targetFrame) == -1 && String(targetFrame) == "")
      {
         targetFrame = movieClip._totalframes;
      }
      var _loc1_ = Number(startFrame);
      var num_targetFrame = Number(targetFrame);
      movieClip.onEnterFrame = null;
      if(isNaN(num_targetFrame) == true)
      {
         movieClip.gotoAndStop(targetFrame);
         num_targetFrame = movieClip._currentframe;
      }
      if(isNaN(_loc1_) == true)
      {
         movieClip.gotoAndStop(startFrame);
         _loc1_ = movieClip._currentframe;
      }
      movieClip.gotoAndStop(_loc1_);
      if(_loc1_ == num_targetFrame)
      {
         return undefined;
      }
      var isReverse = num_targetFrame == 1 || _loc1_ > num_targetFrame;
      movieClip.onEnterFrame = function()
      {
         if(isReverse == true)
         {
            movieClip.prevFrame();
         }
         else
         {
            movieClip.nextFrame();
         }
         if(movieClip._currentframe == num_targetFrame || movieClip._currentframe == 1 || movieClip._currentframe == movieClip._totalframes)
         {
            movieClip.onEnterFrame = null;
            callback.apply(null,callbackParams);
         }
      };
   }
   static function nextFrameCall(movieClip, callback, callbackParams, scope)
   {
      if(movieClip.onEnterFrame != null)
      {
         return false;
      }
      movieClip.onEnterFrame = function()
      {
         movieClip.onEnterFrame = null;
         callback.apply(scope,callbackParams);
      };
      return true;
   }
   static function loadClip(url, container, callback, callbackParams, scope)
   {
      if(scope == null)
      {
         scope = container;
      }
      var _loc2_ = new Object();
      var _loc1_ = new MovieClipLoader();
      _loc1_.addListener(_loc2_);
      _loc1_.loadClip(url,container);
      _loc2_.onLoadInit = function(mc)
      {
         if(container != null)
         {
            if(callbackParams == null)
            {
               callbackParams = new Array();
            }
            callbackParams.push(mc);
            callback.apply(scope,callbackParams);
         }
      };
   }
   static function checkHadRoot(mc)
   {
      if(mc._parent == undefined)
      {
         return mc != _root?false:true;
      }
      return g4.util.MovieClipUtil.checkHadRoot(mc._parent);
   }
   static function createModalBackground(container, alpha, depth)
   {
      if(depth == null)
      {
         depth = container.getNextHighestDepth();
      }
      if(alpha == null)
      {
         alpha = 50;
      }
      var _loc1_ = container.createEmptyMovieClip("modalBackground",depth);
      _loc1_.beginFill(0,alpha);
      _loc1_.moveTo(0,-200);
      _loc1_.lineTo(0,Stage.height);
      _loc1_.lineTo(Stage.width,Stage.height + Stage.height * 0.5);
      _loc1_.lineTo(Stage.width,-200);
      _loc1_.endFill();
      _loc1_.tabEnabled = false;
      _loc1_.useHandCursor = false;
      _loc1_.onRelease = function()
      {
      };
      return _loc1_;
   }
}
