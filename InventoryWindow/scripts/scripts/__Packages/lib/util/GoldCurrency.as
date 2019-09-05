class lib.util.GoldCurrency
{
   function GoldCurrency()
   {
   }
   static function SetGoldText(price, isBigIcon, size, positive, type, isRemoveBackseat)
   {
      price = Number(price);
      var _loc27_ = "";
      var _loc12_ = positive == "-1"?"#C00005":"#ffb033";
      var _loc11_ = positive == "-1"?"#C00005":"#d7d7d7";
      var _loc24_ = positive == "-1"?"#C00005":"#c87551";
      var _loc18_ = type != 1?"Gold_largetoken":"Gold_largetoken_c";
      var _loc10_ = type != 1?"Gold_smalltoken":"Gold_smalltoken_c";
      var _loc21_ = type != 1?"Silver_largetoken":"Silver_largetoken_c";
      var _loc16_ = type != 1?"Silver_smalltoken":"Silver_smalltoken_c";
      var _loc26_ = type != 1?"Copper_largetoken":"Copper_largetoken_c";
      var _loc19_ = type != 1?"Copper_smalltoken":"Copper_smalltoken_c";
      var _loc9_ = price % 10000;
      var _loc1_ = Number(Math.floor(price / 10000));
      var _loc3_ = Number(Math.floor(_loc9_ / 100));
      var _loc6_ = _loc9_ % 100;
      var _loc20_ = isBigIcon != 1?_loc10_:_loc18_;
      var _loc25_ = isBigIcon != 1?_loc16_:_loc21_;
      var _loc13_ = isBigIcon != 1?_loc19_:_loc26_;
      var _loc5_ = isBigIcon != 1?-1:-4;
      var _loc4_ = size <= 1?"":"width=\'" + size + "\' height=\'" + size + "\' ";
      var _loc22_ = _loc1_ <= 0?"":"<font color=\'" + _loc12_ + "\'>" + lib.util.CurrencyFormat.makeComma(_loc1_) + "</font>" + "<img src=\'" + _loc20_ + "\' " + _loc4_ + "vspace=\'" + _loc5_ + "\'>";
      var _loc23_ = !(_loc1_ > 0 && isRemoveBackseat == false || _loc3_ > 0 || str_broze > 0 && isRemoveBackseat == false)?"":"<font color=\'" + _loc11_ + "\'>" + g4.util.StringUtil.addZeroNumber(_loc3_) + "</font>" + "<img src=\'" + _loc25_ + "\' " + _loc4_ + "vspace=\'" + _loc5_ + "\'>";
      var str_broze = !(_loc1_ == 0 && _loc3_ == 0 || isRemoveBackseat == false || _loc6_ > 0)?"":"<font color=\'" + _loc24_ + "\'>" + g4.util.StringUtil.addZeroNumber(_loc6_) + "</font>" + "<img src=\'" + _loc13_ + "\' " + _loc4_ + "vspace=\'" + _loc5_ + "\'>";
      return _loc22_ + _loc23_ + str_broze;
   }
   static function SetTCatText(num1e, type)
   {
      var _loc1_ = "#FFC987";
      return "<font color=\'" + _loc1_ + "\'>" + lib.util.CurrencyFormat.makeComma(num1e) + "</font>" + "<img src=\'img://__Icon_Items.Tcat_token" + type + "\' vspace=\'-1\'>";
   }
}
