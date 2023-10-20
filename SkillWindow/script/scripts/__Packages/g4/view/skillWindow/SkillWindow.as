class g4.view.skillWindow.SkillWindow extends g4.core.View
{
   var CREST_STATE_INACTIVE = 0;
   var CREST_STATE_ACTIVE = 1;
   var CREST_STATE_LOCK = 2;
   var CREST_STATE_DISABLE = 3;
   var CREST_SLOT_WIDTH = 35.5;
   var CREST_INFO_COUNT = 7;
   var MAX_CREST = 6;
   var TAB_WIDTH = 92;
   var TAB_HEIGHT = 35;
   var tabLength = 0;
   var currentPoint = 0;
   var totalPoint = 0;
   var SLOT_WIDTH = 262.5;
   var SLOT_HEIGHT_MODE_0 = 42.5;
   var SLOT_HEIGTH_MODE_1 = 43;
   var _slotPrefix = "SkillWindow__";
   var _bWidgetOpen = false;
   var _curViewMode = 0;
   var _pressedSaveBtn = null;
   var _bChange = false;
   var _rightClicked = false;
   var _crestArray = [];
   var _targetIndex = null;
   var _rightClickedTarget = null;
   var _bChangePathTime = false;
   var _pressedSkillSlot = null;
   var _releasedSkillSlot = null;
   function SkillWindow($targetMovie)
   {
      super($targetMovie);
      g4.view.skillWindow.SkillWindowController.getInstance().registerSkillWindow(this);
      this._defaultViewPanel = new g4.view.skillWindow.DefaultViewPanel($targetMovie.container_mc.defaultViewPanel);
      this._totalViewPanel = new g4.view.skillWindow.TotalViewPanel($targetMovie.container_mc.totalViewPanel);
   }
   function getUIName()
   {
      return g4.view.ViewID.SKILL_WINDOW;
   }
   function configGameInterface()
   {
      g4.view.skillWindow.SkillWindowController.getInstance().registerGameInterfaces(g4.util.Delegate.create(this,this.registerGameInterface));
   }
   function configUI()
   {
      this._container_mc = this.__get__targetMovieClip().container_mc;
      this._tabBtn = this._container_mc.tabBtn.tab;
      this._skillState0 = lib.util.UIString.getUIString("$082052");
      this._skillState1 = lib.util.UIString.getUIString("$082053");
      this._secondStr = lib.util.UIString.getUIString("$101068");
      this._growSkillPanel = this._container_mc.growSkillPanel;
      this._growSkillPanel._visible = false;
      this._bottomButtonGroup = this._container_mc.bottomButtonGroup;
      this._coolTimeManager = lib.util.CoolTimeManger.getInstance();
      this.__get__targetMovieClip()._visible = false;
      this._bottomButtonGroup.viewBtn_0.id = 0;
      this._bottomButtonGroup.viewBtn_1.id = 1;
      var _loc3_ = 1;
      while(_loc3_ < 6)
      {
         var _loc5_ = this._bottomButtonGroup["saveBtn_" + _loc3_];
         _loc5_.id = _loc3_;
         this.setMouseEventSaveBtn(_loc5_);
         _loc3_ = _loc3_ + 1;
      }
      this.setMouseEvent(this._bottomButtonGroup.viewBtn_0,lib.util.UIString.getUIString("$082049"));
      this.setMouseEvent(this._bottomButtonGroup.viewBtn_1,lib.util.UIString.getUIString("$082050"));
      this.setViewMode();
      this.setViewBtn();
      var _loc13_ = this._bottomButtonGroup.pathBtn.txtBtn;
      _loc13_.setRelease(g4.view.skillWindow.SkillWindowController.getInstance().ToGame_SkillWindow_Path);
      var _loc11_ = this._bottomButtonGroup.resetCrestBtn.txtBtn;
      _loc11_.setRelease(g4.view.skillWindow.SkillWindowController.getInstance().ToGame_SkillWindow_Reset);
      var _loc12_ = this._bottomButtonGroup.recommendCrestBtn.txtBtn;
      _loc12_.setRelease(g4.view.skillWindow.SkillWindowController.getInstance().ToGame_SkillWindow_Recommend);
      this._container_mc.UIDrager.setData(this.getUIName(),this.__get__targetMovieClip(),this._container_mc.lock_mc);
      this._container_mc.title_txt.textColor = lib.info.TextColor.UI_TITLE_ACTIVE;
      var scope = this;
      this._container_mc.pathSkillMc.SkillWindow__pathSlot.slotHit.onPress = function()
      {
         scope._pressedSkillSlot = this;
      };
      this._container_mc.pathSkillMc.SkillWindow__pathSlot.slotHit.onDragOut = function()
      {
         if(this == scope._pressedSkillSlot)
         {
            var _loc3_ = this._parent.TEX;
            if(_loc3_ != undefined)
            {
               _global.StartIconDrag(this._parent,_loc3_);
            }
         }
      };
      this._defaultViewPanel.__get__pathSkillMc().checkBox.onChanged = function(changed)
      {
         g4.view.skillWindow.SkillWindowController.getInstance().ToGame_SkillWindow_ChangePathSkillCheck(changed);
      };
      var _loc7_ = new lib.util.ExtTextField(this._defaultViewPanel.__get__pathSkillMc().timeMc.textFd,1,this._defaultViewPanel.__get__pathSkillMc().timeMc.focusMc);
      _loc7_.exceptComma = true;
      _loc7_.onEnterKey = function()
      {
         scope._bChangePathTime = false;
         Selection.setFocus(null);
         var _loc3_ = Number(this.text);
         var _loc2_ = "";
         if(_loc3_ == NaN)
         {
            _loc2_ = scope._defaultViewPanel.__get__pathSkillMc().timeMc.timeText;
            scope._defaultViewPanel.__get__pathSkillMc().timeMc.textFd.text = _loc2_ + scope._secondStr;
         }
         else
         {
            _loc2_ = this.text;
            scope._defaultViewPanel.__get__pathSkillMc().timeMc.timeText = _loc2_;
            this.text = _loc2_ + scope._secondStr;
            g4.view.skillWindow.SkillWindowController.getInstance().ToGame_SkillWindow_ChangePathTime(_loc2_);
         }
      };
      _loc7_.onKillFocusEvent = function()
      {
         scope._bChangePathTime = false;
         var _loc3_ = Number(this.text);
         var _loc2_ = "";
         if(_loc3_ == NaN)
         {
            _loc2_ = scope._defaultViewPanel.__get__pathSkillMc().timeMc.timeText;
            scope._defaultViewPanel.__get__pathSkillMc().timeMc.textFd.text = _loc2_ + scope._secondStr;
         }
         else
         {
            _loc2_ = this.text;
            scope._defaultViewPanel.__get__pathSkillMc().timeMc.timeText = _loc2_;
            this.text = _loc2_ + scope._secondStr;
            g4.view.skillWindow.SkillWindowController.getInstance().ToGame_SkillWindow_ChangePathTime(_loc2_);
         }
      };
      this._defaultViewPanel.__get__pathSkillMc().timeMc.textFd.onChanged = function()
      {
         scope._bChangePathTime = true;
         if(Number(this.text) > 99)
         {
            this.text = 99 + scope._secondStr;
         }
      };
      var _loc10_ = new lib.util.TxtBtn(this._container_mc.closeBtn);
      _loc10_.setRelease(g4.view.skillWindow.SkillWindowController.getInstance().ToGame_SkillWindow_CloseUI);
      g4.view.skillWindow.SkillWindowController.getInstance().ToGame_SkillWindow_Init();
      this._tabButtons = [];
      this._tabButtonGroup = new g4.component.ButtonGroup();
      _loc3_ = 0;
      while(_loc3_ < 4)
      {
         var _loc4_ = this._container_mc["tabBtn" + _loc3_];
         this._tabButtons.push(_loc4_);
         this._tabButtonGroup.addButton(_loc4_);
         _loc3_ = _loc3_ + 1;
      }
   }
   function setStateSaveBtn(targetBtn, btnState)
   {
      btnState = Number(btnState);
      targetBtn.btnState = btnState;
      var _loc3_ = btnState != 0?1:4;
      if(btnState == 2)
      {
         _loc3_ = 5;
         this._pressedSaveBtn = targetBtn;
      }
      targetBtn.gotoAndStop(_loc3_);
   }
   function setMouseEventSaveBtn(targetBtn)
   {
      this.setRollOverSaveBtn(targetBtn);
      this.setRollOutSaveBtn(targetBtn);
      this.setPressSaveBtn(targetBtn);
      this.setReleaseSaveBtn(targetBtn);
      this.setReleaseOutsideSaveBtn(targetBtn);
   }
   function setRollOverSaveBtn(targetBtn)
   {
      targetBtn.onRollOver = function()
      {
         this.gotoAndStop(2);
      };
   }
   function setRollOutSaveBtn(targetBtn)
   {
      var scope = this;
      targetBtn.onRollOut = function()
      {
         var _loc2_ = this.btnState != 1?4:1;
         _loc2_ = scope._pressedSaveBtn != this?_loc2_:5;
         this.gotoAndStop(_loc2_);
      };
   }
   function setPressSaveBtn(targetBtn)
   {
      targetBtn.onPress = function()
      {
         this.gotoAndStop(3);
      };
   }
   function setReleaseSaveBtn(targetBtn)
   {
      var scope = this;
      targetBtn.onRelease = function()
      {
         if(scope._pressedSaveBtn == this)
         {
            return undefined;
         }
         lib.manager.UISound.play(lib.manager.UISound.MAIN_BTN);
         scope._pressedSaveBtn = this;
         g4.view.skillWindow.SkillWindowController.getInstance().ToGame_SkillWindow_ChangeCrestSaveBtn(this.id);
      };
   }
   function setReleaseOutsideSaveBtn(targetBtn)
   {
      var scope = this;
      targetBtn.onReleaseOutside = function()
      {
         var _loc2_ = this.btnState != 1?1:5;
         _loc2_ = scope._pressedSaveBtn != this?_loc2_:3;
         this.gotoAndStop(_loc2_);
      };
   }
   function clearTag(index)
   {
      if(index != undefined)
      {
         var _loc4_ = this._container_mc["tabTag_" + index];
         if(_loc4_ != undefined)
         {
            _loc4_.removeMovieClip();
         }
         return undefined;
      }
      var _loc2_ = 0;
      while(_loc2_ < this.tabLength)
      {
         var _loc3_ = this._container_mc["tabTag_" + _loc2_];
         if(_loc3_ != undefined)
         {
            _loc3_.removeMovieClip();
         }
         _loc2_ = _loc2_ + 1;
      }
   }
   function createTag(index, tagNum)
   {
      (MovieClip)this._container_mc["tabTag_" + index].removeMovieClip();
      if(tagNum == -1)
      {
         return undefined;
      }
      var _loc2_ = this._container_mc.attachMovie("tagBox","tabTag_" + index,this._container_mc.getNextHighestDepth());
      var _loc3_ = this._container_mc.tabBtn0;
      _loc2_._xscale = _loc2_._yscale = 80;
      _loc2_.txt.text = tagNum;
      _loc2_._x = _loc3_._x + this.TAB_WIDTH * (index + 1) - _loc2_._width;
      _loc2_._y = _loc3_._y - 7;
      _loc2_.hitTestDisable = true;
   }
   function setViewBtn()
   {
      var _loc3_ = Number(!this._curViewMode);
      var _loc4_ = this._bottomButtonGroup["viewBtn_" + _loc3_];
      var _loc2_ = this._bottomButtonGroup["viewBtn_" + this._curViewMode];
      _loc4_.gotoAndStop(1);
      _loc2_.gotoAndStop(3);
   }
   function setMouseEvent(btn, message)
   {
      var scope = this;
      btn.onRollOver = function()
      {
         this.gotoAndStop(2);
         g4.manager.TooltipManager.getInstance().showMessageTooltip(btn,message);
      };
      btn.onRollOut = function()
      {
         var _loc2_ = this.id != scope._curViewMode?1:3;
         this.gotoAndStop(_loc2_);
         g4.manager.TooltipManager.getInstance().hideTooltip();
      };
      btn.onPress = function()
      {
         this.gotoAndStop(3);
      };
      btn.onRelease = function()
      {
         if(scope._curViewMode == this.id)
         {
            return undefined;
         }
         lib.manager.UISound.play(lib.manager.UISound.MAIN_BTN);
         scope._curViewMode = this.id;
         scope.clearSkillContainer();
         g4.view.skillWindow.SkillWindowController.getInstance().ToGame_SkillWindow_ChangeViewMode(this.id);
         scope.setViewMode();
         scope.setViewBtn();
      };
      btn.onReleaseOutside = function()
      {
         var _loc2_ = this.id != scope._curViewMode?1:3;
         this.gotoAndStop(_loc2_);
         g4.manager.TooltipManager.getInstance().hideTooltip();
      };
   }
   function setCrest(info)
   {
      this._bChange = false;
      var _loc11_ = this._curViewMode != 0?this._totalViewPanel.__get__skillListContainer():this._defaultViewPanel.__get__skillListContainer();
      var _loc10_ = info.shift();
      var _loc7_ = _loc11_[this._slotPrefix + _loc10_];
      if(_loc7_ == undefined)
      {
         _loc7_ = this.createSlot(_loc11_,_loc10_);
      }
      else
      {
         this.clearCrest(_loc7_);
      }
      var _loc9_ = info.shift();
      if(_loc9_ != "" && _loc9_ != undefined && _loc9_ != "undefined" && _loc9_ != null)
      {
         _loc7_.descFd.setText(_loc9_);
      }
      else
      {
         var _loc3_ = 0;
         while(_loc3_ < info.length)
         {
            var _loc6_ = int(_loc3_ / this.CREST_INFO_COUNT);
            var _loc4_ = [];
            var _loc2_ = 0;
            while(_loc2_ < this.CREST_INFO_COUNT)
            {
               _loc4_[_loc2_] = info[_loc3_ + _loc2_];
               _loc2_ = _loc2_ + 1;
            }
            this.setCrestSlot(_loc7_,_loc6_,_loc4_);
            _loc3_ = _loc3_ + this.CREST_INFO_COUNT;
         }
      }
      var _loc8_ = _loc7_.disableMc;
      if(_loc7_.disable)
      {
         if(_loc8_ == undefined)
         {
            _loc8_ = _loc7_.attachMovie("disableMc_" + this._curViewMode,"disableMc",_loc7_.getNextHighestDepth());
         }
         _loc8_.hitTestDisable = true;
         _loc8_._x = 4;
         _loc8_._y = 4;
         _loc8_.disableMc._x = 0;
         _loc8_.disableMc._width = this._curViewMode != 0?258:181;
         _loc8_._visible = true;
         if(_loc7_.skillState > 1)
         {
            _loc8_.disableMc._x = 39;
            _loc8_.disableMc._width = this._curViewMode != 0?219:142;
         }
      }
      else if(_loc8_ != undefined)
      {
         _loc8_.removeMovieClip();
      }
   }
   function setCrestSlot(parentSlot, crestIndex, crestData)
   {
      var _loc2_ = parentSlot["crest__" + crestIndex];
      if(_loc2_ == undefined)
      {
         _loc2_ = parentSlot.attachMovie("crestSlot","crest__" + crestIndex,parentSlot.getNextHighestDepth());
         var _loc9_ = [193,49];
         var _loc12_ = _loc9_[this._curViewMode];
         _loc2_._x = _loc12_ + this.CREST_SLOT_WIDTH * crestIndex;
         _loc2_._y = 6;
      }
      this.clearCrestSlot(_loc2_);
      var _loc10_ = parentSlot.slotIndex;
      var _loc11_ = crestData[0];
      var _loc16_ = crestData[1];
      var _loc14_ = crestData[2];
      var _loc15_ = crestData[3];
      var _loc5_ = Number(crestData[4]);
      var _loc4_ = Number(crestData[5]);
      var _loc6_ = Number(crestData[6]);
      _loc2_._visible = true;
      _loc2_.slotIndex = _loc10_;
      _loc2_.crestIndex = crestIndex;
      _loc2_.crestId = _loc11_;
      _loc2_.crestRealId = _loc16_;
      _loc2_.crestState = _loc5_;
      _loc2_.point = _loc6_;
      _loc2_.grade = _loc4_;
      _loc2_.TEX = _loc14_;
      _loc2_.disableTEX = _loc15_;
      _loc2_.overMc._visible = false;
      var _loc17_ = _loc4_ <= 0?false:true;
      _loc2_.gradeMc._visible = _loc17_;
      _loc2_.gradeMc.gotoAndStop(_loc4_);
      _loc2_.pointFd.text = _loc6_;
      if(_loc5_ == this.CREST_STATE_INACTIVE)
      {
         var _loc13_ = this._crestArray.push(_loc2_) - 1;
         _loc2_.arrayIndex = _loc13_;
      }
      else
      {
         this.setStateOnCrestSlot(_loc2_);
      }
   }
   function setStateOnCrestSlot(target)
   {
      var _loc5_ = target.crestState;
      var _loc11_ = target.grade;
      var _loc3_ = _loc5_ != this.CREST_STATE_ACTIVE?false:true;
      var _loc7_ = _loc5_ != this.CREST_STATE_LOCK?false:true;
      var _loc10_ = _loc5_ != this.CREST_STATE_ACTIVE?false:true;
      var _loc8_ = _loc5_ != this.CREST_STATE_INACTIVE?false:true;
      var _loc4_ = _loc11_ <= 0?1:2;
      var _loc9_ = !(_loc5_ == this.CREST_STATE_INACTIVE || _loc5_ == this.CREST_STATE_ACTIVE)?target.disableTEX:target.TEX;
      var _loc6_ = !(_loc5_ == this.CREST_STATE_INACTIVE || _loc5_ == this.CREST_STATE_ACTIVE)?"0x707070":"0xC9C9C9";
      target.lockMc._visible = _loc7_;
      target.lockBg._visible = !_loc3_;
      target.lineMc._visible = _loc10_;
      target.bg._visible = _loc3_;
      target.inactiveMc._visible = _loc8_;
      target.bg.gotoAndStop(_loc4_);
      target.lockBg.gotoAndStop(_loc4_);
      target.pointFd.textColor = _loc6_;
      lib.util.DrawBitmap.draw(target.img,_loc9_,24,24);
      target.isLock = !(_loc5_ == this.CREST_STATE_INACTIVE || _loc5_ == this.CREST_STATE_ACTIVE);
      target.slotHit.onRollOver = function()
      {
         g4.manager.TooltipManager.getInstance().showUiTooltip(g4.view.ViewID.SKILL_WINDOW,this,this._parent.crestRealId,1);
         if(this._parent.isLock == true)
         {
            return undefined;
         }
         this._parent.overMc._visible = true;
      };
      target.slotHit.onRollOut = function()
      {
         g4.manager.TooltipManager.getInstance().hideTooltip();
         if(this._parent.isLock == true)
         {
            return undefined;
         }
         this._parent.overMc._visible = false;
      };
      target.slotHit.onDragOut = function()
      {
         g4.manager.TooltipManager.getInstance().hideTooltip();
      };
      target.slotHit.onPress = function()
      {
      };
      target.slotHit.onRelease = function()
      {
         if(this._parent.isLock == true)
         {
            return undefined;
         }
         lib.manager.UISound.play(lib.manager.UISound.MAIN_BTN);
         var _loc2_ = this._parent.crestState;
         if(_loc2_ == this.CREST_STATE_INACTIVE)
         {
            this._parent.crestNewEffect.gotoAndPlay(2);
         }
         g4.view.skillWindow.SkillWindowController.getInstance().ToGame_SkillWindow_ChangeCrestState(this._parent);
      };
      target.slotHit.onReleaseOutside = function()
      {
         if(this._parent.isLock == true)
         {
            return undefined;
         }
         this._parent.overMc._visible = false;
      };
   }
   function changeCrestState(target)
   {
      var _loc3_ = target.point;
      var _loc2_ = this.totalPoint - this.currentPoint;
      var _loc5_ = target.crestState;
      target.crestState = _loc3_ > _loc2_?this.CREST_STATE_DISABLE:this.CREST_STATE_INACTIVE;
      if(this._bChange == false)
      {
         this._bChange = _loc3_ > _loc2_?false:true;
      }
   }
   function setSkill(skillSlotP)
   {
      var _loc9_ = this._curViewMode != 0?this._totalViewPanel.__get__skillListContainer():this._defaultViewPanel.__get__skillListContainer();
      var _loc4_ = skillSlotP.Index;
      var _loc2_ = _loc9_[this._slotPrefix + _loc4_];
      if(_loc2_ == undefined)
      {
         _loc2_ = this.createSlot(_loc9_,_loc4_);
      }
      else
      {
         this.clearSkill(_loc2_);
      }
      var _loc15_ = skillSlotP.Id;
      var _loc8_ = skillSlotP.Name;
      var _loc7_ = skillSlotP.Img;
      var _loc14_ = flash.display.BitmapData.loadBitmap(_loc7_);
      var _loc11_ = Number(skillSlotP.Disable);
      var _loc6_ = Number(skillSlotP.State);
      var _loc5_ = Number(skillSlotP.Num);
      var _loc16_ = skillSlotP.Remain;
      var _loc12_ = skillSlotP.Total;
      var _loc10_ = Boolean(Number(skillSlotP.Awaken));
      this.OnGame_SkillWindow_CoolTime(_loc4_,_loc16_,_loc12_);
      _loc2_.slotIndex = _loc4_;
      _loc2_.skillId = _loc15_;
      var _loc13_ = !_loc10_?_loc8_:"<font color=\'#deb200\'>" + _loc8_ + "</font>";
      _loc2_.nameFd.htmlText = _loc13_;
      _loc2_.disable = _loc11_;
      _loc2_.skillState = _loc6_;
      _loc2_.TEX = _loc7_;
      _loc2_.awaken = _loc10_;
      lib.display.DrawBitmapData.draw(_loc2_.img,_loc14_,0,0,0,0,38,38,0.59);
      if(_loc6_ == 2)
      {
         _loc2_.nameFd.htmlText = _loc2_.nameFd.htmlText + this._skillState0;
      }
      else if(_loc6_ == 3)
      {
         _loc2_.nameFd.htmlText = _loc2_.nameFd.htmlText + this._skillState1;
      }
      if(_loc5_ != undefined && _loc5_ != "" && _loc5_ != "-1")
      {
         _loc2_.numFd.text = _loc5_;
      }
   }
   function setSkillState(slotIndex)
   {
      var _loc5_ = this._curViewMode != 0?this._totalViewPanel.__get__skillListContainer():this._defaultViewPanel.__get__skillListContainer();
      var _loc3_ = _loc5_[this._slotPrefix + slotIndex];
      var _loc2_ = _loc3_.skillState;
      var _loc8_ = _loc3_.awaken;
      _loc2_ = 1 >= _loc2_?_loc2_:2;
      var _loc9_ = !_loc8_?_loc2_:String(Number(_loc2_ + 50));
      var _loc4_ = _loc5_["stateMc_" + slotIndex];
      if(_loc4_ != undefined)
      {
         _loc4_.removeMovieClip();
      }
      if(_loc2_ > 0)
      {
         _loc4_ = _loc5_.attachMovie("slotStateMc_" + _loc9_,"stateMc_" + slotIndex,_loc5_.getNextHighestDepth());
         _loc4_._x = _loc2_ <= 1?_loc3_._x + 1.5:_loc3_._x + 1;
         _loc4_._y = _loc2_ <= 1?_loc3_._y + 1:_loc3_._y + 1;
         _loc4_.hitTestDisable = true;
      }
      if(_loc2_ == 1 && _loc8_)
      {
         var _loc7_ = _loc5_.attachMovie("awakenEffect","awakenEffect_" + slotIndex,_loc5_.getNextHighestDepth());
         _loc7_._x = _loc3_._x;
         _loc7_._y = _loc3_._y;
      }
   }
   function clearSkill(target)
   {
      var _loc6_ = target.slotIndex;
      target.clear();
      delete target.skillId;
      target.nameFd.htmlText = "";
      target.numFd.text = "";
      var _loc3_ = target.effectMc.coolTimeMc;
      if(_loc3_ != undefined)
      {
         this._coolTimeManager.removeCoolTimeInstance(_loc3_);
         _loc3_.removeMovieClip();
      }
      var _loc5_ = target.effectMc.activeMc;
      if(_loc5_ != undefined)
      {
         _loc5_.removeMovieClip();
      }
      var _loc4_ = target._parent["stateMc_" + _loc6_];
      if(_loc4_ != undefined)
      {
         _loc4_.removeMovieClip();
      }
   }
   function setViewMode()
   {
      this._container_mc.noticeFd._visible = this._tabButtonGroup.getSelectedButtonIndex() != 2 && !this._curViewMode;
      this._container_mc.noticeIcon._visible = this._tabButtonGroup.getSelectedButtonIndex() != 2 && !this._curViewMode;
      this._defaultViewPanel.setViewMode(this._curViewMode);
      this._totalViewPanel.__get__targetMovieClip()._visible = Number(this._curViewMode) == 1;
   }
   function clearCrest(target)
   {
      target.descFd.htmlText = "";
      var _loc2_ = 0;
      while(_loc2_ < this.MAX_CREST)
      {
         var _loc3_ = target["crest__" + _loc2_];
         if(_loc3_ != undefined)
         {
            this.clearCrestSlot(_loc3_);
         }
         _loc2_ = _loc2_ + 1;
      }
   }
   function changeCrestArrayIndex()
   {
      var _loc4_ = this._crestArray.length;
      var _loc2_ = 0;
      while(_loc2_ < _loc4_)
      {
         var _loc3_ = this._crestArray[_loc2_];
         _loc3_.arrayIndex = _loc2_;
         _loc2_ = _loc2_ + 1;
      }
   }
   function clearCrestSlot(slot)
   {
      if(slot.arrayIndex != undefined)
      {
         var _loc3_ = slot.arrayIndex;
         this._crestArray.splice(_loc3_,1);
         this.changeCrestArrayIndex();
      }
      slot.pointFd.text = "";
      slot.gradeMc._visible = false;
      slot.lockMc._visible = false;
      slot.lockBg._visible = false;
      slot.inactiveMc._visible = false;
      slot.bg._visible = true;
      slot._visible = false;
      delete slot.slotIndex;
      delete slot.crestIndex;
      delete slot.crestId;
      delete slot.crestRealId;
      delete slot.point;
      delete slot.grade;
      delete slot.TEX;
      delete slot.disableTEX;
      delete slot.arrayIndex;
   }
   function createSlot(container, slotIndex)
   {
      var _loc6_ = "slot_mode" + this._curViewMode;
      var _loc7_ = this._curViewMode != 0?slotIndex % 3 * this.SLOT_WIDTH:0;
      var _loc5_ = this._curViewMode != 0?int(slotIndex / 3) * this.SLOT_HEIGTH_MODE_1:slotIndex * this.SLOT_HEIGHT_MODE_0;
      var slot = container.attachMovie(_loc6_,this._slotPrefix + slotIndex,container.getNextHighestDepth());
      slot._x = _loc7_;
      slot._y = _loc5_;
      slot.overMc._visible = false;
      slot.pressMc._visible = false;
      slot.disableMc._visible = false;
      slot.numFd.text = "";
      slot.slotHit.slotName = "SKILLSLOT";
      slot.slotHit.trackAsMenu = true;
      slot.descFd.verticalAutoSize = "center";
      slot.nameFd.verticalAutoSize = "center";
      var scope = this;
      slot.slotHit.onRollOver = function()
      {
         g4.manager.TooltipManager.getInstance().showUiTooltip(g4.view.ViewID.SKILL_WINDOW,slot.slotHit,this._parent.skillId,0);
         if(this._parent.disable && this._parent.skillState != 2)
         {
            return undefined;
         }
         this._parent.overMc._visible = true;
      };
      slot.slotHit.onRollOut = function()
      {
         g4.manager.TooltipManager.getInstance().hideTooltip();
         if(this._parent.disable && this._parent.skillState != 2)
         {
            return undefined;
         }
         this._parent.overMc._visible = false;
      };
      slot.slotHit.onReleaseOutside = function()
      {
         this._parent.overMc._visible = false;
         if(scope._releasedSkillSlot == this)
         {
            return undefined;
         }
         this._parent.pressMc._visible = false;
      };
      slot.slotHit.onPress = function()
      {
         if(this._parent.disable && this._parent.skillState != 2)
         {
            return undefined;
         }
         scope._pressedSkillSlot = this;
         this._parent.pressMc._visible = true;
      };
      slot.slotHit.onRelease = function()
      {
         if(this._parent.disable && this._parent.skillState != 2)
         {
            return undefined;
         }
         lib.manager.UISound.play(lib.manager.UISound.MAIN_BTN);
         scope._releasedSkillSlot._parent.pressMc._visible = false;
         scope._releasedSkillSlot = this;
         if(scope._pressedSkillSlot == this)
         {
            g4.view.skillWindow.SkillWindowController.getInstance().ToGame_SkillWindow_SelectSkill(this._parent.slotIndex);
            scope._pressedSkillSlot = null;
         }
      };
      slot.slotHit.onDragOut = function()
      {
         g4.manager.TooltipManager.getInstance().hideTooltip();
         if(this == scope._pressedSkillSlot)
         {
            var _loc3_ = this._parent.TEX;
            if(_loc3_ != undefined)
            {
               _global.StartIconDrag(this._parent,_loc3_);
            }
         }
         if(this != scope._releasedSkillSlot)
         {
            this._parent.pressMc._visible = false;
         }
         this._parent.overMc._visible = false;
         g4.manager.TooltipManager.getInstance().hideTooltip();
      };
      slot.slotHit.GetName = function()
      {
         return this._parent._name;
      };
      return slot;
   }
   function clearSkillContainer()
   {
      this._crestArray = [];
      this._pressedSkillSlot = null;
      this._releasedSkillSlot = null;
      var _loc2_ = this._curViewMode != 0?this._totalViewPanel.__get__skillListContainer():this._defaultViewPanel.__get__skillListContainer();
      for(var _loc3_ in _loc2_)
      {
         if(typeof _loc2_[_loc3_] == "movieclip")
         {
            _loc2_[_loc3_].removeMovieClip();
         }
      }
      if(this._curViewMode == 0)
      {
         this._defaultViewPanel.clearPathSkill(true);
         this._defaultViewPanel.clearSkillContainer();
      }
   }
   function OnGameEventShowWindow(widgetName, bShow)
   {
      if(widgetName.toLowerCase() == this.getUIName().toLowerCase())
      {
         this._bWidgetOpen = bShow;
         if(_global.gbUIMode && this._bWidgetOpen)
         {
            this.__get__targetMovieClip()._visible = true;
            this._container_mc.lock_mc._x = 739;
            this._container_mc.lock_mc._y = 7;
            _root.OnGameEvent("OnGameEventShowWindow","ShortCut2",true);
         }
         else
         {
            this.__get__targetMovieClip()._visible = false;
            _root.OnGameEvent("OnGameEventShowWindow","ShortCut2",false);
         }
      }
   }
   function OnGameEventChangeUIMode(bShow)
   {
      if(_global.gbUIMode && this._bWidgetOpen)
      {
         this.__get__targetMovieClip()._visible = true;
      }
      else
      {
         this.__get__targetMovieClip()._visible = false;
         if(this._rightClicked)
         {
            this._rightClicked = false;
            this._rightClickedTarget.drag = true;
            if(this._targetIndex != undefined)
            {
            }
            this._rightClickedTarget = null;
         }
      }
   }
   function OnGame_SkillWindow_SetCrestSaveBtn(btnParam)
   {
      var _loc4_ = lib.util.ExtString.split(btnParam,"\t");
      var _loc2_ = 0;
      while(_loc2_ < _loc4_.length)
      {
         var _loc3_ = _loc2_ + 1;
         this.setStateSaveBtn(this._bottomButtonGroup["saveBtn_" + _loc3_],_loc4_[_loc2_]);
         _loc2_ = _loc2_ + 1;
      }
   }
   function OnGame_SkillWindow_SetTab(tabNames, tagNums, isAvtices, selectedTab, tooltipMessages)
   {
      this.clearTag();
      var _loc10_ = this._container_mc.tabBtn;
      this._container_mc.tabBtn.clear();
      var _loc5_ = 0;
      while(_loc5_ < tabNames.length)
      {
         var _loc3_ = this._container_mc["tabBtn" + _loc5_];
         var _loc2_ = tooltipMessages[_loc5_];
         if(_loc2_ != null && _loc2_ != undefined && _loc2_ != "undefined" && _loc2_ != "")
         {
            g4.manager.TooltipManager.getInstance().addMessageTooltip(_loc3_,_loc2_);
         }
         else
         {
            g4.manager.TooltipManager.getInstance().removeTooltip(_loc3_);
         }
         _loc3_.__set__label(tabNames[_loc5_]);
         _loc3_.__set__disabled(!isAvtices[_loc5_]);
         this._tabButtons.push(_loc3_);
         _loc5_ = _loc5_ + 1;
      }
      this._tabButtonGroup.addEventListener(gfx.events.EventTypes.ITEM_CLICK,this,this.onTabButtonGroupClick);
      this._tabButtonGroup.setSelectedButtonIndex(selectedTab);
      _loc5_ = 0;
      while(_loc5_ < tabNames.length)
      {
         var _loc4_ = Number(tagNums[_loc5_]);
         if(_loc4_ != undefined && _loc4_ != "" && _loc4_ != "undefined")
         {
            this.createTag(_loc5_,_loc4_);
         }
         _loc5_ = _loc5_ + 1;
      }
      if(selectedTab != 2)
      {
         this._defaultViewPanel.__get__targetMovieClip()._visible = true;
         this._growSkillPanel._visible = false;
         this._bottomButtonGroup._visible = true;
         this.setViewMode();
      }
      else
      {
         this._defaultViewPanel.__get__targetMovieClip()._visible = false;
         this._totalViewPanel.__get__targetMovieClip()._visible = false;
         this._growSkillPanel._visible = true;
         this._bottomButtonGroup._visible = false;
      }
   }
   function OnGame_SkillWindow_SetGuideText(guideText)
   {
      if(guideText == "" || guideText == undefined || guideText == null || guideText == "undefined")
      {
         guideText = "";
      }
      this._container_mc.noticeFd.htmlText = guideText;
   }
   function OnGame_SkillWindow_SetViewMode(viewMode)
   {
      this.clearSkillContainer();
      this._curViewMode = Number(viewMode);
      this.setViewMode();
      this.setViewBtn();
   }
   function OnGame_SkillWindow_SetSkill(skillData, selectedSlot)
   {
      var _loc10_ = this._defaultViewPanel.__get__skillListContainer()._height;
      if(skillData == undefined || skillData == "" || skillData == "undefined" || skillData == null)
      {
         this.clearSkillContainer();
         this._defaultViewPanel.__get__skillListScroll().__set__pageSize(this._defaultViewPanel.__get__skillListContainer()._height);
         return undefined;
      }
      var _loc5_ = g4.util.JSON.parse(skillData);
      var _loc4_ = [];
      var _loc3_ = 0;
      while(_loc3_ < _loc5_.length)
      {
         var _loc2_ = new g4.gameInterface.dataP.SkillSlotP(_loc5_[_loc3_]);
         if(Number(_loc2_.State) > 0)
         {
            _loc4_.push(_loc2_.Index);
         }
         this.setSkill(_loc2_);
         _loc3_ = _loc3_ + 1;
      }
      _loc3_ = 0;
      while(_loc3_ < _loc4_.length)
      {
         this.setSkillState(_loc4_[_loc3_]);
         _loc3_ = _loc3_ + 1;
      }
      if(this._curViewMode == 0)
      {
         var _loc9_ = this._defaultViewPanel.__get__skillListContainer()._height;
         if(_loc10_ != _loc9_)
         {
            this._defaultViewPanel.__get__skillListScroll().__set__pageSize(_loc9_);
         }
         if(selectedSlot != "undefined" && selectedSlot != undefined && selectedSlot != "" && selectedSlot != null)
         {
            selectedSlot = Number(selectedSlot);
            var _loc8_ = this._defaultViewPanel.__get__skillListContainer()[this._slotPrefix + selectedSlot];
            this._releasedSkillSlot = _loc8_.slotHit;
            _loc8_.pressMc._visible = true;
         }
      }
   }
   function OnGame_SkillWindow_SetCrest(crestData, current, total)
   {
      var _loc9_ = this._defaultViewPanel.__get__skillListContainer()._height;
      this.currentPoint = Number(current);
      this.totalPoint = Number(total);
      var _loc5_ = lib.util.ExtString.split(crestData,"\n");
      var _loc6_ = _loc5_.length;
      var _loc2_ = 0;
      while(_loc2_ < _loc6_)
      {
         var _loc4_ = lib.util.ExtString.split(_loc5_[_loc2_],"\t");
         this.setCrest(_loc4_);
         _loc2_ = _loc2_ + 1;
      }
      _loc2_ = 0;
      while(_loc2_ < this._crestArray.length)
      {
         var _loc3_ = this._crestArray[_loc2_];
         _loc3_.arrayIndex = _loc2_;
         this.changeCrestState(_loc3_);
         this.setStateOnCrestSlot(_loc3_);
         _loc2_ = _loc2_ + 1;
      }
      if(this._curViewMode == 0)
      {
         var _loc8_ = this._defaultViewPanel.__get__skillListContainer()._height;
         if(_loc9_ != _loc8_)
         {
            this._defaultViewPanel.__get__skillListScroll().__set__pageSize(this._defaultViewPanel.__get__skillListContainer()._height);
         }
      }
      var _loc7_ = !this._bChange?"#b40000":"#80e71c";
      this._bottomButtonGroup.pointFd.htmlText = "<font color=\'" + _loc7_ + "\'>" + current + "</font>/" + total;
   }
   function OnGame_SkillWindow_CoolTime(slotIndex, remain, total)
   {
      slotIndex = Number(slotIndex);
      remain = Number(remain);
      total = Number(total);
      var _loc9_ = this._curViewMode != 0?this._totalViewPanel.__get__skillListContainer():this._defaultViewPanel.__get__skillListContainer();
      var _loc3_ = _loc9_[this._slotPrefix + slotIndex];
      var _loc8_ = _loc3_.slotHit._x;
      var _loc7_ = _loc3_.slotHit._y;
      var _loc2_ = _loc3_.coolTimeMc;
      if(remain <= 0 || total <= 0)
      {
         if(_loc2_.coolTime != undefined)
         {
            this._coolTimeManager.removeCoolTimeInstance(_loc2_);
            _loc2_.removeMovieClip();
         }
      }
      else
      {
         if(_loc2_ == undefined)
         {
            _loc2_ = _loc3_.attachMovie("slotCoolTimeMc","coolTimeMc",_loc3_.getNextHighestDepth());
            _loc2_.iconName = "";
            _loc2_._xscale = _loc2_._yscale = 80;
            _loc2_._x = _loc8_ - 2;
            _loc2_._y = _loc7_ - 1;
            _loc2_.hitTestDisable = true;
         }
         _loc2_.setCoolTime(remain,total);
         this._coolTimeManager.addCoolTimeInstance(_loc2_);
      }
   }
   function OnGame_SkillWindow_SetToggle(slotIndex, bTrue)
   {
      slotIndex = Number(slotIndex);
      bTrue = Number(bTrue);
      var _loc8_ = this._curViewMode != 0?this._totalViewPanel.__get__skillListContainer():this._defaultViewPanel.__get__skillListContainer();
      var _loc3_ = _loc8_[this._slotPrefix + slotIndex];
      var _loc6_ = _loc3_.slotHit._x;
      var _loc5_ = _loc3_.slotHit._y;
      var _loc2_ = _loc3_.activeMc;
      if(bTrue)
      {
         if(_loc2_ == undefined)
         {
            _loc2_ = _loc3_.attachMovie("slotActiveMc","activeMc",_loc3_.getNextHighestDepth());
            _loc2_._xscale = _loc2_._yscale = 80;
            _loc2_._x = _loc6_ - 6.5;
            _loc2_._y = _loc5_ - 10;
            _loc2_.hitTestDisable = true;
         }
         else
         {
            _loc2_._visible = true;
         }
      }
      else if(_loc2_ != undefined)
      {
         _loc2_.removeMovieClip();
      }
   }
   function OnGame_MouseDown(button, target)
   {
      if(target.slotName != "SKILLSLOT" || target._parent.disable)
      {
         return undefined;
      }
      if(Number(button) == 2)
      {
         this._rightClicked = true;
         this._rightClickedTarget = target._parent;
         this._targetIndex = this._rightClickedTarget.slotIndex;
         if(this._targetIndex != undefined)
         {
            g4.view.skillWindow.SkillWindowController.getInstance().ToGame_SkillWindow_UseSlot(this._targetIndex,0);
         }
      }
   }
   function OnGame_MouseUp(button, target)
   {
      if(Number(button) == 2)
      {
         this._rightClicked = false;
         if(this._targetIndex != undefined)
         {
            g4.view.skillWindow.SkillWindowController.getInstance().ToGame_SkillWindow_UseSlot(this._targetIndex,1);
         }
         this._rightClickedTarget = null;
      }
   }
   function onTabButtonGroupClick(tabButton)
   {
      g4.view.skillWindow.SkillWindowController.getInstance().ToGame_SkillWindow_SelectTab(this._tabButtonGroup.getSelectedButtonIndex(),0);
   }
}
