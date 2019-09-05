class g4.view.inventory.InventoryItemSlot extends g4.component.G4Button
{
   var SLOT_NAME = "inven__";
   var SLOT_RESIZE = 69.0909090909091;
   function InventoryItemSlot()
   {
      super();
   }
   function __get__inventoryItemSlotP()
   {
      return this._inventoryItemSlotP;
   }
   function configUI()
   {
      super.configUI();
      this._itemSlot = this.itemSlot;
      this._mc_over = this.mc_over;
      this._mc_new = this.mc_new;
      this._mc_active = this.mc_active;
      this._mc_filter = this.mc_filter;
      this._mc_searchResult = this.mc_searchResult;
      this._mc_over._visible = false;
      this._mc_new._visible = false;
      this._mc_active._visible = false;
      this._mc_filter._visible = false;
      this._mc_searchResult._visible = false;
      this.btnName = "INVENSLOTBTN";
      this.addEventListener(gfx.events.EventTypes.CLICK,this,this.onItemSlotClick);
      this.addEventListener(gfx.events.EventTypes.DRAG_OUT,this,this.onItemSlotDragOut);
      g4.manager.MouseEventManager.getInstance().addTargetEventListener(this,g4.manager.MouseEventManager.RIGHT_BUTTON_CLICK,this,this.onRightButtonClick);
      g4.manager.MouseEventManager.getInstance().addEventListener(g4.manager.MouseEventManager.MOUSE_MOVE,this,this.onMouseEventMove);
      if(this._inventoryItemSlotP != null)
      {
         this.showItemSlot(this._inventoryItemSlotP);
      }
   }
   function onMouseEventMove(target)
   {
      this._mc_over._visible = target == this;
   }
   function showItemSlot(inventoryItemSlotP)
   {
      this._inventoryItemSlotP = inventoryItemSlotP;
      if(this._isConfigUIComplete == false)
      {
         return undefined;
      }
      this.showItemCoolTime(0,0);
      if(inventoryItemSlotP == null)
      {
         this._itemSlot.setData(null);
         this._itemSlot.updateSlot();
         g4.manager.TooltipManager.getInstance().hideTooltip(this);
         g4.manager.TooltipManager.getInstance().removeTooltip(this);
         this._mc_new._visible = false;
         this._mc_filter._visible = false;
         this._mc_searchResult._visible = false;
      }
      else
      {
         this._itemSlot.setData(this._inventoryItemSlotP.itemSlotP);
         this._itemSlot.updateSlot();
         var _loc3_ = this.isPocket != true?0:1;
         g4.manager.TooltipManager.getInstance().removeTooltip(this);
         g4.manager.TooltipManager.getInstance().addUiTooltip(g4.view.ViewID.INVENTORY,this,this._inventoryItemSlotP.itemSlotP.Index,_loc3_);
         this._mc_new._visible = inventoryItemSlotP.IsNew;
         this._mc_filter._visible = inventoryItemSlotP.IsFilter;
         this._mc_searchResult._visible = inventoryItemSlotP.IsSearchResult;
      }
   }
   function showActive()
   {
      this._mc_active.gotoAndPlay(2);
      this._mc_active._visible = true;
   }
   function hideActive()
   {
      this._mc_active.stop();
      this._mc_active._visible = false;
   }
   function setDragSlotName(index)
   {
      this.$dragSlotName = this.SLOT_NAME + index;
   }
   function showItemCoolTime(remain, total)
   {
      if(remain <= 0 || total <= 0)
      {
         if(this._coolAniMc != null && this._coolAniMc.coolTime != undefined)
         {
            lib.util.CoolTimeManger.getInstance().removeCoolTimeInstance(this._coolAniMc);
            this._coolAniMc.removeMovieClip();
            this._coolAniMc = null;
         }
      }
      else
      {
         if(this._coolAniMc == null)
         {
            this._coolAniMc = this.attachMovie("coolTimeAni","coolTimeAni",this.getNextHighestDepth());
            this._coolAniMc._xscale = this._coolAniMc._yscale = 76;
            this._coolAniMc.hitTestDisable = true;
         }
         this._coolAniMc.setCoolTime(remain,total);
         lib.util.CoolTimeManger.getInstance().addCoolTimeInstance(this._coolAniMc);
      }
      this._mc_new.swapDepths(this.getNextHighestDepth());
   }
   function sealItem(sealType)
   {
      var effectMc;
      if(sealType == 1)
      {
         effectMc = this.attachMovie("effect_seal","effect_seal",this.getNextHighestDepth());
      }
      else if(sealType == 2)
      {
         effectMc = this.attachMovie("effect_seal_ancient","effect_seal_ancient",this.getNextHighestDepth());
      }
      effectMc._x = 21;
      effectMc._y = 17;
      effectMc._xscale = effectMc._yscale = this.SLOT_RESIZE;
      lib.util.FrameSeeker.seek(effectMc,1,effectMc._totalframes,function()
      {
         effectMc.removeMovieClip();
      }
      );
   }
   function unsealItem(unsealType)
   {
      var effectMc;
      if(unsealType == 1)
      {
         effectMc = this.attachMovie("effect_unseal","effect_unseal",this.getNextHighestDepth());
         effectMc._x = 10;
      }
      else if(unsealType == 2)
      {
         effectMc = this.attachMovie("effect_unseal_ancient","effect_unseal_ancient",this.getNextHighestDepth());
         effectMc._x = 10;
      }
      else if(unsealType == 3)
      {
         effectMc = this.attachMovie("effect_enchant","effect_enchant",this.getNextHighestDepth());
         effectMc._x = 2;
         effectMc._y = 2;
      }
      effectMc._xscale = effectMc._yscale = this.SLOT_RESIZE;
      lib.util.FrameSeeker.seek(effectMc,1,effectMc._totalframes,function()
      {
         effectMc.removeMovieClip();
      }
      );
   }
   function setRemoveEffect()
   {
      this._mc_new._visible = false;
      this.showItemCoolTime(0,0);
      this.hideActive();
      var removeEffect = this.attachMovie("removeEffect","removeEffect",this.getNextHighestDepth());
      removeEffect._x = 0;
      removeEffect._y = 0;
      removeEffect._xscale = removeEffect._yscale = this.SLOT_RESIZE;
      lib.display.DrawBitmapData.draw(removeEffect.removeSlot,this._inventoryItemSlotP.itemSlotP.IconPath,2,2,0,0,50,50,0.77);
      lib.util.FrameSeeker.seek(removeEffect,1,removeEffect._totalframes,function()
      {
         removeEffect.removeMovieClip();
      }
      );
   }
   function setGemstoneEffect(bFlag)
   {
      if(bFlag)
      {
         if(this._gameStoneAni == null)
         {
            this._gameStoneAni = this.attachMovie("GameStoneAni","GameStoneAni",this.getNextHighestDepth());
         }
      }
      else if(this._gameStoneAni != null)
      {
         this._gameStoneAni.removeMovieClip();
         this._gameStoneAni = null;
      }
   }
   function hideNewSymbol()
   {
      this._inventoryItemSlotP.IsNew = false;
      this._mc_new._visible = false;
   }
   function onRightButtonClick()
   {
      var _loc2_ = this.SLOT_NAME + this.index;
      g4.view.inventory.InventoryController.getInstance().ToGame_InventoryWindow_RightClickSlot(_loc2_);
   }
   function onItemSlotClick()
   {
      if(this._inventoryItemSlotP == null)
      {
         return undefined;
      }
      if(_global.control)
      {
         if(this.isPocket == true)
         {
            _root.ToGame_CTRLMouseDown(g4.view.ViewID.INVENTORY,this._inventoryItemSlotP.itemSlotP.Index + "\tpocket");
         }
         else
         {
            _root.ToGame_CTRLMouseDown(g4.view.ViewID.INVENTORY,this._inventoryItemSlotP.itemSlotP.Index);
         }
      }
      else if(_root.bSelectSlotMode)
      {
         g4.view.inventory.InventoryController.getInstance().ToGame_InventoryWindow_LeftClickSlot(this.SLOT_NAME + this._inventoryItemSlotP.itemSlotP.Index);
      }
   }
   function onItemSlotDragOut()
   {
      if(this._inventoryItemSlotP == null || _root.gbDraggingTile)
      {
         return undefined;
      }
      _global.StartIconDrag(this,this._inventoryItemSlotP.itemSlotP.IconPath);
   }
}
