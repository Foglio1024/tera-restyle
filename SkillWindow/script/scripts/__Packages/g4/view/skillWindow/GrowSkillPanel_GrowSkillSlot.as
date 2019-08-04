class g4.view.skillWindow.GrowSkillPanel_GrowSkillSlot extends gfx.core.UIComponent
{
   function GrowSkillPanel_GrowSkillSlot()
   {
      super();
   }
   function __get__growSkillSlotP()
   {
      return this._growSkillSlotP;
   }
   function __get__selected()
   {
      return this._slotBtn.__get__selected();
   }
   function __set__selected(value)
   {
      this._slotBtn.__set__selected(value);
      return this.__get__selected();
   }
   function __get__mouseEnabled()
   {
      return this.enabled;
   }
   function __set__mouseEnabled(value)
   {
      this._slotBtn.__set__mouseEnabled(value);
      this._skillSlot.__set__mouseEnabled(value);
      return this.__get__mouseEnabled();
   }
   function configUI()
   {
      super.configUI();
      this._tf_name = this.tf_name;
      this._tf_enhanceLevel = this.tf_enhanceLevel;
      this._tf_level = this.tf_level;
      this._mc_arrow = this.mc_arrow;
      this._optionBtn = this.optionBtn;
      this._slotBtn = this.slotBtn;
      this._mc_effect = this.mc_effect;
      this._mc_modal = this.mc_modal;
      this._skillSlot = this._slotBtn.skillSlot;
      this._slotBtn.addEventListener(gfx.events.EventTypes.CLICK,this,this.onSkillSlotClick);
      this._optionBtn.addEventListener(gfx.events.EventTypes.CLICK,this,this.onOptionBtnClick);
      this.__set__mouseEnabled(true);
      this._mc_arrow._visible = false;
   }
   function setData(growSkillSlotP)
   {
      this._growSkillSlotP = growSkillSlotP;
      this._skillSlot.setData(this._growSkillSlotP.skillSlotP);
      g4.manager.TooltipManager.getInstance().removeTooltip(this._slotBtn);
      g4.manager.TooltipManager.getInstance().addUiTooltip(g4.view.ViewID.SKILL_WINDOW,this._slotBtn,this._growSkillSlotP.skillSlotP.Id,0);
   }
   function showGrowSkillSlot()
   {
      this._tf_level.htmlText = "Lv.<font color=\'#6c7d8a\'>" + this._growSkillSlotP.skillSlotP.Level + "</font>";
      this._mc_arrow._visible = this._growSkillSlotP.IsShowArrow;
      var _loc2_ = this._optionBtn.iconContainer;
      _loc2_.clear();
      if(this._growSkillSlotP.EnhanceSkillLevel == -1)
      {
         this._optionBtn.__set__disabled(false);
         this._optionBtn.tf_level._visible = false;
         var _loc3_ = 0.34375;
         if(this._growSkillSlotP.SelectedOptionSkillIconPath == "")
         {
            this._optionBtn.mc_lock._visible = true;
         }
         else
         {
            this._optionBtn.mc_lock._visible = false;
            lib.display.DrawBitmapData.draw(_loc2_,flash.display.BitmapData.loadBitmap(this._growSkillSlotP.SelectedOptionSkillIconPath),0,0,0,0,22,22,_loc3_,_loc3_);
         }
         this._tf_enhanceLevel._visible = false;
      }
      else
      {
         this._optionBtn.__set__disabled(true);
         this._optionBtn.mc_lock._visible = false;
         this._optionBtn.tf_level._visible = true;
         this._tf_enhanceLevel._visible = true;
         this._tf_enhanceLevel.text = this._growSkillSlotP.EnhanceSkillLevel + " / " + this._growSkillSlotP.EnhanceSkillMaxLevel;
         if(this._growSkillSlotP.EnhanceSkillLevel >= this._growSkillSlotP.EnhanceSkillMaxLevel)
         {
            this._optionBtn.tf_level.text = lib.util.UIString.getUIString("$083038");
            this._optionBtn.mc_bg.gotoAndStop(2);
            this._optionBtn.tf_level.filters = [new flash.filters.DropShadowFilter(0,90,8535296,1,2,2,2,0,false,false,false)];
         }
         else
         {
            this._optionBtn.tf_level.text = this._growSkillSlotP.EnhanceSkillLevel;
            this._optionBtn.mc_bg.gotoAndStop(1);
            this._optionBtn.tf_level.filters = [new flash.filters.DropShadowFilter(0,90,0,1,2,2,2,0,false,false,false)];
         }
      }
      this._skillSlot.updateSlot();
      this._tf_name.text = this._growSkillSlotP.skillSlotP.Name;
      this._mc_modal._visible = this._growSkillSlotP.skillSlotP.Disable;
   }
   function showGrowSkillSlotEffect()
   {
      this._mc_effect.gotoAndPlay(2);
   }
   function onSkillSlotClick()
   {
      g4.view.skillWindow.SkillWindowController.getInstance().ToGame_SkillWindow_SelectGrowSkill(this._growSkillSlotP.skillSlotP.Id);
   }
   function onOptionBtnClick()
   {
      lib.manager.UISound.play(4001);
      g4.view.skillWindow.SkillWindowController.getInstance().ToGame_SKillWIndow_SelectGrowSkillOptionButton(this._growSkillSlotP.skillSlotP.Id);
   }
}
