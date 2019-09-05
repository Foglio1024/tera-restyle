class g4.view.inventory.InventoryPocketItemSlotGroup extends g4.view.inventory.BasicItemSlotGroup
{
   function InventoryPocketItemSlotGroup()
   {
      super();
      g4.view.inventory.InventoryController.getInstance().registerPocketItemSlotGroup(this);
   }
   function configUI()
   {
      super.configUI();
   }
   function createItemSlots(slotLength, slotName)
   {
      super.createItemSlots(slotLength,slotName);
      var _loc6_ = this.SLOTCOLUM * this._totalSlotLineCount;
      var _loc4_ = 0;
      while(_loc4_ < _loc6_)
      {
         var _loc5_ = this._inventoryItemSlots[_loc4_];
         _loc5_.isPocket = true;
         _loc4_ = _loc4_ + 1;
      }
      var _loc7_ = this.mc_lockSlotLine0;
      _loc7_._visible = false;
      this._mc_lockSlotLines = [_loc7_];
      _loc4_ = 0;
      while(_loc4_ < this._totalSlotLineCount)
      {
         var _loc3_ = this._mc_lockSlotLines[_loc4_];
         if(_loc3_ == null)
         {
            _loc3_ = this._mc_lockSlotLines[0].duplicateMovieClip("mc_lockSlotLine" + _loc4_,this.getNextHighestDepth());
            this._mc_lockSlotLines[_loc4_] = _loc3_;
         }
         _loc3_._x = 0;
         _loc3_._y = _loc4_ * 43;
         _loc3_._visible = false;
         _loc3_.mc_bg.onRollOver = function()
         {
         };
         g4.util.MovieClipUtil.nextFrameCall(null,this.addEventListenerLockBtn,[_loc3_.lockBtn],this);
         _loc4_ = _loc4_ + 1;
      }
   }
   function addEventListenerLockBtn(lockBtn)
   {
      lockBtn.addEventListener(gfx.events.EventTypes.CLICK,this,this.onLockBtnClick);
   }
   function onLockBtnClick(lockBtn)
   {
      g4.view.inventory.InventoryController.getInstance().ToGame_Inventory_ClickInventorySlotLockBtn(true);
   }
   function updatePocketLockSlotLine(lockSlotLine)
   {
      var _loc3_ = 0;
      while(_loc3_ < this._totalSlotLineCount)
      {
         var _loc2_ = this._mc_lockSlotLines[_loc3_];
         _loc2_.onEnterFrame = null;
         _loc2_.gotoAndStop(1);
         var _loc4_ = _loc2_.lockBtn;
         if(_loc3_ < this._totalSlotLineCount - lockSlotLine)
         {
            _loc2_._visible = false;
         }
         else if(_loc3_ == this._totalSlotLineCount - lockSlotLine)
         {
            _loc2_._visible = true;
            _loc4_.__set__disabled(false);
         }
         else
         {
            _loc2_._visible = true;
            _loc4_.__set__disabled(true);
         }
         _loc3_ = _loc3_ + 1;
      }
   }
   function unlockSlots()
   {
      var _loc3_ = 0;
      while(_loc3_ < this._mc_lockSlotLines.length)
      {
         var _loc2_ = this._mc_lockSlotLines[_loc3_];
         if(_loc2_._visible == true)
         {
            _loc2_.swapDepths(this.getNextHighestDepth());
            var _loc4_ = this._mc_lockSlotLines[_loc3_ + 1];
            g4.util.MovieClipUtil.playMovieClip(_loc2_,1,_loc2_._totalframes,this.openSlotMotionComplete,[_loc2_,_loc4_],this);
            break;
         }
         _loc3_ = _loc3_ + 1;
      }
   }
   function openSlotMotionComplete(mc_lockSlotLine, next_lockSlotLine)
   {
      mc_lockSlotLine.gotoAndStop(1);
      mc_lockSlotLine._visible = false;
      if(next_lockSlotLine != null)
      {
         var _loc1_ = next_lockSlotLine.lockBtn;
         _loc1_.__set__disabled(false);
      }
   }
}
