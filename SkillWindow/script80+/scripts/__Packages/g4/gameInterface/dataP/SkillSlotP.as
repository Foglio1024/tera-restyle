class g4.gameInterface.dataP.SkillSlotP extends g4.gameInterface.dataP.BasicDataP
{
   var Index = -1;
   var Id = "";
   var Name = "";
   var Img = "";
   var Disable = false;
   var State = -1;
   var Num = -1;
   var Remain = -1;
   var Total = -1;
   var Awaken = false;
   var Level = -1;
   var SkillType = -1;
   function SkillSlotP(data)
   {
      super(data);
   }
   function getSkillTypeName()
   {
      return lib.util.UIString.getUIString("$77030" + this.SkillType);
   }
}
