class g4.view.inventory.InventoryWalletGroup extends g4.core.G4UIComponent
{
   var _tcatVisible = false;
   var _cMoneyVisible = false;
   function InventoryWalletGroup()
   {
      super();
      g4.view.inventory.InventoryController.getInstance().registerInventoryWalletGroup(this);
   }
   function __get__contentHeight()
   {
      return this._contentHeight;
   }
   function configUI()
   {
      this._goldLabel = this.goldLabel;
      this._tcatLabel = this.tcatLabel;
      this._cGoldLabel = this.cGoldLabel;
      this._goldTxt = this.goldTxt;
      this._tcatTxt = this.tcatTxt;
      this._cGoldTxt = this.cGoldTxt;
      this._tcatBtn = this.tcatBtn;
      this._exchangeBtn = this.exchangeBtn;
      this._mc_moneyBg0 = this.mc_moneyBg0;
      this._mc_moneyBg1 = this.mc_moneyBg1;
      this._autoSortBtn = this.autoSortBtn;
      this._autoSortSettingBtn = this.autoSortSettingBtn;
      this._cGoldLabel._y = this._tcatLabel._y;
      this._cGoldTxt._y = this._tcatTxt._y;
      this._exchangeBtn._y = this._tcatTxt._y;
      this._goldLabel.verticalAlign = "center";
      this._tcatLabel.verticalAlign = "center";
      this._cGoldLabel.verticalAlign = "center";
      this.TCATTYPE = lib.gamedata.DefaultData.getDefaultUIData("TcatEnable").param1;
      this._autoSortBtn.__set__label(lib.util.UIString.getUIString("$221165"));
      this._goldLabelStr = lib.util.UIString.getUIString("$051002");
      this._goldLabelStr_c = lib.util.UIString.getUIString("$051005");
      this._tcatLabel.text = lib.util.UIString.getUIString("$051003");
      this._cGoldLabel.text = lib.util.UIString.getUIString("$051006");
      this._tcatBtn.__set__label(lib.util.UIString.getUIString("$051004"));
      this._exchangeBtn.txt.text = lib.util.UIString.getUIString("$051009");
      g4.manager.TooltipManager.getInstance().addMessageTooltip(this._autoSortSettingBtn,lib.util.UIString.getUIString("$221166"));
      this._tcatBtn.addEventListener(gfx.events.EventTypes.CLICK,this,function()
      {
         g4.view.inventory.InventoryController.getInstance().ToGame_Inventory_TCatBuy();
      }
      );
      this._exchangeBtn.addEventListener(gfx.events.EventTypes.CLICK,this,function()
      {
         g4.view.inventory.InventoryController.getInstance().ToGame_Inventory_RequestExchange();
      }
      );
      this._autoSortSettingBtn.addEventListener(gfx.events.EventTypes.CLICK,this,this.onAutoSortSettingBtnClick);
      this._autoSortBtn.addEventListener(gfx.events.EventTypes.CLICK,this,this.onAutoSortBtnClick);
      this.setWalletBtns(false,false);
   }
   function setWalletBtns(tcatVisible, cMoneyVisible)
   {
      this._tcatVisible = tcatVisible;
      this._cMoneyVisible = cMoneyVisible;
      this._tcatLabel._visible = this._tcatVisible;
      this._tcatTxt._visible = this._tcatVisible;
      this._tcatBtn._visible = this._tcatVisible;
      this._cGoldLabel._visible = this._cMoneyVisible;
      this._cGoldTxt._visible = this._cMoneyVisible;
      this._exchangeBtn._visible = this._cMoneyVisible;
      this._goldLabel.text = this._cMoneyVisible != false?this._goldLabelStr_c:this._goldLabelStr;
      if(tcatVisible || cMoneyVisible)
      {
         this._mc_moneyBg0._visible = true;
         this._mc_moneyBg1._visible = true;
         this._contentHeight = 42;
      }
      else
      {
         this._mc_moneyBg0._visible = true;
         this._mc_moneyBg1._visible = false;
         this._contentHeight = 20;
      }
   }
   function setInvenMoney(invenMoney, invenTCat, invenCMoney)
   {
      this._goldTxt.htmlText = invenMoney;
      this._tcatTxt.htmlText = lib.util.GoldCurrency.SetTCatText(invenTCat,this.TCATTYPE);
      this._cGoldTxt.htmlText = invenCMoney;
   }
   function setDisabled(enabled)
   {
      this._tcatBtn._visible = enabled && this._tcatVisible;
      this._exchangeBtn._visible = enabled && this._cMoneyVisible;
   }
   function updateAutoSortBtnDisabled(disabled)
   {
      this._autoSortBtn.__set__disabled(disabled);
      this._autoSortSettingBtn.__set__disabled(disabled);
   }
   function onAutoSortSettingBtnClick()
   {
      g4.view.inventory.InventoryController.getInstance().ToGame_Inventory_ClickAutoSortSettingBtn(false);
   }
   function onAutoSortBtnClick()
   {
      g4.view.inventory.InventoryController.getInstance().ToGame_Inventory_ClickAutoSortBtn(false);
   }
}
