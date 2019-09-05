class g4.view.inventory.InventoryExtBtnGroup extends g4.core.G4UIComponent
{
   function InventoryExtBtnGroup()
   {
      super();
      g4.view.inventory.InventoryController.getInstance().registerInventoryExtBtnGroup(this);
   }
   function __get__extBtnCount()
   {
      return this._extBtns.length;
   }
   function configUI()
   {
      this._extBtns = [this.enchantBtn,this.extractBtn,this.combineBtn,this.crystalBtn];
      var _loc4_ = [];
      _loc4_[0] = lib.util.UIString.getUIString("$051012");
      _loc4_[1] = lib.util.UIString.getUIString("$051010");
      _loc4_[2] = lib.util.UIString.getUIString("$051016");
      _loc4_[3] = lib.util.UIString.getUIString("$051011");
      var _loc2_ = 0;
      while(_loc2_ < this._extBtns.length)
      {
         var _loc3_ = this._extBtns[_loc2_];
         _loc3_.addEventListener(gfx.events.EventTypes.CLICK,this,this.onBtnClick);
         g4.manager.TooltipManager.getInstance().addMessageTooltip(_loc3_,_loc4_[_loc2_]);
         _loc2_ = _loc2_ + 1;
      }
   }
   function onBtnClick(extBtn)
   {
      var _loc2_ = g4.util.ArrayUtil.indexOf(this._extBtns,extBtn);
      g4.view.inventory.InventoryController.getInstance().ToGame_InventoryWindow_ClickExtBtn(_loc2_);
   }
}
