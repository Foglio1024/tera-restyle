class g4.view.skillWindow.GrowSkillPanel_EnhancePanel extends g4.core.G4UIComponent
{
   function GrowSkillPanel_EnhancePanel()
   {
      super();
      g4.view.skillWindow.SkillWindowController.getInstance().registerGrowSkillPanel_EnhancePanel(this);
   }
   function configUI()
   {
      this._mc_arrow = this.mc_arrow;
      this._mc_prevRenderer = this.mc_prevRenderer;
      this._mc_nextRenderer = this.mc_nextRenderer;
   }
   function showGrowSkillDetailEnhance(currentLevel, nextLevel)
   {
      this._mc_prevRenderer.tf_level.text = String(currentLevel);
      this._mc_nextRenderer.tf_level.text = String(nextLevel);
      if(nextLevel == -1)
      {
         this._mc_nextRenderer._visible = false;
         this._mc_arrow._visible = false;
         this._mc_prevRenderer._x = 68;
      }
      else
      {
         this._mc_nextRenderer._visible = true;
         this._mc_arrow._visible = true;
         this._mc_prevRenderer._x = 0;
      }
   }
   function showGrowSkillSlotEffect()
   {
      this._mc_prevRenderer.mc_effect.gotoAndPlay(2);
      lib.manager.UISound.play(1213);
   }
}
