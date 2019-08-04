class g4.view.skillWindow.GrowSkillPanel_MaterialPanel extends gfx.core.UIComponent
{
   function GrowSkillPanel_MaterialPanel()
   {
      super();
      g4.view.skillWindow.SkillWindowController.getInstance().registerGrowSkillPanel_MaterialPanel(this);
   }
   function configUI()
   {
      this._mc_mask = this.mc_mask;
      this._scrollBar = this.scrollBar;
      this._mc_materialItemSlotGroup = this.mc_materialItemSlotGroup;
      this._materialItemSlots = [];
      this._mc_gold = this.mc_gold;
      this._tf_gold = this._mc_gold.tf_gold;
      this._tf_effectTitle = this._mc_materialItemSlotGroup.tf_effectTitle;
      this._tf_materialTitle = this._mc_materialItemSlotGroup.tf_materialTitle;
      this._tf_effectDesc = this._mc_materialItemSlotGroup.tf_effectDesc;
      this._mc_bg = this._mc_materialItemSlotGroup.mc_bg;
      this._enhanceInfo = this._mc_materialItemSlotGroup.enhanceInfo;
      this._tf_currentHeader = this._enhanceInfo.tf_currentHeader;
      this._tf_nextHeader = this._enhanceInfo.tf_nextHeader;
      this._tf_defaultDesc = this.tf_defaultDesc;
      this._tf_effectTitle.verticalAutoSize = "top";
      this._tf_effectDesc.verticalAutoSize = "top";
      this._tf_effectTitle.text = lib.util.UIString.getUIString2("$083026");
      this._tf_materialTitle.text = lib.util.UIString.getUIString("$083027");
      this._tf_currentHeader.text = lib.util.UIString.getUIString("$083035");
      this._tf_nextHeader.text = lib.util.UIString.getUIString("$083036");
      var _loc2_ = {};
      _loc2_.onScroll = g4.util.Delegate.create(this,this.onScroll);
      this._scrollBar.__set__displaySize(this._mc_mask._height);
      this._scrollBar.__set__rowHeight(10);
      this._scrollBar.setWheel(this._mc_materialItemSlotGroup);
      this._scrollBar.addListener(_loc2_);
      this._enhanceInfo.tf_currentTitle.verticalAutoSize = "top";
      this._enhanceInfo.tf_nextTitle.verticalAutoSize = "top";
      this._enhanceInfo.tf_current.verticalAutoSize = "top";
      this._enhanceInfo.tf_next.verticalAutoSize = "top";
      this._tf_defaultDesc._visible = false;
      this._tf_defaultDesc.verticalAlign = "center";
      this._tf_defaultDesc.text = lib.util.UIString.getUIString2("$083037");
   }
   function showGrowSkillDetailEnhance(abilityNames, currentValues, nextValues)
   {
      this._tf_defaultDesc._visible = false;
      this._scrollBar.__set__scroll(0);
      this._tf_effectTitle._visible = this._tf_effectDesc._visible = false;
      this._enhanceInfo._visible = true;
      this.setAbilityInfo(this._enhanceInfo.tf_currentTitle,this._enhanceInfo.tf_current,abilityNames,currentValues);
      if(nextValues == null || nextValues[0] == null || nextValues[0] == "")
      {
         this._tf_nextHeader._visible = false;
         this._enhanceInfo.tf_nextTitle._visible = false;
         this._enhanceInfo.tf_next._visible = false;
         var _loc3_ = Math.max(this._enhanceInfo.tf_current._y + this._enhanceInfo.tf_current.textHeight + 20,this._enhanceInfo.tf_currentTitle._y + this._enhanceInfo.tf_currentTitle.textHeight + 20);
         this._enhanceInfo.mc_line._y = _loc3_;
      }
      else
      {
         this._tf_currentHeader._visible = true;
         this._enhanceInfo.tf_nextTitle._visible = true;
         this._enhanceInfo.tf_next._visible = true;
         this.setAbilityInfo(this._enhanceInfo.tf_nextTitle,this._enhanceInfo.tf_next,abilityNames,nextValues);
         this._tf_nextHeader._y = Math.max(this._enhanceInfo.tf_current._y + this._enhanceInfo.tf_current.textHeight + 16,this._enhanceInfo.tf_currentTitle._y + this._enhanceInfo.tf_currentTitle.textHeight + 16);
         this._enhanceInfo.tf_nextTitle._y = this._tf_nextHeader._y + 17;
         this._enhanceInfo.tf_next._y = this._tf_nextHeader._y + 17;
         this._enhanceInfo.mc_line._y = Math.max(this._enhanceInfo.tf_next._y + this._enhanceInfo.tf_next.textHeight + 20,this._enhanceInfo.tf_nextTitle._y + this._enhanceInfo.tf_nextTitle.textHeight + 20);
      }
   }
   function setAbilityInfo(tf_title, tf_value, abilityNames, abilityValues)
   {
      var _loc4_ = "";
      var _loc3_ = "";
      var _loc2_ = 0;
      while(_loc2_ < abilityNames.length)
      {
         _loc4_ = _loc4_ + abilityNames[_loc2_];
         _loc3_ = _loc3_ + abilityValues[_loc2_];
         tf_title.text = _loc4_;
         tf_value.text = _loc3_;
         if(_loc2_ < abilityNames.length - 1)
         {
            var _loc1_ = 0;
            if(tf_title.numLines > tf_value.numLines)
            {
               _loc1_ = tf_title.numLines - tf_value.numLines;
               while(_loc1_ > 0)
               {
                  _loc3_ = _loc3_ + "\n";
                  _loc1_ = _loc1_ - 1;
               }
            }
            else if(tf_title.numLines < tf_value.numLines)
            {
               _loc1_ = tf_value.numLines - tf_title.numLines;
               while(_loc1_ > 0)
               {
                  _loc4_ = _loc4_ + "\n";
                  _loc1_ = _loc1_ - 1;
               }
            }
            _loc4_ = _loc4_ + "\n";
            _loc3_ = _loc3_ + "\n";
         }
         _loc2_ = _loc2_ + 1;
      }
      tf_title.text = _loc4_;
      tf_value.text = _loc3_;
   }
   function moveArrow($index)
   {
   }
   function showGrowSkillDetailOptionSkillEffectDesc($optionSkillEffectDesc)
   {
      if($optionSkillEffectDesc == "")
      {
         this._tf_defaultDesc._visible = true;
         this._tf_effectTitle._visible = this._tf_effectDesc._visible = false;
      }
      else
      {
         this._tf_effectDesc.htmlText = $optionSkillEffectDesc;
         this._tf_defaultDesc._visible = false;
         this._tf_effectTitle._visible = this._tf_effectDesc._visible = true;
      }
      this._enhanceInfo._visible = false;
   }
   function showGrowSkillDetailMaterialGroup(tempNeedMaterials, needGold, hasGold)
   {
      var _loc8_ = undefined;
      if(this._enhanceInfo._visible == true)
      {
         _loc8_ = this._enhanceInfo.mc_line._y + 17;
      }
      else
      {
         _loc8_ = this._tf_effectDesc._y + this._tf_effectDesc.textHeight + 25;
      }
      this._tf_materialTitle._y = _loc8_;
      var _loc2_ = 0;
      while(_loc2_ < this._materialItemSlots.length)
      {
         var _loc4_ = this._materialItemSlots[_loc2_];
         _loc4_.removeMovieClip();
         _loc2_ = _loc2_ + 1;
      }
      var _loc6_ = 10;
      this._materialItemSlots.length = 0;
      if(tempNeedMaterials != null)
      {
         _loc2_ = 0;
         while(_loc2_ < tempNeedMaterials.length)
         {
            var _loc5_ = tempNeedMaterials[_loc2_];
            var _loc3_ = (g4.view.skillWindow.GrowSkillPanel_MaterialItemSlot)this._mc_materialItemSlotGroup.attachMovie("g4.view.skillWindow.GrowSkillPanel_MaterialItemSlot","materialItemSlot" + _loc2_,this._mc_materialItemSlotGroup.getNextHighestDepth());
            _loc3_._x = 71 + _loc2_ % 4 * 70;
            _loc6_ = _loc8_ + 2 + Math.floor(_loc2_ / 4) * 70;
            _loc3_._y = _loc6_;
            this._materialItemSlots[_loc2_] = _loc3_;
            _loc3_.setData(_loc5_);
            _loc3_.showMaterialItemSlot();
            _loc2_ = _loc2_ + 1;
         }
         this._tf_materialTitle._visible = true;
      }
      else
      {
         this._tf_materialTitle._visible = false;
      }
      this._mc_bg._height = _loc6_ + 53;
      this._scrollBar.__set__pageSize(this._mc_bg._height);
      if(needGold == -1)
      {
         this._mc_gold._visible = false;
      }
      else
      {
         var _loc10_ = hasGold >= needGold?lib.util.GoldCurrency.SetGoldText(needGold,0,0,0,0):lib.util.GoldCurrency.SetGoldText(needGold,0,0,"-1",0);
         this._tf_gold.htmlText = _loc10_;
         this._mc_gold._visible = true;
      }
   }
   function onScroll(postion, scroll)
   {
      this._mc_materialItemSlotGroup._y = - postion;
   }
}
