class g4.view.skillWindow.GrowSkillPanel_MaterialItemSlot extends g4.core.G4UIComponent
{
   function GrowSkillPanel_MaterialItemSlot()
   {
      super();
   }
   function configUI()
   {
      super.configUI();
      this._itemSlot = this.itemSlot;
      this._tf_amount = this.tf_amount;
      if(this._growSkillDetailMaterialP != null)
      {
         this.setData(this._growSkillDetailMaterialP);
         this.showMaterialItemSlot();
      }
   }
   function setData(growSkillDetailMaterialP)
   {
      this._growSkillDetailMaterialP = growSkillDetailMaterialP;
      if(this._isConfigUIComplete == false)
      {
         return undefined;
      }
      this._itemSlot.setData(this._growSkillDetailMaterialP.itemSlotP);
      this._growSkillDetailMaterialP = growSkillDetailMaterialP;
      g4.manager.TooltipManager.getInstance().addUiTooltip(g4.view.ViewID.SKILL_WINDOW,this._itemSlot,this._growSkillDetailMaterialP.itemSlotP.Id,2);
   }
   function showMaterialItemSlot()
   {
      if(this._isConfigUIComplete == false)
      {
         return undefined;
      }
      this._itemSlot.updateSlot();
      var _loc2_ = this._growSkillDetailMaterialP.HasCount >= this._growSkillDetailMaterialP.NeedCount?"ffffff":"ff0000";
      this._tf_amount.htmlText = "<font color=\'#" + _loc2_ + "\'>" + this._growSkillDetailMaterialP.HasCount + "</font>/" + this._growSkillDetailMaterialP.NeedCount;
   }
}
