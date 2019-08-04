class g4.view.skillWindow.GrowSkillPanel_DetailPanel extends gfx.core.UIComponent
{
   function GrowSkillPanel_DetailPanel()
   {
      super();
      g4.view.skillWindow.SkillWindowController.getInstance().registerGrowSkillPanel_DetailPanel(this);
   }
   function configUI()
   {
      this._skillSlot = this.skillSlot;
      this._tf_skillName = this.tf_skillName;
      this._tf_enhance = this.tf_enhance;
      this._enhancePanel = this.enhancePanel;
      this._functionBtn = this.functionBtn;
      this._tf_level = this.tf_level;
      this._mc_enhanceHit = this.mc_enhanceHit;
      this._optionSkillPanel = this.optionSkillPanel;
      this._tf_cautionMessage = this.tf_cautionMessage;
      this._functionBtn.addEventListener(gfx.events.EventTypes.CLICK,this,this.onFunctionBtnClick);
      g4.manager.TooltipManager.getInstance().addMessageTooltip(this._mc_enhanceHit,lib.util.UIString.getUIString("$083021"));
   }
   function showGrowSkillDetailSlotInfo(skillSlotP, currentEnhance, maxEnhance, cautionMessage, userLevel)
   {
      this._skillSlotP = skillSlotP;
      this._skillSlot.setData(skillSlotP);
      this._skillSlot.updateSlot();
      this._tf_skillName.text = skillSlotP.Name;
      if(currentEnhance == -1)
      {
         this._tf_enhance._visible = false;
      }
      else
      {
         this._tf_enhance._visible = true;
         this._tf_enhance.htmlText = "<font color=\'#ffffff\'>" + currentEnhance + "</font> / " + maxEnhance;
      }
      var _loc3_ = skillSlotP.Level <= userLevel?"#6c7d8a":"#ea0000";
      this._tf_level.htmlText = "<font color=\'" + _loc3_ + "\'>Lv." + skillSlotP.Level + "</font>";
      this._tf_cautionMessage.htmlText = cautionMessage;
      g4.manager.TooltipManager.getInstance().removeTooltip(this._skillSlot);
      g4.manager.TooltipManager.getInstance().addUiTooltip(g4.view.ViewID.SKILL_WINDOW,this._skillSlot,this._skillSlotP.Id,0);
   }
   function showGrowSkillFunctionButton(buttonName, isDisable)
   {
      if(buttonName == "")
      {
         this._functionBtn._visible = false;
      }
      else
      {
         this._functionBtn.__set__disabled(isDisable);
         this._functionBtn.__set__label(buttonName);
         this._functionBtn._visible = true;
      }
   }
   function onFunctionBtnClick()
   {
      g4.view.skillWindow.SkillWindowController.getInstance().showMaterialItemSlotListSimplePopup();
   }
}
