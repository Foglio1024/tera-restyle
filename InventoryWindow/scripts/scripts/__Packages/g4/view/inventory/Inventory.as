class g4.view.inventory.Inventory extends g4.core.View
{
   function Inventory($targetMovie)
   {
      super($targetMovie);
      g4.view.inventory.InventoryController.getInstance().registerInventory(this);
      this._inventoryModel = g4.view.inventory.InventoryController.getInstance().inventoryModel;
   }
   function getUIName()
   {
      return g4.view.ViewID.INVENTORY;
   }
   function __get__container_mc()
   {
      return this._container_mc;
   }
   function configGameInterface()
   {
      g4.view.inventory.InventoryController.getInstance().registerGameInterfaces(g4.util.Delegate.create(this,this.registerGameInterface));
   }
   function configUI()
   {
      this._container_mc = this.__get__targetMovieClip().container_mc;
      this._tf_title = this._container_mc.tf_title;
      this.UIDrager = this._container_mc.UIDrager;
      this.UIDrager.setData(this.getUIName(),this.__get__container_mc(),this.__get__container_mc().lock_mc);
      this._closeBtn = this._container_mc.closeBtn;
      this._pocketBtn = this._container_mc.pocketBtn;
      this._filterToggleBtn = this._container_mc.filterToggleBtn;
      this._mc_pocketCount = this._container_mc.mc_pocketCount;
      this._inventoryPocket = this._container_mc.inventoryPocket;
      this._scaleExpander2 = this._container_mc.scaleExpander2;
      this._inventoryFilterGroup = (g4.view.inventory.InventoryFilterGroup)this._container_mc.inventoryFilterGroup;
      this._inventoryExtBtnGroup = (g4.view.inventory.InventoryExtBtnGroup)this._container_mc.inventoryExtBtnGroup;
      this._inventoryWalletGroup = (g4.view.inventory.InventoryWalletGroup)this._container_mc.inventoryWalletGroup;
      this._inventoryItemSlotGroup = (g4.view.inventory.InventoryItemSlotGroup)this._container_mc.inventoryItemSlotGroup;
      this._str_pocketBtnShow = lib.util.UIString.getUIString("$071021");
      this._str_pocketBtnHide = lib.util.UIString.getUIString("$071022");
      this._str_pocketBtnDisabled = lib.util.UIString.getUIString("$071023");
      this._pocketBtn.isInteractionToggle = false;
      this._filterToggleBtn.addEventListener(gfx.events.EventTypes.CLICK,this,this.onFilterToggleBtnClick);
      this._closeBtn.addEventListener(gfx.events.EventTypes.CLICK,this,function()
      {
         g4.view.inventory.InventoryController.getInstance().ToGame_RequestCloseUI(this.getUIName());
      }
      );
      this._pocketBtn.addEventListener(gfx.events.EventTypes.CLICK,this,function()
      {
         g4.manager.TooltipManager.getInstance().hideTooltip();
         g4.view.inventory.InventoryController.getInstance().ToGame_Inventory_ClickPocketBtn();
      }
      );
      g4.view.inventory.InventoryController.getInstance().ToGame_InitUI(this.getUIName());
      this._targetMovieClip._visible = false;
      this._inventoryPocket._visible = false;
      this._targetMovieClip.scaleExpander.scaleExpanderEventCheck(this.__get__targetMovieClip(),this.getUIName());
      this._str_title = lib.util.UIString.getUIString("$051001");
      this._tf_title.text = this._str_title;
      this._toggleMoveGroup = [this._filterToggleBtn,this._inventoryItemSlotGroup,this._inventoryExtBtnGroup,this._inventoryWalletGroup,this._scaleExpander2,this._targetMovieClip.scaleExpander];
      this._toggleMoveGroupOriginY = [];
      var _loc2_ = 0;
      while(_loc2_ < this._toggleMoveGroup.length)
      {
         var _loc3_ = this._toggleMoveGroup[_loc2_];
         this._toggleMoveGroupOriginY[_loc2_] = _loc3_._y;
         _loc2_ = _loc2_ + 1;
      }
   }
   function toggleFilterGroup(isOpen)
   {
      this._inventoryFilterGroup._visible = isOpen;
      if(isOpen == true)
      {
         this._filterToggleBtn.mc_arrow.gotoAndStop(1);
         this._container_mc.hit._height = 871;
         this._container_mc.mc_bg._height = 871;
         this._container_mc.mc_bg2._height = 733;
         this._targetMovieClip.hit._height = 871;
      }
      else
      {
         this._filterToggleBtn.mc_arrow.gotoAndStop(2);
         this._container_mc.hit._height = 807;
         this._container_mc.mc_bg._height = 807;
         this._container_mc.mc_bg2._height = 669;
         this._targetMovieClip.hit._height = 807;
      }
      var _loc2_ = 0;
      while(_loc2_ < this._toggleMoveGroup.length)
      {
         var _loc3_ = this._toggleMoveGroup[_loc2_];
         _loc3_._y = isOpen != true?this._toggleMoveGroupOriginY[_loc2_] - 64:this._toggleMoveGroupOriginY[_loc2_];
         _loc2_ = _loc2_ + 1;
      }
   }
   function showInventoryPocket(isShow)
   {
      this._pocketBtn.__set__selected(isShow);
      this._inventoryPocket._visible = isShow;
      this._mc_pocketCount._visible = !this._inventoryPocket._visible && Number(this._mc_pocketCount.tf_count.text) > 0;
      var _loc2_ = isShow != false?310:0;
      var _loc5_ = lib.info.AlignInfo.uiScale(this.getUIName(),this._container_mc);
      var _loc3_ = _loc2_ * (lib.info.AlignInfo.scaleRatio * _loc5_);
      this.UIDrager.adjustDragLimit(_loc2_,0,0,0);
      if(this._targetMovieClip._x < _loc3_)
      {
         this._targetMovieClip._x = _loc3_;
      }
      this.setPocketBtnTooltip();
   }
   function setPocketBtnTooltip()
   {
      g4.manager.TooltipManager.getInstance().removeTooltip(this._pocketBtn);
      var _loc2_ = undefined;
      if(this._pocketBtn.__get__disabled() == true)
      {
         _loc2_ = this._str_pocketBtnDisabled;
      }
      else if(this._pocketBtn.__get__selected() == false)
      {
         _loc2_ = this._str_pocketBtnShow;
      }
      else
      {
         _loc2_ = this._str_pocketBtnHide;
      }
      g4.manager.TooltipManager.getInstance().addMessageTooltip(this._pocketBtn,_loc2_);
   }
   function updatePocketCount(total)
   {
      this._mc_pocketCount.tf_count.text = total;
      this._mc_pocketCount._visible = !this._inventoryPocket._visible && Number(this._mc_pocketCount.tf_count.text) > 0;
   }
   function showInventoryCount(hasNum, maxNum)
   {
      this._tf_title.text = this._str_title + "(" + hasNum + "/" + maxNum + ")";
   }
   function updatePocketBtnDisabled(disabled)
   {
      this._pocketBtn.__set__disabled(disabled);
      this.setPocketBtnTooltip();
   }
   function onFilterToggleBtnClick()
   {
      lib.manager.UISound.play("4004");
      g4.view.inventory.InventoryController.getInstance().ToGame_Inventory_ClickFilterToggleBtn();
   }
}
