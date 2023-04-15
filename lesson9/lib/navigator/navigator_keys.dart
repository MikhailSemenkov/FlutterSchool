import 'package:flutter/cupertino.dart';

class NavigatorKeys {
  static final GlobalKey<NavigatorState> navigatorKeyMain = GlobalKey();
  static final GlobalKey<NavigatorState> navigatorKeyHomePage = GlobalKey();
  static final GlobalKey<NavigatorState> navigatorKeySearchPage = GlobalKey();
  static final GlobalKey<NavigatorState> navigatorKeyLibraryPage = GlobalKey();

  static GlobalKey<NavigatorState> getKeyByPageNumber(int pageNumber) {
    switch (pageNumber) {
      case 0:
        return navigatorKeyHomePage;
      case 1:
        return navigatorKeySearchPage;
      case 2:
        return navigatorKeyLibraryPage;
      default:
        return navigatorKeyMain;
    }
  }
}
