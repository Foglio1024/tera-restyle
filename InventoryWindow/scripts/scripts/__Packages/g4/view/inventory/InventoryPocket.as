class g4.view.inventory.InventoryPocket extends g4.core.G4UIComponent
{
   function InventoryPocket()
   {
      super();
      g4.view.inventory.InventoryController.getInstance().registerInventoryPocket(this);
   }
   function configUI()
   {
      super.configUI();
      this._tf_title = this.tf_title;
      this._tf_gainSetting = this.tf_gainSetting;
      this._mc_tabOepnEffect = this.mc_tabOepnEffect;
      this._autoSortBtn = this.autoSortBtn;
      this._autoSortSettingBtn = this.autoSortSettingBtn;
      g4.manager.TooltipManager.getInstance().addMessageTooltip(this._autoSortSettingBtn,lib.util.UIString.getUIString("$221166"));
      this._gainSettingComboBox = this.gainSettingComboBox;
      this._gainSettingComboBox.isInteraction = false;
      this._gainSettingComboBox.addEventListener(gfx.events.EventTypes.CHANGE,this,this.onChangeGainSettingComboBox);
      this._tabBtns = [];
      this._mc_tabCount = [];
      var _loc3_ = 0;
      while(_loc3_ < 3)
      {
         var _loc4_ = this["tabBtn" + _loc3_];
         _loc4_.data = _loc3_;
         _loc4_.__set__groupName("pocketTabGroup");
         _loc4_.$dragSlotName = "pocketTab__" + _loc3_;
         _loc4_.addEventListener(gfx.events.EventTypes.CLICK,this,this.onTabBtnClick);
         this._tabBtns.push(_loc4_);
         var _loc5_ = this["mc_tabCount" + _loc3_];
         _loc5_._visible = false;
         this._mc_tabCount.push(_loc5_);
         _loc3_ = _loc3_ + 1;
      }
      g4.manager.MouseEventManager.getInstance().addEventListener(g4.manager.MouseEventManager.MOUSE_MOVE,this,this.onMouseEventMove);
      g4.manager.MouseEventManager.getInstance().addEventListener(g4.manager.MouseEventManager.MOUSE_UP,this,this.onMouseEventUp);
      this._autoSortSettingBtn.addEventListener(gfx.events.EventTypes.CLICK,this,this.onAutoSortSettingBtnClick);
      this._autoSortBtn.addEventListener(gfx.events.EventTypes.CLICK,this,this.onAutoSortBtnClick);
      this._buttonGroup = (g4.component.ButtonGroup)(g4.component.TextButton)this._tabBtns[0].__get__group();
      this._buttonGroup.isInteraction = false;
      this._autoSortBtn.__set__label(lib.util.UIString.getUIString("$221165"));
      this._str_title = lib.util.UIString.getUIString("$221162");
      this._tf_gainSetting.text = lib.util.UIString.getUIString("$221163");
      this._tf_gainSetting.verticalAlign = "center";
      this._gainSettingComboBox._x = this._tf_gainSetting._x + this._tf_gainSetting.textWidth + 8;
   }
   function showInventoryCount(hasNum, maxNum)
   {
      this._tf_title.text = this._str_title + "(" + hasNum + "/" + maxNum + ")";
   }
   function updateTabNames(tabNames)
   {
      this._tabNames = tabNames;
      var _loc2_ = 0;
      while(_loc2_ < 3)
      {
         var _loc3_ = this._tabBtns[_loc2_];
         _loc3_.__set__label(this._tabNames[_loc2_] != ""?this._tabNames[_loc2_]:"+");
         _loc3_.__set__disabled(this._tabNames[_loc2_ - 1] != null && this._tabNames[_loc2_ - 1] == "");
         _loc2_ = _loc2_ + 1;
      }
   }
   function selectedPocketTab(selectedIndex)
   {
      this._buttonGroup.setSelectedButtonIndex(selectedIndex);
   }
   function showTabCount(counts)
   {
      var _loc2_ = 0;
      while(_loc2_ < counts.length)
      {
         var _loc3_ = this._mc_tabCount[_loc2_];
         var _loc6_ = this["tabBtn" + _loc2_];
         var _loc4_ = counts[_loc2_];
         if(_loc4_ > 0 && this._tabNames[_loc2_] != "")
         {
            _loc3_._visible = true;
            _loc3_.tf_count.text = _loc4_;
         }
         else
         {
            _loc3_._visible = false;
         }
         _loc2_ = _loc2_ + 1;
      }
   }
   function updatePocketTabSearchCount(pocketSearchCounts)
   {
      var _loc2_ = 0;
      while(_loc2_ < 3)
      {
         var _loc3_ = this._tabBtns[_loc2_];
         if(pocketSearchCounts == null || this._tabNames[_loc2_] == "")
         {
            _loc3_.tempTextColor = -1;
            _loc3_.__set__label(this._tabNames[_loc2_] != ""?this._tabNames[_loc2_]:"+");
         }
         else
         {
            _loc3_.tempTextColor = 16763904;
            _loc3_.__set__label(pocketSearchCounts[_loc2_]);
         }
         _loc2_ = _loc2_ + 1;
      }
   }
   function updatePocketGainSettingList(pocketGainSettingList)
   {
      this._gainSettingComboBox.setData(pocketGainSettingList);
   }
   function selectedPocketGainSetting(index)
   {
      this._gainSettingComboBox.__set__selectedIndex(index);
   }
   function unlockPocketTab(tabIndex, tabName)
   {
      this._mc_tabOepnEffect._x = 5 + tabIndex * 119;
      this._mc_tabOepnEffect.gotoAndPlay(2);
      this._mc_tabOepnEffect.onEnterFrame = g4.util.Delegate.create(this,function()
      {
         if(this._mc_tabOepnEffect._currentframe == 10)
         {
            var _loc3_ = this._tabBtns[tabIndex];
            _loc3_.__set__label(tabName);
            this._mc_tabOepnEffect.onEnterFrame = null;
            var _loc2_ = this._tabBtns[tabIndex + 1];
            if(_loc2_ != null)
            {
               _loc2_.__set__disabled(false);
            }
         }
      }
      );
   }
   function updateAutoSortBtnDisabled(disabled)
   {
      this._autoSortBtn.__set__disabled(disabled);
      this._autoSortSettingBtn.__set__disabled(disabled);
   }
   function onMouseEventMove(target)
   {
      target = (MovieClip)Mouse.getTopMostEntity(false);
      if(_root.gbDraggingTile == true && g4.util.ArrayUtil.indexOf(this._tabBtns,target) != -1)
      {
         var _loc4_ = (g4.component.TextButton)target;
         if(this._overTabBtn != _loc4_)
         {
            this._overTabBtn = (g4.component.TextButton)target;
            gs.TweenLite.killTweensOf(this.onOverTabDelay);
            gs.TweenLite.delayedCall(0.5,this.onOverTabDelay,null,this);
         }
      }
      else
      {
         this._overTabBtn = null;
      }
   }
   function onMouseEventUp()
   {
      gs.TweenLite.killTweensOf(this.onOverTabDelay);
      this._overTabBtn = null;
   }
   function onOverTabDelay()
   {
      var _loc2_ = (g4.component.TextButton)Mouse.getTopMostEntity(false);
      if(_loc2_ != null && this._overTabBtn != null && _loc2_ == this._overTabBtn && this._buttonGroup.selectedButton != this._overTabBtn && this._tabNames[_loc2_.data] != "")
      {
         g4.view.inventory.InventoryController.getInstance().ToGame_Inventory_ClickPocketTabBtn(Number(this._overTabBtn.data));
      }
      this._overTabBtn = null;
   }
   function onTabBtnClick(textButton)
   {
      g4.view.inventory.InventoryController.getInstance().ToGame_Inventory_ClickPocketTabBtn(Number(textButton.data));
   }
   function onChangeGainSettingComboBox()
   {
      g4.view.inventory.InventoryController.getInstance().ToGame_Inventory_SelectGainSetting(this._gainSettingComboBox.__get__selectedIndex());
   }
   function onAutoSortSettingBtnClick()
   {
      g4.view.inventory.InventoryController.getInstance().ToGame_Inventory_ClickAutoSortSettingBtn(true);
   }
   function onAutoSortBtnClick()
   {
      g4.view.inventory.InventoryController.getInstance().ToGame_Inventory_ClickAutoSortBtn(true);
   }
}
