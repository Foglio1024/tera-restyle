class g4.model.constant.GradeType extends g4.model.Enum
{
   static var NORMAL = new g4.model.constant.GradeType("NORMAL",1,"$001100",16777215);
   static var HIGH = new g4.model.constant.GradeType("HIGH",2,"$001101",5164336);
   static var RARE = new g4.model.constant.GradeType("RARE",3,"$001102",44783);
   static var LEGEND = new g4.model.constant.GradeType("LEGEND",4,"$001103",16763904);
   function GradeType($id, $index, $nameCode, $color)
   {
      super($id);
      this._index = $index;
      this._nameCode = $nameCode;
      this._color = $color;
   }
   function __get__index()
   {
      return this._index;
   }
   function __get__color()
   {
      return this._color;
   }
   function __get__name()
   {
      if(this._name == null || this._name == undefined)
      {
         this._name = lib.util.UIString.getUIString(this._nameCode);
      }
      return this._name;
   }
   static function getByIndex(index)
   {
      var _loc2_ = undefined;
      for(var _loc4_ in g4.model.constant.GradeType)
      {
         var _loc1_ = g4.model.constant.GradeType[_loc4_];
         if(_loc1_ != null && _loc1_.__get__index() == index)
         {
            _loc2_ = _loc1_;
            break;
         }
      }
      return _loc2_;
   }
   static function parse(name)
   {
      return (g4.model.constant.GradeType)g4.model.Enum.parse(name,g4.model.constant.GradeType);
   }
}
