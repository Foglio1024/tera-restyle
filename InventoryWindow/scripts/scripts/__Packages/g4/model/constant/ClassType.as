class g4.model.constant.ClassType extends g4.model.Enum
{
   static var WARRIOR = new g4.model.constant.ClassType("warrior",0);
   static var LANCER = new g4.model.constant.ClassType("lancer",1);
   static var SLAYER = new g4.model.constant.ClassType("slayer",2);
   static var BERSERKER = new g4.model.constant.ClassType("berserker",3);
   static var SORCERER = new g4.model.constant.ClassType("sorcerer",4);
   static var ARCHER = new g4.model.constant.ClassType("archer",5);
   static var PRIEST = new g4.model.constant.ClassType("priest",6);
   static var ELEMENTALIST = new g4.model.constant.ClassType("elementalist",7);
   static var SOULLESS = new g4.model.constant.ClassType("soulless",8);
   static var ENGINEER = new g4.model.constant.ClassType("engineer",9);
   static var FIGHTER = new g4.model.constant.ClassType("fighter",10);
   static var ASSASSIN = new g4.model.constant.ClassType("assassin",11);
   static var GLAIVER = new g4.model.constant.ClassType("glaiver",12);
   static var CANNON = new g4.model.constant.ClassType("cannon",20);
   static var FLYINGSHIP = new g4.model.constant.ClassType("flyingship",21);
   static var MONSTER = new g4.model.constant.ClassType("monster",22);
   function ClassType($id, $index)
   {
      super($id);
      this._index = $index;
   }
   function __get__index()
   {
      return this._index;
   }
   static function getClassTypeByIndex(index)
   {
      var _loc2_ = undefined;
      for(var _loc4_ in g4.model.constant.ClassType)
      {
         var _loc1_ = g4.model.constant.ClassType[_loc4_];
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
      return (g4.model.constant.ClassType)g4.model.Enum.parse(name,g4.model.constant.ClassType);
   }
}
