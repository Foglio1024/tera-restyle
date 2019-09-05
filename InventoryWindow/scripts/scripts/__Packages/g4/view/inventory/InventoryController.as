class g4.view.inventory.InventoryController implements g4.view.inventory.IInventory
{
   function InventoryController()
   {
      this._inventoryModel = new g4.view.inventory.InventoryModel();
   }
   static function getInstance()
   {
      return g4.view.inventory.InventoryController._instance = g4.view.inventory.InventoryController._instance != null?g4.view.inventory.InventoryController._instance:new g4.view.inventory.InventoryController();
   }
   function __get__inventoryModel()
   {
      return this._inventoryModel;
   }
   function registerInventory(inventory)
   {
      this._inventory = inventory;
   }
   function registerInventoryFilterGroup(inventoryFilterGroup)
   {
      this._inventoryFilterGroup = inventoryFilterGroup;
   }
   function registerInventoryExtBtnGroup(inventoryExtBtnGroup)
   {
      this._inventoryExtBtnGroup = inventoryExtBtnGroup;
   }
   function registerInventoryWalletGroup(inventoryWalletGroup)
   {
      this._inventoryWalletGroup = inventoryWalletGroup;
   }
   function registerInventoryItemSlotGroup(inventoryItemSlotGroup)
   {
      this._inventoryItemSlotGroup = inventoryItemSlotGroup;
   }
   function registerPocketItemSlotGroup(inventoryPocketItemSlotGroup)
   {
      this._inventoryPocketItemSlotGroup = inventoryPocketItemSlotGroup;
   }
   function registerInventoryPocket(inventoryPocket)
   {
      this._inventoryPocket = inventoryPocket;
   }
   function registerGameInterfaces(registerGameInterface)
   {
      registerGameInterface("OnGameEventShowWindow",g4.util.Delegate.create(this,this.OnGameEventShowWindow));
      registerGameInterface("OnGameEventChangeUIMode",g4.util.Delegate.create(this,this.OnGameEventChangeUIMode));
      registerGameInterface("OnGameEventSetInvenMoney",g4.util.Delegate.create(this,this.OnGameEventSetInvenMoney));
      registerGameInterface("OnGame_InventoryWindow_SetSlotLine",g4.util.Delegate.create(this,this.OnGame_InventoryWindow_SetSlotLine));
      registerGameInterface("OnGame_InventoryWindow_SetItemCoolTime",g4.util.Delegate.create(this,this.OnGame_InventoryWindow_SetItemCoolTime));
      registerGameInterface("OnGame_InventoryWindow_UnsealItem",g4.util.Delegate.create(this,this.OnGame_InventoryWindow_UnsealItem));
      registerGameInterface("OnGame_InventoryWindow_SealItem",g4.util.Delegate.create(this,this.OnGame_InventoryWindow_SealItem));
      registerGameInterface("OnGame_InventoryWindow_HideNewSymbol",g4.util.Delegate.create(this,this.OnGame_InventoryWindow_HideNewSymbol));
      registerGameInterface("OnGame_InventoryWindow_SetCharacterName",g4.util.Delegate.create(this,this.OnGame_InventoryWindow_SetCharacterName));
      registerGameInterface("OnGame_InventoryWindow_SetToggle",g4.util.Delegate.create(this,this.OnGame_InventoryWindow_SetToggle));
      registerGameInterface("OnGame_InventoryWindow_SetGemstoneEffect",g4.util.Delegate.create(this,this.OnGame_InventoryWindow_SetGemstoneEffect));
      registerGameInterface("OnGame_InventoryWindow_SetRemoveEffect",g4.util.Delegate.create(this,this.OnGame_InventoryWindow_SetRemoveEffect));
      registerGameInterface("OnGame_InventoryWindow_Pocket_Visible",g4.util.Delegate.create(this,this.OnGame_InventoryWindow_Pocket_Visible));
      registerGameInterface("OnGame_InventoryWindow_UpdateItems",g4.util.Delegate.create(this,this.OnGame_InventoryWindow_UpdateItems));
      registerGameInterface("OnGame_InventoryWindow_ClearItems",g4.util.Delegate.create(this,this.OnGame_InventoryWindow_ClearItems));
      registerGameInterface("OnGame_InventoryWindow_SelectedPocketTabIndex",g4.util.Delegate.create(this,this.OnGame_InventoryWindow_SelectedPocketTabIndex));
      registerGameInterface("OnGame_InventoryWindow_ShowPocketTabCount",g4.util.Delegate.create(this,this.OnGame_InventoryWindow_ShowPocketTabCount));
      registerGameInterface("OnGame_InventoryWindow_UpdatePocketTabNames",g4.util.Delegate.create(this,this.OnGame_InventoryWindow_UpdatePocketTabNames));
      registerGameInterface("OnGame_InventoryWindow_UpdateFilterGroup1",g4.util.Delegate.create(this,this.OnGame_InventoryWindow_UpdateFilterGroup1));
      registerGameInterface("OnGame_InventoryWindow_UpdateFilterGroup2",g4.util.Delegate.create(this,this.OnGame_InventoryWindow_UpdateFilterGroup2));
      registerGameInterface("OnGame_InventoryWindow_UpdatePocketTabSearchCount",g4.util.Delegate.create(this,this.OnGame_InventoryWindow_UpdatePocketTabSearchCount));
      registerGameInterface("OnGame_InventoryWindow_UpdatePocketGainSettingList",g4.util.Delegate.create(this,this.OnGame_InventoryWindow_UpdatePocketGainSettingList));
      registerGameInterface("OnGame_InventoryWindow_SelectedPocketGainSetting",g4.util.Delegate.create(this,this.OnGame_InventoryWindow_SelectedPocketGainSetting));
      registerGameInterface("OnGame_InventoryWindow_UpdatePocketLockSlotLine",g4.util.Delegate.create(this,this.OnGame_InventoryWindow_UpdatePocketLockSlotLine));
      registerGameInterface("OnGame_InventoryWindow_UnlockSlots",g4.util.Delegate.create(this,this.OnGame_InventoryWindow_UnlockSlots));
      registerGameInterface("OnGame_InventoryWindow_ResetFilterSetting",g4.util.Delegate.create(this,this.OnGame_InventoryWindow_ResetFilterSetting));
      registerGameInterface("OnGame_InventoryWindow_ToggleFilterGroup",g4.util.Delegate.create(this,this.OnGame_InventoryWindow_ToggleFilterGroup));
      registerGameInterface("OnGame_InventoryWindow_UnlockPocketTab",g4.util.Delegate.create(this,this.OnGame_InventoryWindow_UnlockPocketTab));
      registerGameInterface("OnGame_InventoryWindow_ResetFilterGroup",g4.util.Delegate.create(this,this.OnGame_InventoryWindow_ResetFilterGroup));
      registerGameInterface("OnGame_InventoryWindow_UpdateItemsCount",g4.util.Delegate.create(this,this.OnGame_InventoryWindow_UpdateItemsCount));
      registerGameInterface("OnGame_InventoryWindow_UpdateAutoSortBtnDisabled",g4.util.Delegate.create(this,this.OnGame_InventoryWindow_UpdateAutoSortBtnDisabled));
      registerGameInterface("OnGame_InventoryWindow_UpdatePocketBtnDisabled",g4.util.Delegate.create(this,this.OnGame_InventoryWindow_UpdatePocketBtnDisabled));
      registerGameInterface("OnGame_MouseDown",g4.util.Delegate.create(this,this.OnGame_MouseDown));
      g4.util.MovieClipUtil.nextFrameCall(null,this.init,null,this);
   }
   function init()
   {
      this._inventoryItemSlotGroup.createItemSlots(15,"inven__");
      this._inventoryPocketItemSlotGroup.createItemSlots(10,"pocket__");
   }
   function OnGameEventShowWindow(widgetName, bShow)
   {
      if(widgetName.toLowerCase() == this._inventory.getUIName().toLowerCase())
      {
         this._inventory.__get__targetMovieClip().bWidgetOpen = bShow;
         this._inventory.__get__targetMovieClip()._visible = _global.gbUIMode && this._inventory.__get__targetMovieClip().bWidgetOpen;
         var _loc3_ = new lib.controls.CustomScaleEvent();
         if(this._inventory.__get__targetMovieClip()._visible == true)
         {
            _loc3_.CustomScaleEventCheck(this._inventory.__get__targetMovieClip(),this._inventory.getUIName());
            this._inventory.__get__targetMovieClip().scaleExpander.scaleExpanderEventCheck(this._inventory.__get__targetMovieClip(),this._inventory.getUIName());
         }
         else
         {
            _loc3_.CustomScaleEventRemoveCheck();
         }
      }
   }
   function OnGameEventChangeUIMode(isShow)
   {
      this._inventory.__get__targetMovieClip()._visible = _global.gbUIMode && this._inventory.__get__targetMovieClip().bWidgetOpen;
   }
   function OnGame_InventoryWindow_UpdateItems($isPocket, $inventoryItemSlotPs)
   {
      var _loc3_ = g4.util.TeraParser.parse($inventoryItemSlotPs);
      var _loc2_ = 0;
      while(_loc2_ < _loc3_.length)
      {
         var _loc4_ = g4.gameInterface.dataP.inventoryWindow.InventoryItemSlotP.teraParse(_loc3_[_loc2_]);
         _loc3_[_loc2_] = _loc4_;
         _loc2_ = _loc2_ + 1;
      }
      var _loc5_ = $isPocket != true?this._inventoryItemSlotGroup:this._inventoryPocketItemSlotGroup;
      _loc5_.updateItemSlots(_loc3_);
   }
   function OnGame_InventoryWindow_ClearItems($isPocket)
   {
      var _loc2_ = $isPocket != true?this._inventoryItemSlotGroup:this._inventoryPocketItemSlotGroup;
      _loc2_.clearItemSlots();
   }
   function OnGame_InventoryWindow_UpdateItemsCount($isPocket, $hasCount, $maxCount)
   {
      if($isPocket == false)
      {
         this._inventory.showInventoryCount($hasCount,$maxCount);
      }
      else
      {
         this._inventoryPocket.showInventoryCount($hasCount,$maxCount);
      }
   }
   function OnGame_InventoryWindow_SelectedPocketTabIndex($index)
   {
      this._inventoryPocket.selectedPocketTab(Number($index));
   }
   function OnGame_InventoryWindow_ShowPocketTabCount($counts)
   {
      var _loc3_ = g4.util.JSON.parse($counts);
      var _loc4_ = 0;
      var _loc2_ = 0;
      while(_loc2_ < _loc3_.length)
      {
         _loc4_ = _loc4_ + _loc3_[_loc2_];
         _loc2_ = _loc2_ + 1;
      }
      this._inventoryPocket.showTabCount(_loc3_);
      this._inventory.updatePocketCount(_loc4_);
   }
   function OnGame_InventoryWindow_UpdatePocketTabNames($tabNames)
   {
      var _loc2_ = g4.util.JSON.parse($tabNames);
      this._inventoryPocket.updateTabNames(_loc2_);
   }
   function OnGame_InventoryWindow_UpdateFilterGroup1($filterNames)
   {
      this._inventoryFilterGroup.updateInventoryFilterGroup1(g4.util.JSON.parse($filterNames));
   }
   function OnGame_InventoryWindow_UpdateFilterGroup2($filterNames)
   {
      this._inventoryFilterGroup.updateInventoryFilterGroup2(g4.util.JSON.parse($filterNames));
   }
   function OnGame_InventoryWindow_UpdatePocketTabSearchCount($pocketSearchCounts)
   {
      this._inventoryPocket.updatePocketTabSearchCount(g4.util.JSON.parse($pocketSearchCounts));
   }
   function OnGame_InventoryWindow_UpdatePocketGainSettingList($pocketGainSettingList)
   {
      this._inventoryPocket.updatePocketGainSettingList(g4.util.JSON.parse($pocketGainSettingList));
   }
   function OnGame_InventoryWindow_SelectedPocketGainSetting($index)
   {
      this._inventoryPocket.selectedPocketGainSetting(Number($index));
   }
   function OnGame_InventoryWindow_UpdatePocketLockSlotLine($lockSlotLine)
   {
      this._inventoryPocketItemSlotGroup.updatePocketLockSlotLine(Number($lockSlotLine));
   }
   function OnGame_InventoryWindow_UnlockSlots($isPocket)
   {
      if($isPocket == true)
      {
         this._inventoryPocketItemSlotGroup.unlockSlots();
      }
      else
      {
         this._inventoryItemSlotGroup.unlockSlots();
      }
      lib.manager.UISound.play("4005");
   }
   function OnGame_InventoryWindow_ResetFilterSetting()
   {
      this._inventoryFilterGroup.resetFilterStetting();
   }
   function OnGame_InventoryWindow_ToggleFilterGroup(isOpen)
   {
      this._inventory.toggleFilterGroup(isOpen);
   }
   function OnGame_InventoryWindow_UnlockPocketTab(tabIndex, tabName)
   {
      this._inventoryPocket.unlockPocketTab(tabIndex,tabName);
   }
   function OnGame_InventoryWindow_ResetFilterGroup()
   {
      this._inventoryFilterGroup.resetFilterGroup();
   }
   function OnGameEventSetInvenMoney(invenMoney, invenTCat, invenCMoney)
   {
      var _loc4_ = invenTCat != undefined && invenTCat != "" && invenTCat != "undefined";
      var _loc5_ = invenCMoney != undefined && invenCMoney != "" && invenCMoney != "undefined";
      this._inventoryWalletGroup.setWalletBtns(_loc4_,_loc5_);
      this._inventoryWalletGroup.setInvenMoney(invenMoney,invenTCat,invenCMoney);
   }
   function OnGame_InventoryWindow_SetSlotLine(slotLineCount)
   {
      if(slotLineCount == undefined || slotLineCount == "")
      {
         return undefined;
      }
      this._inventoryItemSlotGroup.setSlotLine(Number(slotLineCount));
      g4.view.inventory.InventoryController.getInstance().OnGame_InventoryWindow_SetDisable(!this._inventoryModel.invenDisable);
   }
   function OnGame_InventoryWindow_SetDisable(bEnable)
   {
      var _loc2_ = Number(bEnable) == 1;
      this._inventoryModel.invenDisable = !_loc2_;
      this._inventoryWalletGroup.setDisabled(_loc2_);
   }
   function OnGame_InventoryWindow_SetItemCoolTime($isPocket, $itemIndexs, remain, total)
   {
      var _loc2_ = g4.util.JSON.parse($itemIndexs);
      var _loc3_ = $isPocket != true?this._inventoryItemSlotGroup:this._inventoryPocketItemSlotGroup;
      _loc3_.showItemCoolTime(_loc2_,Number(remain),Number(total));
   }
   function OnGame_InventoryWindow_UnsealItem($isPocket, $index, $unsealType)
   {
      var _loc2_ = $isPocket != true?this._inventoryItemSlotGroup:this._inventoryPocketItemSlotGroup;
      _loc2_.unsealItem(Number($index),Number($unsealType));
   }
   function OnGame_InventoryWindow_SealItem($isPocket, $index, $sealType)
   {
      var _loc2_ = $isPocket != true?this._inventoryItemSlotGroup:this._inventoryPocketItemSlotGroup;
      _loc2_.sealItem(Number($index),Number($sealType));
   }
   function OnGame_InventoryWindow_HideNewSymbol($isPocket, $index)
   {
      var _loc2_ = $isPocket != true?this._inventoryItemSlotGroup:this._inventoryPocketItemSlotGroup;
      _loc2_.hideNewSymbol(Number($index));
   }
   function OnGame_InventoryWindow_SetCharacterName(name)
   {
      lib.manager.UISkin.setInGameCharacterName(this._inventory.__get__container_mc(),name);
   }
   function OnGame_InventoryWindow_SetToggle($isPocket, $indexs, $bTrue)
   {
      var _loc2_ = g4.util.JSON.parse($indexs);
      var _loc3_ = $isPocket != true?this._inventoryItemSlotGroup:this._inventoryPocketItemSlotGroup;
      _loc3_.setToggle(_loc2_,$bTrue);
   }
   function OnGame_InventoryWindow_SetGemstoneEffect($isPocket, $param)
   {
      var _loc2_ = g4.util.JSON.parse($param);
      var _loc3_ = $isPocket != true?this._inventoryItemSlotGroup:this._inventoryPocketItemSlotGroup;
      _loc3_.setGemstoneEffect(_loc2_);
   }
   function OnGame_InventoryWindow_SetRemoveEffect($isPocket, $slotIndex)
   {
      var _loc2_ = $isPocket != true?this._inventoryItemSlotGroup:this._inventoryPocketItemSlotGroup;
      _loc2_.setRemoveEffect(Number($slotIndex));
   }
   function OnGame_InventoryWindow_Pocket_Visible($isShow)
   {
      this._inventory.showInventoryPocket($isShow);
   }
   function OnGame_InventoryWindow_UpdateAutoSortBtnDisabled($disabled)
   {
      this._inventoryWalletGroup.updateAutoSortBtnDisabled($disabled);
      this._inventoryPocket.updateAutoSortBtnDisabled($disabled);
   }
   function OnGame_InventoryWindow_UpdatePocketBtnDisabled($disabled)
   {
      this._inventory.updatePocketBtnDisabled($disabled);
   }
   function ToGame_InitUI(viewId)
   {
      g4.model.GameInterface.callGameInterface("ToGame_InitUI",viewId);
   }
   function ToGame_RequestCloseUI(viewId)
   {
      g4.model.GameInterface.callGameInterface("ToGame_RequestCloseUI",viewId);
   }
   function ToGame_InventoryWindow_ClickExtBtn(index)
   {
      g4.model.GameInterface.callGameInterface("ToGame_InventoryWindow_ClickExtBtn",index);
   }
   function ToGame_InventoryWindow_LeftClickSlot(slotName)
   {
      g4.model.GameInterface.callGameInterface("ToGame_InventoryWindow_LeftClickSlot",slotName);
   }
   function ToGame_InventoryWindow_RightClickSlot(slotName)
   {
      g4.model.GameInterface.callGameInterface("ToGame_InventoryWindow_RightClickSlot",slotName);
   }
   function ToGame_Inventory_TCatBuy()
   {
      g4.model.GameInterface.callGameInterface("ToGame_Inventory_TCatBuy");
   }
   function ToGame_Inventory_RequestExchange()
   {
      g4.model.GameInterface.callGameInterface("ToGame_Inventory_RequestExchange");
   }
   function ToGame_InventoryWindow_ClickBtn(id)
   {
      g4.model.GameInterface.callGameInterface("ToGame_InventoryWindow_ClickBtn",id);
   }
   function ToGame_Inventory_ClickPocketBtn()
   {
      g4.model.GameInterface.callGameInterface("ToGame_Inventory_ClickPocketBtn");
   }
   function ToGame_Inventory_ClickPocketTabBtn(index)
   {
      g4.model.GameInterface.callGameInterface("ToGame_Inventory_ClickPocketTabBtn",index);
   }
   function ToGame_Inventory_SelectFilter1Group(filterIndex)
   {
      g4.model.GameInterface.callGameInterface("ToGame_Inventory_SelectFilter1Group",filterIndex);
   }
   function ToGame_Inventory_SelectFilter2Group(filterIndex)
   {
      g4.model.GameInterface.callGameInterface("ToGame_Inventory_SelectFilter2Group",filterIndex);
   }
   function ToGame_Inventory_ClickFilterRefreshBtn()
   {
      g4.model.GameInterface.callGameInterface("ToGame_Inventory_ClickFilterRefreshBtn");
   }
   function ToGame_Inventory_ClickSearchBtn(searchName)
   {
      g4.model.GameInterface.callGameInterface("ToGame_Inventory_ClickSearchBtn",searchName);
   }
   function ToGame_Inventory_ClickInventorySlotLockBtn(isPocket)
   {
      g4.model.GameInterface.callGameInterface("ToGame_Inventory_ClickInventorySlotLockBtn",isPocket);
   }
   function ToGame_Inventory_SelectGainSetting(selectedIndex)
   {
      g4.model.GameInterface.callGameInterface("ToGame_Inventory_SelectGainSetting",selectedIndex);
   }
   function ToGame_Inventory_ClickAutoSortBtn(isPocket)
   {
      g4.model.GameInterface.callGameInterface("ToGame_Inventory_ClickAutoSortBtn",isPocket);
   }
   function ToGame_Inventory_ClickAutoSortSettingBtn(isPocket)
   {
      g4.model.GameInterface.callGameInterface("ToGame_Inventory_ClickAutoSortSettingBtn",isPocket);
   }
   function ToGame_Inventory_ClickFilterToggleBtn()
   {
      g4.model.GameInterface.callGameInterface("ToGame_Inventory_ClickFilterToggleBtn");
   }
   function OnGame_MouseDown(button, target)
   {
      var _loc4_ = target.btnName == "INVENSLOTBTN";
      var _loc5_ = target != undefined && target != "";
      if(!_loc4_ && _root.bSelectSlotMode && button == 1)
      {
         var _loc6_ = _loc5_ != true?"GameScreen":"InvalidUI";
         this.ToGame_InventoryWindow_LeftClickSlot(_loc6_);
      }
   }
}
