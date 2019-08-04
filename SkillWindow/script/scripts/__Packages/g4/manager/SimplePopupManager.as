class g4.manager.SimplePopupManager implements g4.gameInterface.ISimplePopupManager
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
      this._keyListener = new Object();
      this._keyListener.onKeyUp = g4.util.Delegate.create(this,this.onKeyUp);
      this.registerGameInterfaces();
   }
   function registerGameInterfaces()
   {
      g4.model.GameInterface.registerGameInterface("OnGame_SimplePopup_Show",g4.util.Delegate.create(this,this.OnGame_SimplePopup_Show));
      g4.model.GameInterface.registerGameInterface("OnGame_SimplePopup_Hide",g4.util.Delegate.create(this,this.OnGame_SimplePopup_Hide));
   }
   function OnGame_SimplePopup_Show($simplePopupType, $simplePopupP)
   {
      var _loc2_ = g4.simplePopup.SimplePopupType.parse($simplePopupType);
      var _loc3_ = g4.util.JSON.parse($simplePopupP);
      this.showSimplePopup(_loc2_,_loc3_);
   }
   function OnGame_SimplePopup_Hide($simplePopupType, $id)
   {
      var _loc2_ = g4.simplePopup.SimplePopupType.parse($simplePopupType);
      this.hideSimplePopup(_loc2_,$id);
   }
   function showSimplePopup(simplePopupType, simplePopupP)
   {
      Debug.log("g4.manager.SimplePopupManager.showSimplePopup > simplePopupType : " + simplePopupType + ", simplePopupP : " + simplePopupP);
      var _loc13_ = !(simplePopupP.Id == null || simplePopupP.Id == undefined)?simplePopupP.Id:"";
      var _loc11_ = simplePopupType.fileName;
      var _loc4_ = simplePopupType.id + "_" + _loc13_;
      if(this._simplePopupMap[_loc4_] == null)
      {
         var _loc8_ = g4.util.MovieClipUtil.createModalBackground(this._container,50);
         _loc8_._y = _loc8_._y - 60;
         this._modelBackgroundMap[_loc4_] = _loc8_;
         var _loc6_ = this._container.createEmptyMovieClip(_loc4_,this._container.getNextHighestDepth());
         this._simplePopupList.push(_loc6_);
         this._simplePopupMap[_loc4_] = _loc6_;
         var _loc9_ = new MovieClipLoader();
         var _loc10_ = new Object();
         _loc9_.addListener(_loc10_);
         var _loc14_ = "/package/S1UIRES_SimplePopup/";
         _loc9_.loadClip(_loc14_ + _loc11_,_loc6_);
         _loc10_.onLoadInit = function(target)
         {
            var _loc2_ = (g4.simplePopup.ISimplePopup)target.simplePopup;
            var _loc3_ = _loc2_.getAreaSize();
            target._x = (Stage.width - _loc3_.x * lib.info.AlignInfo.scaleRatio) * 0.5;
            target._y = (Stage.height - _loc3_.y * lib.info.AlignInfo.scaleRatio) * 0.5;
            target._xscale = lib.info.AlignInfo.scaleRatio * 100;
            target._yscale = lib.info.AlignInfo.scaleRatio * 100;
            target._y = target._y - 60;
            _loc2_.init.apply(_loc2_,[simplePopupP]);
         };
      }
      else
      {
         (g4.simplePopup.ISimplePopup)this._simplePopupMap[_loc4_].init(simplePopupP);
      }
      lib.manager.UISound.play(lib.manager.UISound.UI_OPEN);
      _global.modal = true;
      _root.freezeGame(true);
      _root.lockUI(true);
      Key.addListener(this._keyListener);
   }
   function hideSimplePopup(simplePopupType, id)
   {
      Debug.log("g4.manager.SimplePopupManager.hideSimplePopup > simplePopupType : " + simplePopupType + ", id : " + id);
      if(id == null || id == undefined)
      {
         id = "";
      }
      var _loc5_ = simplePopupType.id + "_" + id;
      var _loc8_ = this._simplePopupMap[_loc5_];
      if(_loc8_ == null)
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
      _loc8_.unloadMovie();
      _loc8_.removeMovieClip();
      this._simplePopupMap[_loc5_] = null;
      delete this._simplePopupMap.register5;
      var _loc9_ = this._modelBackgroundMap[_loc5_];
      _loc9_.removeMovieClip();
      this._modelBackgroundMap[_loc5_] = null;
      delete this._modelBackgroundMap.register5;
      lib.manager.UISound.play(lib.manager.UISound.UI_CLOSE);
      if(this._simplePopupList.length < 1)
      {
         _global.modal = false;
         _root.freezeGame(false);
         _root.lockUI(false);
         Key.removeListener(this._keyListener);
      }
   }
   function checkShowSimplePopup($simplePopupType)
   {
      var _loc2_ = this._simplePopupMap[$simplePopupType.id] != null;
      return _loc2_;
   }
   function onKeyUp()
   {
      var _loc2_ = Key.getCode();
      trace("keyCode : " + _loc2_);
      var _loc3_ = (g4.simplePopup.ISimplePopup)this._simplePopupList[this._simplePopupList.length - 1].simplePopup;
      if(_loc2_ == 13)
      {
         _loc3_.onEnterKeyUp();
      }
      else if(_loc2_ == 27)
      {
         _loc3_.onEscKeyUp();
      }
   }
}
