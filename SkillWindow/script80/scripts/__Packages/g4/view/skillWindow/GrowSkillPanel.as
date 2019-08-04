class g4.view.skillWindow.GrowSkillPanel extends gfx.core.UIComponent
{
   function GrowSkillPanel()
   {
      super();
      g4.view.skillWindow.SkillWindowController.getInstance().registerGrowSkillPanel(this);
   }
   function configUI()
   {
      this._tf_title0 = this.tf_title0;
      this._tf_title1 = this.tf_title1;
      this._skillPointPanel = this.skillPointPanel;
      this._detailPanel = this.detailPanel;
      this._blankPanel = this.blankPanel;
      this._growSkillSlotPanelGroup = this.growSkillSlotPanelGroup;
      this._blankPanel.tf_desc.verticalAutoSize = "center";
   }
   function setGrowSkillSlots(growSkillSlotPs)
   {
      this._growSkillSlotPanelGroup.showGrowSkillSlots(growSkillSlotPs);
   }
   function showGrowSkillSlotSelected(selectedIndex)
   {
      this._growSkillSlotPanelGroup.showGrowSkillSlotSelected(selectedIndex);
   }
   function setSkillPointExp(currentExp, maxExp)
   {
      this._skillPointPanel.setSkillPointExp(currentExp,maxExp);
   }
   function setSkillPoint(currentPoint, maxPoint)
   {
      this._skillPointPanel.setSkillPoint(currentPoint,maxPoint);
   }
   function showGrowSkillOptionSlots($index, $growSkillOptionSlots, $selectedIndex)
   {
      this._growSkillSlotPanelGroup.showGrowSkillOptionSlots($index,$growSkillOptionSlots,$selectedIndex);
   }
   function showBlankPanel(desc)
   {
      this._blankPanel._visible = true;
      this._blankPanel.tf_desc.htmlText = desc;
   }
   function hideBlankPanel()
   {
      this._blankPanel._visible = false;
   }
   function showGrowSkillSlotEffect($slotIndex)
   {
      this._growSkillSlotPanelGroup.showGrowSkillSlotEffect($slotIndex);
   }
}
