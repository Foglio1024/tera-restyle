class g4.model.Enum
{
   function Enum(id)
   {
      this.id = id;
   }
   static function parse(id, enumType)
   {
      if(id == "" || id == null)
      {
         return undefined;
      }
      if(enumType[id])
      {
         return enumType[id];
      }
      id = id.toLowerCase();
      if(enumType[id])
      {
         return enumType[id];
      }
      for(var _loc4_ in enumType)
      {
         var _loc1_ = enumType[_loc4_];
         if(_loc1_ instanceof enumType)
         {
            if(String(_loc4_).toLowerCase() == id || String(_loc1_.id).toLowerCase() == id)
            {
               return _loc1_;
            }
         }
      }
      return undefined;
   }
   function toString()
   {
      return this.id;
   }
}
