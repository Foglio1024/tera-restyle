class g4.view.inventory.InventoryFilterGroup extends g4.core.G4UIComponent
{
   var _searchText = "";
   function InventoryFilterGroup()
   {
      super();
      g4.view.inventory.InventoryController.getInstance().registerInventoryFilterGroup(this);
   }
   function configUI()
   {
      this._keyListener = {};
      this._keyListener.onKeyUp = g4.util.Delegate.create(this,this.onKeyUp);
      this._filter1ComboBox = this.filter1ComboBox;
      this._filter2ComboBox = this.filter2ComboBox;
      this._refreshBtn = this.refreshBtn;
      this._searchTextInput = this.searchTextInput;
      this._searchBtn = this.searchBtn;
      this._refreshBtn.__set__label(lib.util.UIString.getUIString("$221164"));
      this._refreshBtn.addEventListener(gfx.events.EventTypes.CLICK,this,this.onRefreshBtnClick);
      this._searchBtn.addEventListener(gfx.events.EventTypes.CLICK,this,this.onSearchBtnClick);
      this._searchBtn.__set__disabled(true);
      this._searchTextInput.__set__maxChars(10);
      this._searchTextInput.isHtml = true;
      this._searchTextInput.defaultText = lib.util.UIString.getUIString("$221161");
      this._searchTextInput.defaultTextFormat.color = 3302022;
      this._searchTextInput.addEventListener(gfx.events.EventTypes.FOCUS_IN,this,this.onTextInputFocusIn);
      this._filter2ComboBox.addEventListener(gfx.events.EventTypes.ITEM_CLICK,this,this.onFilter2ComboBoxItemClick);
   }
   function resetFilterStetting()
   {
      this.filterSelect(0,0);
      this._refreshBtn.__set__disabled(this._searchText == "");
   }
   function resetFilterGroup()
   {
      this._searchText = "";
      this._searchTextInput.removeEventListener(gfx.events.EventTypes.TEXT_CHANGE,this,this.onTextInputChange);
      this._searchTextInput.__set__focused(false);
      this._searchTextInput.showDefaultText();
      this._searchTextInput.addEventListener(gfx.events.EventTypes.TEXT_CHANGE,this,this.onTextInputChange);
      this._searchBtn.__set__disabled(true);
      this.resetFilterStetting();
   }
   function onTextInputChange()
   {
      this._searchBtn.__set__disabled(this._searchTextInput.textField.text == this._searchTextInput.defaultText || this._searchTextInput.textField.text == this._searchText);
      this.setDisabledRefreshBtn();
   }
   function onTextInputFocusIn()
   {
      Key.addListener(this._keyListener);
      this._searchTextInput.addEventListener(gfx.events.EventTypes.FOCUS_OUT,this,this.onTextInputFocusOut);
   }
   function onTextInputFocusOut()
   {
      Key.removeListener(this._keyListener);
      this._searchBtn.__set__disabled(this._searchTextInput.textField.text == this._searchTextInput.defaultText || this._searchTextInput.textField.text == this._searchText);
      this._searchTextInput.removeEventListener(gfx.events.EventTypes.FOCUS_OUT,this,this.onTextInputFocusOut);
   }
   function updateInventoryFilterGroup1(filterNames)
   {
      this._filter1ComboBox.setData(filterNames);
   }
   function updateInventoryFilterGroup2(filterNames)
   {
      var _loc2_ = 0;
      while(_loc2_ < filterNames.length)
      {
         if(_loc2_ > 1)
         {
            filterNames[_loc2_].label = filterNames[_loc2_].label + (filterNames[_loc2_].isUp != true?" <img src=\'G4ComboBox_0_UpArrow.png\' width=\'6\' height=\'6\' vspace=\'2\'>":" <img src=\'G4ComboBox_0_DownArrow.png\' width=\'6\' height=\'6\' vspace=\'2\'>");
         }
         _loc2_ = _loc2_ + 1;
      }
      this._filter2ComboBox.setData(filterNames);
      if(this._filter2ComboBox.__get__selectedIndex() != -1)
      {
         this._filter2ComboBox.__set__selectLabel(filterNames[this._filter2ComboBox.__get__selectedIndex()].label);
      }
   }
   function filterSelect(select1, select2)
   {
      this._filter1ComboBox.removeEventListener(gfx.events.EventTypes.CHANGE,this,this.onFilter1ComboBoxChange);
      this._filter1ComboBox.__set__selectedIndex(select1);
      this._filter2ComboBox.__set__selectedIndex(select2);
      this._filter1ComboBox.addEventListener(gfx.events.EventTypes.CHANGE,this,this.onFilter1ComboBoxChange);
   }
   function onFilter1ComboBoxChange()
   {
      g4.view.inventory.InventoryController.getInstance().ToGame_Inventory_SelectFilter1Group(this._filter1ComboBox.__get__selectedIndex());
      this.setDisabledRefreshBtn();
   }
   function onFilter2ComboBoxItemClick()
   {
      g4.view.inventory.InventoryController.getInstance().ToGame_Inventory_SelectFilter2Group(this._filter2ComboBox.__get__selectedIndex());
      this.setDisabledRefreshBtn();
   }
   function onRefreshBtnClick()
   {
      this.resetFilterGroup();
      g4.view.inventory.InventoryController.getInstance().ToGame_Inventory_ClickFilterRefreshBtn();
   }
   function onSearchBtnClick()
   {
      if(this._searchTextInput.textField.text == "" || this._searchTextInput.textField.text == this._searchText)
      {
         return undefined;
      }
      this._searchText = this._searchTextInput.textField.text;
      this._searchBtn.__set__disabled(true);
      g4.view.inventory.InventoryController.getInstance().ToGame_Inventory_ClickSearchBtn(this._searchText);
   }
   function setDisabledRefreshBtn()
   {
      this._refreshBtn.__set__disabled(this._filter1ComboBox.__get__selectedIndex() == 0 && this._filter2ComboBox.__get__selectedIndex() == 0 && this._searchTextInput.textField.text == this._searchTextInput.defaultText);
   }
   function onKeyUp()
   {
      var _loc2_ = Key.getCode();
      if(_loc2_ == 13)
      {
         Selection.setFocus(this._refreshBtn);
         this.onSearchBtnClick();
      }
   }
}
