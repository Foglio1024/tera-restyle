class g4.component.G4TextInput extends g4.core.G4UIComponent
{
   var defaultText = "";
   var _text = "";
   var _maxChars = 0;
   var _editable = true;
   var actAsButton = false;
   var hscroll = 0;
   var changeLock = false;
   var _possibleList = null;
   var _impossibleList = null;
   function G4TextInput()
   {
      super();
      this.tabEnabled = !this._disabled;
      this.focusEnabled = !this._disabled;
      this.defaultTextFormat = this.textField.getNewTextFormat();
      this.defaultTextFormat.italic = true;
      this.defaultTextFormat.color = 11184810;
   }
   function __get__restrict()
   {
      return this._restrict;
   }
   function __set__restrict(value)
   {
      if(this._restrict == value || value == "")
      {
         if(value == "")
         {
            this._possibleList = null;
         }
         this._impossibleList = null;
         return undefined;
      }
      this._possibleList = new Array();
      this._impossibleList = new Array();
      this._restrict = value;
      var _loc3_ = this._restrict.split(" ");
      var _loc4_ = undefined;
      var _loc2_ = 0;
      while(_loc2_ < _loc3_.length)
      {
         if(_loc3_[_loc2_] == "")
         {
            _loc3_.splice(_loc2_,2," " + _loc3_[_loc2_ + 1]);
         }
         else if(_loc3_[_loc2_] == "^")
         {
            _loc3_[_loc2_] = _loc3_[_loc2_] + " ";
            _loc3_.splice(_loc2_,2,_loc3_[_loc2_] + " ");
         }
         _loc4_ = _loc3_[_loc2_].indexOf("-");
         if(_loc3_[_loc2_].substr(0,1) == "^")
         {
            if(_loc4_ != -1)
            {
               this._impossibleList.push({first:_loc3_[_loc2_].slice(1,_loc4_),second:_loc3_[_loc2_].slice(_loc4_ + 1)});
            }
            else
            {
               this._impossibleList.push({first:_loc3_[_loc2_].slice(1)});
            }
         }
         else
         {
            this._possibleList.push({first:_loc3_[_loc2_].slice(0,_loc4_),second:_loc3_[_loc2_].slice(_loc4_ + 1)});
         }
         _loc2_ = _loc2_ + 1;
      }
      return this.__get__restrict();
   }
   function showDefaultText()
   {
      this.isHtml != true?this.__set__text(this.defaultText):this.__set__htmlText(this.defaultText);
      this.textField.setTextFormat(this.defaultTextFormat);
   }
   function checkRestrict(charCode)
   {
      if(this._impossibleList == null || this._impossibleList.length == 0 && this._possibleList.length == 0)
      {
         return true;
      }
      var _loc7_ = false;
      var _loc3_ = undefined;
      if(charCode == 8)
      {
         _loc7_ = true;
      }
      var _loc6_ = 0;
      while(_loc6_ < this._possibleList.length)
      {
         _loc3_ = this._possibleList[_loc6_];
         var _loc4_ = _loc3_.first.charCodeAt(0);
         var _loc5_ = _loc3_.second.charCodeAt(0);
         if(_loc4_ >= 48 && _loc5_ <= 57)
         {
            if(_loc4_ <= charCode && _loc5_ >= charCode || _loc4_ + 48 <= charCode && _loc5_ + 48 >= charCode)
            {
               _loc7_ = true;
            }
         }
         else if(_loc4_ <= charCode && _loc5_ >= charCode)
         {
            _loc7_ = true;
         }
         _loc6_ = _loc6_ + 1;
      }
      if(this._possibleList.length == 0)
      {
         _loc7_ = true;
      }
      if(_loc7_ && this._impossibleList.length > 0)
      {
         _loc6_ = 0;
         while(_loc6_ < this._impossibleList.length)
         {
            _loc3_ = this._impossibleList[_loc6_];
            if(_loc3_.second == undefined)
            {
               if(_loc3_.first.charCodeAt(0) == charCode)
               {
                  _loc7_ = false;
               }
            }
            else if(_loc3_.first.charCodeAt(0) <= charCode && _loc3_.second.charCodeAt(0) >= charCode)
            {
               _loc7_ = false;
            }
            _loc6_ = _loc6_ + 1;
         }
      }
      return _loc7_;
   }
   function __get__textID()
   {
      return null;
   }
   function __set__textID(value)
   {
      if(value != "")
      {
         this.__set__text(gfx.utils.Locale.getTranslatedString(value));
      }
      return this.__get__textID();
   }
   function __get__text()
   {
      return this._text;
   }
   function __set__text(value)
   {
      this._text = value;
      this.isHtml = false;
      this.updateText();
      return this.__get__text();
   }
   function __get__htmlText()
   {
      return this._text;
   }
   function __set__htmlText(value)
   {
      this._text = value;
      this.isHtml = true;
      this.updateText();
      return this.__get__htmlText();
   }
   function __get__editable()
   {
      return this._editable;
   }
   function __set__editable(value)
   {
      this._editable = value;
      this.tabEnabled = !this._disabled && !this._editable;
      this.updateTextField();
      return this.__get__editable();
   }
   function __get__password()
   {
      return this.textField.password;
   }
   function __set__password(value)
   {
      this._password = this.textField.password = value;
      return this.__get__password();
   }
   function __get__maxChars()
   {
      return this._maxChars;
   }
   function __set__maxChars(value)
   {
      this._maxChars = this.textField.maxChars = value;
      return this.__get__maxChars();
   }
   function __get__disabled()
   {
      return this._disabled;
   }
   function __set__disabled(value)
   {
      super.__set__disabled(value);
      this.tabEnabled = !this._disabled;
      this.focusEnabled = !this._disabled;
      if(this.initialized)
      {
         this.setState();
         this.updateTextField();
      }
      return this.__get__disabled();
   }
   function appendText(text)
   {
      this._text = this._text + text;
      this.isHtml = false;
      this.updateText();
   }
   function appendHtml(text)
   {
      this._text = this._text + text;
      this.isHtml = true;
      this.updateText();
   }
   function __get__length()
   {
      return this.textField.length;
   }
   function handleInput(details, pathToFocus)
   {
      if(details.value != "keyDown")
      {
         return false;
      }
      if(Selection.getFocus() != null)
      {
         return false;
      }
      Selection.setFocus(this.textField);
      return true;
   }
   function toString()
   {
      return "[Scaleform G4TextInput " + this._name + "]";
   }
   function configUI()
   {
      if(this.bindingEnabled)
      {
         flash.external.ExternalInterface.call("__registerControl",this._name,this,"TextInput");
         this.addEventListener(gfx.events.EventTypes.TEXT_CHANGE,this,this.dispatchEventToGame);
         this.bindingEnabled = false;
      }
      super.configUI();
      this.constraints = new gfx.utils.Constraints(this,true);
      this.constraints.addElement(this.textField,gfx.utils.Constraints.ALL);
      this.setState();
      this.updateTextField();
      this.setMouseHandlers();
      if(this.mc_focus != null)
      {
         this.mc_focus._visible = false;
         this.mc_focus.gotoAndStop(1);
      }
      var scope = this;
      this._keyListner = {};
      this._keyListner.onKeyUp = function()
      {
         if(Key.getCode() == 13)
         {
            Selection.setFocus(null);
         }
      };
      this._keyListner.onKeyDown = function()
      {
         scope._inputKeyCode = Key.getCode();
      };
      this.textField.onSetFocus = g4.util.Delegate.create(this,this.onTextFieldSetFocus);
      this.textField.onKillFocus = g4.util.Delegate.create(this,this.onTextFieldKillFocus);
      this.setResize();
   }
   function setResize()
   {
      var _loc3_ = this._width;
      this._xscale = 100;
      var _loc4_ = this._width;
      var _loc2_ = _loc4_ - _loc3_;
      if(this.mc_focus != null)
      {
         this.mc_focus._width = this.mc_focus._width - _loc2_;
      }
      if(this.mc_bg != null)
      {
         this.mc_bg._width = this.mc_bg._width - _loc2_;
      }
   }
   function setState()
   {
      this.gotoAndPlay(!this._disabled?!this._focused?"default":"focused":"disabled");
   }
   function setMouseHandlers()
   {
      if(this.actAsButton == false)
      {
         return undefined;
      }
      if(this._disabled || this._focused)
      {
         delete this.onRollOver;
         delete this.onRollOut;
         delete this.onPress;
      }
      else if(this._editable)
      {
         this.onRollOver = this.handleMouseRollOver;
         this.onRollOut = this.handleMouseRollOut;
         this.onPress = this.handleMousePress;
      }
   }
   function handleMousePress(mouseIndex, button)
   {
      this.dispatchEvent(gfx.events.EventTypes.PRESS,[this,mouseIndex,button]);
      Selection.setFocus(this.textField);
   }
   function handleMouseRollOver(mouseIndex)
   {
      this.gotoAndPlay("default");
      this.gotoAndPlay("over");
      if(this.constraints)
      {
         this.constraints.update(this.__width,this.__height);
      }
      this.updateTextField();
      this.dispatchEvent(gfx.events.EventTypes.ROLL_OVER,[this,mouseIndex]);
   }
   function handleMouseRollOut(mouseIndex)
   {
      this.gotoAndPlay("default");
      this.gotoAndPlay("out");
      if(this.constraints)
      {
         this.constraints.update(this.__width,this.__height);
      }
      this.updateTextField();
      this.dispatchEvent(gfx.events.EventTypes.ROLL_OUT,[this,mouseIndex]);
   }
   function draw()
   {
      if(this.sizeIsInvalid)
      {
         this._width = this.__width;
         this._height = this.__height;
      }
      super.draw();
      this.constraints.update(this.__width,this.__height);
   }
   function changeFocus()
   {
      this.tabEnabled = !this._disabled;
      if(!this._focused)
      {
         this.hscroll = this.textField.hscroll;
      }
      this.setState();
      if(this.constraints)
      {
         this.constraints.update(this.__width,this.__height);
      }
      this.updateTextField();
      if(this._focused && Selection.getFocus() != this.textField && this.textField.type == "input")
      {
         this.tabEnabled = false;
         Selection.setFocus(this.textField);
         Selection.setSelection(0,this.textField.htmlText.length);
      }
      this.setMouseHandlers();
      this.textField.hscroll = this.hscroll;
   }
   function onTextFieldSetFocus()
   {
      _global.inputing = true;
      Key.addListener(this._keyListner);
      this._text = this.isHtml != true?this.textField.text:this.textField.htmlText;
      if(this.defaultText == "" || this.textField.text == this.defaultText || this.textField.htmlText == this.defaultText)
      {
         this.isHtml != true?this.textField.text = this._prevText = "":this.textField.htmlText = this._prevText = "";
      }
      if(this.mc_focus != null)
      {
         this.mc_focus._visible = true;
         this.mc_focus.gotoAndPlay(2);
      }
      this.dispatchEvent(gfx.events.EventTypes.FOCUS_IN,[this]);
      lib.manager.Focus.setFocusGroup(this.textField);
   }
   function onTextFieldKillFocus()
   {
      _global.inputing = false;
      Key.removeListener(this._keyListner);
      if(this.mc_focus != null)
      {
         this.mc_focus._visible = false;
         this.mc_focus.gotoAndStop(1);
      }
      if(g4.util.StringUtil.trim(this.textField.text) == "")
      {
         if(this.defaultText == "")
         {
            this.isHtml != true?this.textField.text = this._text:this.textField.htmlText = this._text;
         }
         else
         {
            this.showDefaultText();
         }
      }
      this.dispatchEvent(gfx.events.EventTypes.TEXT_CHANGE,[this]);
      this.dispatchEvent(gfx.events.EventTypes.FOCUS_OUT,[this]);
      lib.manager.Focus.stop();
   }
   function updateText()
   {
      if(this._text != "")
      {
         if(this.isHtml)
         {
            this.textField.html = true;
            this.textField.htmlText = this._text;
         }
         else
         {
            this.textField.html = false;
            this.textField.text = this._text;
         }
      }
      else
      {
         this.textField.text = "";
         if(!this._focused && this.defaultText != "")
         {
            this.isHtml != true?this.textField.text = this.defaultText:this.textField.htmlText = this.defaultText;
            this.textField.setTextFormat(this.defaultTextFormat);
         }
      }
      this.dispatchEvent(gfx.events.EventTypes.TEXT_CHANGE,[this]);
   }
   function updateTextField()
   {
      if(this.textField != null)
      {
         if(!this._selectable)
         {
            this._selectable = this.textField.selectable;
         }
         this.updateText();
         this.textField.maxChars = this._maxChars;
         this.textField.password = this._password;
         this.textField.selectable = !this._disabled?this._selectable || this._editable:false;
         this.textField.type = !(this._editable && !this._disabled)?"dynamic":"input";
         this.textField.focusTarget = this;
         this.textField.hscroll = this.hscroll;
         this.textField.addListener(this);
      }
   }
   function onChanged(target)
   {
      if(!this.changeLock)
      {
         if(this.checkRestrict(this._inputKeyCode) == false)
         {
            this.isHtml != true?this.textField.text = this._prevText:this.textField.htmlText = this._prevText;
            return undefined;
         }
         this._text = this._prevText = !this.isHtml?this.textField.text:this.textField.htmlText;
         this.dispatchEvent(gfx.events.EventTypes.TEXT_CHANGE,[this]);
      }
   }
}
