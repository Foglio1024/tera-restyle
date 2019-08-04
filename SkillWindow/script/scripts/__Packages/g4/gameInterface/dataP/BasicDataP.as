class g4.gameInterface.dataP.BasicDataP
{
   function BasicDataP(originData)
   {
      for(var _loc3_ in originData)
      {
         this[_loc3_] = originData[_loc3_];
      }
   }
}
