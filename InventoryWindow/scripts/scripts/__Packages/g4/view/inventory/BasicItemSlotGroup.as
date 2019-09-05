class g4.view.inventory.BasicItemSlotGroup extends g4.core.G4UIComponent
{
   var SLOTCOLUM = 8;
   function BasicItemSlotGroup()
   {
      super();
   }
   function configUI()
   {
      var _loc2_ = this.inventoryItemSlot0;
      this._inventoryItemSlots = [_loc2_];
   }
   function createItemSlots(slotLength, slotName)
   {
      this._totalSlotLineCount = slotLength;
      var _loc4_ = this.SLOTCOLUM * this._totalSlotLineCount;
      var _loc5_ = undefined;
      var _loc3_ = 0;
      while(_loc3_ < _loc4_)
      {
         var _loc2_ = this._inventoryItemSlots[_loc3_];
         if(_loc2_ == null)
         {
            _loc2_ = (g4.view.inventory.InventoryItemSlot)(g4.view.inventory.InventoryItemSlot)this._inventoryItemSlots[0].duplicateMovieClip("inventoryItemSlot" + _loc3_,this.getNextHighestDepth());
            this._inventoryItemSlots[_loc3_] = _loc2_;
         }
         _loc2_.index = _loc3_;
         _loc2_.SLOT_NAME = slotName;
         _loc2_.setDragSlotName(_loc3_);
         _loc2_._x = _loc3_ % this.SLOTCOLUM * 43;
         _loc2_._y = Math.floor(_loc3_ / this.SLOTCOLUM) * 43;
         _loc5_ = _loc2_._y + 40;
         _loc3_ = _loc3_ + 1;
      }
   }
   function updateItemSlots(inventoryItemSlotPs)
   {
      var _loc3_ = 0;
      while(_loc3_ < inventoryItemSlotPs.length)
      {
         var _loc2_ = inventoryItemSlotPs[_loc3_];
         var _loc4_ = this._inventoryItemSlots[_loc2_.itemSlotP.Index];
         if(_loc2_.itemSlotP.Id == "")
         {
            _loc4_.showItemSlot(null);
         }
         else
         {
            _loc4_.showItemSlot(_loc2_);
         }
         _loc3_ = _loc3_ + 1;
      }
   }
   function clearItemSlots()
   {
      var _loc2_ = 0;
      while(_loc2_ < this._inventoryItemSlots.length)
      {
         var _loc3_ = this._inventoryItemSlots[_loc2_];
         _loc3_.showItemSlot(null);
         _loc2_ = _loc2_ + 1;
      }
   }
   function setToggle(indexs, bTrue)
   {
      var _loc2_ = 0;
      while(_loc2_ < indexs.length)
      {
         var _loc4_ = indexs[_loc2_];
         var _loc3_ = this._inventoryItemSlots[_loc4_];
         if(bTrue == true)
         {
            _loc3_.showActive();
         }
         else
         {
            _loc3_.hideActive();
         }
         _loc2_ = _loc2_ + 1;
      }
   }
   function showItemCoolTime(itemIndexs, remain, total)
   {
      var _loc2_ = 0;
      while(_loc2_ < itemIndexs.length)
      {
         var _loc3_ = itemIndexs[_loc2_];
         var _loc4_ = this._inventoryItemSlots[_loc3_];
         _loc4_.showItemCoolTime(remain,total);
         _loc2_ = _loc2_ + 1;
      }
   }
   function sealItem(index, sealType)
   {
      var _loc2_ = this._inventoryItemSlots[index];
      _loc2_.sealItem(sealType);
   }
   function unsealItem(index, unsealType)
   {
      var _loc2_ = this._inventoryItemSlots[index];
      _loc2_.unsealItem(unsealType);
   }
   function setRemoveEffect(index)
   {
      var _loc2_ = this._inventoryItemSlots[index];
      _loc2_.setRemoveEffect();
   }
   function setGemstoneEffect(data)
   {
      var _loc2_ = 0;
      while(_loc2_ < data.length)
      {
         var _loc3_ = data[_loc2_];
         var _loc5_ = Number(_loc3_[0]);
         var _loc4_ = _loc3_[1];
         var _loc6_ = this._inventoryItemSlots[_loc5_];
         _loc6_.setGemstoneEffect(_loc4_);
         _loc2_ = _loc2_ + 1;
      }
   }
   function hideNewSymbol(index)
   {
      var _loc2_ = this._inventoryItemSlots[index];
      _loc2_.hideNewSymbol();
   }
}
