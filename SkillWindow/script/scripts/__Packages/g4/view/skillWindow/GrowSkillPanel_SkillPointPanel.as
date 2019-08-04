class g4.view.skillWindow.GrowSkillPanel_SkillPointPanel extends gfx.core.UIComponent
{
   function GrowSkillPanel_SkillPointPanel()
   {
      super();
   }
   function configUI()
   {
      this._tf_totalSkillPoint = this.tf_totalSkillPoint;
      this._tf_remainSkillPointValue = this.tf_remainSkillPointValue;
      this._tf_remainSkillPointTitle = this.tf_remainSkillPointTitle;
      this._tf_percent = this.tf_percent;
      this._mc_gauge = this.mc_gauge;
      this._mc_gaugeHit = this.mc_gaugeHit;
      this._mc_hit = this.mc_hit;
      this._tf_remainSkillPointTitle.text = lib.util.UIString.getUIString("$083033");
      g4.manager.TooltipManager.getInstance().addMessageTooltip(this._mc_hit,lib.util.UIString.getUIString2("$083022"));
      this._mc_gauge._xscale = 0;
      this._tf_percent.text = "";
      this.setSkillPoint(-1,-1);
   }
   function setSkillPointExp(currentExp, maxExp)
   {
      var _loc3_ = currentExp != 0?Math.round(currentExp / maxExp * 10000) / 100:0;
      this._mc_gauge._xscale = _loc3_;
      this._tf_percent.text = _loc3_ + "%";
      var _loc2_ = lib.util.UIString.getUIString("$083023");
      _loc2_ = g4.util.StringUtil.replace(_loc2_,"{currentExp}",String(currentExp));
      _loc2_ = g4.util.StringUtil.replace(_loc2_,"{maxExp}",String(maxExp));
      _loc2_ = g4.util.StringUtil.replace(_loc2_,"{percent}",String(_loc3_));
      g4.manager.TooltipManager.getInstance().addMessageTooltip(this._mc_gaugeHit,_loc2_);
   }
   function setSkillPoint(currentPoint, maxPoint)
   {
      var _loc2_ = currentPoint != -1?String(currentPoint):"-";
      this._tf_remainSkillPointValue.text = _loc2_;
      this._tf_remainSkillPointTitle._x = 623 - this._tf_remainSkillPointValue.textWidth - 10;
      this._tf_totalSkillPoint.htmlText = lib.util.UIString.getUIString("$083032") + " <img src=\'SkillPointIcon\' width=\'16\' height=\'14\' vspace=\'0\'><font color=\'#f1b410\'>" + maxPoint + "</font>";
      this._mc_hit._width = this._tf_totalSkillPoint.textWidth + 10;
   }
}
