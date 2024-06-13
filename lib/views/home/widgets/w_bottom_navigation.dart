part of '../../../utils/import/u_import_app.dart';

class WidgetBottomNavigation extends StatelessWidget {
  const WidgetBottomNavigation({super.key});

  @override
  Widget build(BuildContext context) {
    // * create provider navigation
    ControllerNavigationBar pNavigation =
        Provider.of<ControllerNavigationBar>(context);

    return StylishBottomBar(
      // * current selected
      currentIndex: pNavigation.currentSelected,
      // * items
      items: [
        BottomBarItem(
            icon: const Icon(UtilsIcons.shop),
            title: const Text(UtilsLangKey.shop).tr()),
        BottomBarItem(
            icon: const Icon(UtilsIcons.explore),
            title: const Text(UtilsLangKey.categories).tr()),
        BottomBarItem(
            icon: const Icon(UtilsIcons.cart),
            title: const Text(UtilsLangKey.cart).tr()),
        BottomBarItem(
            icon: const Icon(UtilsIcons.favoriteOutlined),
            title: const Text(UtilsLangKey.favorite).tr()),
      ],
      option: AnimatedBarOptions(
        // * icon style
        iconStyle: IconStyle.animated,
      ),
      // * onTab => performed when click on any item from navigation bar
      onTap: pNavigation.changePage,
      // * background color
      backgroundColor: UtilsTheme.isDark(context)
          ? UtilsColor.blueMagenta
          : UtilsColor.white,
    );
  }
}
