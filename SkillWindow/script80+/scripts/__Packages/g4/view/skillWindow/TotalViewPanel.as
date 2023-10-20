class g4.view.skillWindow.TotalViewPanel extends g4.core.SimpleView
{
   function TotalViewPanel($targetMovie)
   {
      super($targetMovie);
      g4.view.skillWindow.SkillWindowController.getInstance().registerTotalViewPanel(this);
      this._numberSteper = $targetMovie.numberSteper;
      this._skillListContainer = $targetMovie.skillListContainer;
      this._numberSteper.onChanged = function(page)
      {
         g4.view.skillWindow.SkillWindowController.getInstance().ToGame_SkillWindow_RequestSetPage(page);
      };
      this.setPage(2,5);
   }
   function __get__skillListContainer()
   {
      return this._skillListContainer;
   }
   function setPage(curPage, maxPage)
   {
      this._numberSteper.setPage(curPage,maxPage);
   }
}
