class g4.manager.SimplePopupManager
{
   function SimplePopupManager()
   {
   }
   static function getInstance()
   {
      return g4.manager.SimplePopupManager._instance = g4.manager.SimplePopupManager._instance != null?g4.manager.SimplePopupManager._instance:new g4.manager.SimplePopupManager();
   }
   function init(container)
   {
      this._container = container;
      this._simplePopupList = new Array();
      this._simplePopupMap = new Object();
      this._modelBackgroundMap = new Object();
   }
   function declaration()
   {
      g4.simplePopup.model.MaterialItemSlotListSimplePopupModel;
   }
   function showSimplePopup($simplePopupType, $simplePopupModel)
   {
      var _loc10_ = $simplePopupType.fileName;
      var _loc4_ = $simplePopupType.id;
      if(this._simplePopupMap[_loc4_] == null)
      {
         var _loc11_ = g4.util.MovieClipUtil.createModalBackground(this._container,50);
         this._modelBackgroundMap[_loc4_] = _loc11_;
         var _loc5_ = this._container.createEmptyMovieClip(_loc4_,this._container.getNextHighestDepth());
         this._simplePopupList.push(_loc5_);
         this._simplePopupMap[_loc4_] = _loc5_;
         var _loc8_ = new MovieClipLoader();
         var _loc9_ = new Object();
         _loc8_.addListener(_loc9_);
         var _loc12_ = g4.util.UIUtil.isGFxPlayer() != true?"/package/S1UIRES_SimplePopup/":"package/S1UIRES_SimplePopup/";
         _loc8_.loadClip(_loc12_ + _loc10_,_loc5_);
         _loc9_.onLoadInit = function(target)
         {
            var _loc2_ = (g4.simplePopup.ISimplePopup)target.simplePopup;
            var _loc3_ = _loc2_.getAreaSize();
            target._x = (Stage.width - _loc3_.x * lib.info.AlignInfo.scaleRatio) * 0.5;
            target._y = (Stage.height - _loc3_.y * lib.info.AlignInfo.scaleRatio) * 0.5;
            target._xscale = lib.info.AlignInfo.scaleRatio * 100;
            target._yscale = lib.info.AlignInfo.scaleRatio * 100;
            _loc2_.init.apply(_loc2_,[$simplePopupModel]);
         };
      }
      else
      {
         (g4.simplePopup.ISimplePopup)this._simplePopupMap[_loc4_].init($simplePopupModel);
      }
      lib.manager.UISound.play(lib.manager.UISound.UI_OPEN);
      _global.modal = true;
      _root.freezeGame(true);
      _root.lockUI(true);
   }
   function hideSimplePopup($simplePopupType)
   {
      var _loc5_ = $simplePopupType.id;
      var _loc7_ = this._simplePopupMap[_loc5_];
      if(_loc7_ == null)
      {
         return undefined;
      }
      var _loc6_ = this._simplePopupMap[_loc5_].simplePopup;
      var _loc4_ = 0;
      while(_loc4_ < this._simplePopupList.length)
      {
         if((g4.simplePopup.ISimplePopup)this._simplePopupList[_loc4_].simplePopup == _loc6_)
         {
            this._simplePopupList.splice(_loc4_,1);
            break;
         }
         _loc4_ = _loc4_ + 1;
      }
      _loc6_.destroy();
      _loc7_.unloadMovie();
      _loc7_.removeMovieClip();
      this._simplePopupMap[_loc5_] = null;
      delete this._simplePopupMap.register5;
      var _loc8_ = this._modelBackgroundMap[_loc5_];
      _loc8_.removeMovieClip();
      this._modelBackgroundMap[_loc5_] = null;
      delete this._modelBackgroundMap.register5;
      lib.manager.UISound.play(lib.manager.UISound.UI_CLOSE);
      if(this._simplePopupList.length < 1)
      {
         _global.modal = false;
         _root.freezeGame(false);
         _root.lockUI(false);
      }
   }
   function checkShowSimplePopup($simplePopupType)
   {
      var _loc2_ = this._simplePopupMap[$simplePopupType.id] != null;
      return _loc2_;
   }
}
