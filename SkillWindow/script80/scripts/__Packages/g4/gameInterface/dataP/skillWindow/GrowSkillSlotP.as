class g4.gameInterface.dataP.skillWindow.GrowSkillSlotP extends g4.gameInterface.dataP.BasicDataP
{
   var IsActive = false;
   var IsShowArrow = false;
   function GrowSkillSlotP(data)
   {
      super(data);
      this.skillSlotP = new g4.gameInterface.dataP.SkillSlotP(this.SkillSlotP);
   }
}
