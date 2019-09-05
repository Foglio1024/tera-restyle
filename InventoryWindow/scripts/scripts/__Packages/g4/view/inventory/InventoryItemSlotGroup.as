class g4.view.inventory.InventoryItemSlotGroup extends g4.view.inventory.BasicItemSlotGroup
{
   function InventoryItemSlotGroup()
   {
      super();
      g4.view.inventory.InventoryController.getInstance().registerInventoryItemSlotGroup(this);
   }
   function configUI()
   {
      super.configUI();
   }
   function setSlotLine(slotLineCount)
   {
      this._activeSlotLineCount = slotLineCount;
      if(this._inventorySlotLineLocks == null)
      {
         this._inventorySlotLineLocks = [];
      }
      var _loc3_ = 0;
      while(_loc3_ < this._totalSlotLineCount)
      {
         var _loc2_ = this._inventorySlotLineLocks[_loc3_];
         if(_loc2_ == null)
         {
            _loc2_ = this.attachMovie("InventorySlotLineLock","inventorySlotLineLock" + _loc3_,this.getNextHighestDepth());
            _loc2_._y = 43 * _loc3_;
            _loc2_.mc_bg.onRelease = function()
            {
            };
            this._inventorySlotLineLocks[_loc3_] = _loc2_;
         }
         if(_loc3_ >= this._activeSlotLineCount)
         {
            _loc2_._visible = true;
            var _loc4_ = _loc2_.lockBtn;
            _loc4_.__set__disabled(_loc3_ > this._activeSlotLineCount);
         }
         else
         {
            _loc2_._visible = false;
         }
         _loc3_ = _loc3_ + 1;
      }
      g4.util.MovieClipUtil.nextFrameCall(null,this.addEventListenerLockBtn,null,this);
   }
   function addEventListenerLockBtn()
   {
      var _loc2_ = 0;
      while(_loc2_ < this._totalSlotLineCount)
      {
         var _loc3_ = this._inventorySlotLineLocks[_loc2_];
         if(_loc3_ != null)
         {
            var _loc4_ = _loc3_.lockBtn;
            _loc4_.addEventListener(gfx.events.EventTypes.CLICK,this,this.onLockBtnClick);
            _loc4_.__set__disabled(_loc2_ != this._activeSlotLineCount);
         }
         _loc2_ = _loc2_ + 1;
      }
   }
   function unlockSlots()
   {
      var _loc3_ = 0;
      while(_loc3_ < this._inventorySlotLineLocks.length)
      {
         var _loc2_ = this._inventorySlotLineLocks[_loc3_];
         if(_loc2_._visible == true)
         {
            _loc2_.swapDepths(this.getNextHighestDepth());
            var _loc4_ = this._inventorySlotLineLocks[_loc3_ + 1];
            g4.util.MovieClipUtil.playMovieClip(_loc2_,1,_loc2_._totalframes,this.openSlotMotionComplete,[_loc2_,_loc4_],this);
            break;
         }
         _loc3_ = _loc3_ + 1;
      }
   }
   function openSlotMotionComplete(mc_inventorySlotLineLock, next_inventorySlotLineLock)
   {
      mc_inventorySlotLineLock.gotoAndStop(1);
      mc_inventorySlotLineLock._visible = false;
      if(next_inventorySlotLineLock != null)
      {
         var _loc1_ = next_inventorySlotLineLock.lockBtn;
         _loc1_.__set__disabled(false);
      }
   }
   function onLockBtnClick(lockBtn)
   {
      g4.view.inventory.InventoryController.getInstance().ToGame_Inventory_ClickInventorySlotLockBtn(false);
   }
}
