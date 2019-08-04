class g4.simplePopup.ButtonType extends g4.model.Enum
{
   static var CONFIRM = new g4.simplePopup.ButtonType("CONFIRM","$770200");
   static var CANCEL = new g4.simplePopup.ButtonType("CANCEL","$770201");
   static var YES = new g4.simplePopup.ButtonType("YES","$770202");
   static var NO = new g4.simplePopup.ButtonType("NO","$770203");
   var _locale = "";
   function ButtonType($id, $localeCode)
   {
      super($id);
      this._localeCode = $localeCode;
   }
   function getLocale()
   {
      if(this._locale == "")
      {
         this._locale = lib.util.UIString.getUIString(this._localeCode);
      }
      return this._locale;
   }
   static function parse(name)
   {
      return (g4.simplePopup.ButtonType)g4.model.Enum.parse(name,g4.simplePopup.ButtonType);
   }
}
