part of '../utils/import/u_import_app.dart';

class ControllerNavigationBar extends ChangeNotifier {
  // * index for pages
  static const int shop = 0;
  static const int explore = 1;
  static const int cart = 2;
  static const int favorite = 3;

  /// [indicatorIndex] initial index for Indicators inside image slider
  int indicatorIndex = 0;
  void changeIndicatorIndex(int index) {
    indicatorIndex = index;
    notifyListeners();
  }

  /// [currentSelected] first choice for bottom navigation bar
  int currentSelected = shop;

  /// [controllerPageView] controller PageView
  PageController controllerPageView = PageController(initialPage: shop);

  // * list pages
  List<Widget> pageViewChildren = const [
    WidgetShopBody(),
    WidgetCategoryBody(),
    WidgetCartBody(),
    WidgetFavoriteBody(),
  ];

  /// [changePage] change pageView and navigation icon
  void changePage(int newIndex) {
    // * new selection
    currentSelected = newIndex;
    // * change pageView
    controllerPageView.jumpToPage(newIndex);
    notifyListeners();
  }
}
