part of './../../../../utils/import/u_import_app.dart';

class WidgetServiceDrawer extends StatelessWidget {
  const WidgetServiceDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    // * create provider navigation
    ControllerNavigationBar pNavigation =
        Provider.of<ControllerNavigationBar>(context);

    return SingleChildScrollView(
      child: Column(
        children: [
          // * article
          WidgetServiceItemDrawer(
            icon: UtilsIcons.shop,
            title: UtilsLangKey.shop,
            onTap: () {
              pNavigation.changePage(ControllerNavigationBar.shop);
              Navigator.pop(context);
            },
          ),

          // * video
          WidgetServiceItemDrawer(
            icon: UtilsIcons.explore,
            title: UtilsLangKey.categories,
            onTap: () {
              pNavigation.changePage(ControllerNavigationBar.explore);
              Navigator.pop(context);
            },
          ),

          // * upload article
          WidgetServiceItemDrawer(
            icon: UtilsIcons.cart,
            title: UtilsLangKey.cart,
            onTap: () {
              pNavigation.changePage(ControllerNavigationBar.cart);
              Navigator.pop(context);
            },
          ),
          // * favorite
          WidgetServiceItemDrawer(
            icon: UtilsIcons.favorite,
            title: UtilsLangKey.favorite,
            onTap: () {
              pNavigation.changePage(ControllerNavigationBar.favorite);
              Navigator.pop(context);
            },
          ),

          // * lang
          WidgetServiceItemDrawer(
            icon: UtilsIcons.lang,
            title: UtilsLangKey.lang,
            onTap: () => Navigator.pushNamed(context, UtilsRoutes.serviceLang),
          ),

          // * theme
          WidgetServiceItemDrawer(
            icon: UtilsIcons.theme,
            title: UtilsLangKey.theme,
            onTap: () => Navigator.pushNamed(context, UtilsRoutes.serviceTheme),
          ),

          // * about us
          WidgetServiceItemDrawer(
            icon: UtilsIcons.about,
            title: UtilsLangKey.about,
            onTap: () => goToAboutUs(context),
          ),

          // * sign out
          WidgetServiceItemDrawer(
            icon: UtilsIcons.signOut,
            title: UtilsLangKey.signOut,
            rotate: UtilsLangConfig.isEnglish(context) ? 1 : 3,
            onTap: () => showAlertDialog(context),
          ),
        ],
      ),
    );
  }

  /// [showAlertDialog] show alert dialog for sign out
  void showAlertDialog(BuildContext context) {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return WidgetAlert(
          title: UtilsLangKey.logout,
          msg: UtilsLangKey.messageLogout,
          action: () {
            ControllerAuth auth =
                Provider.of<ControllerAuth>(context, listen: false);

            auth.singOut();
          },
        );
      },
    );
  }

  /// [goToAboutUs] show about us page for BBC
  void goToAboutUs(BuildContext context) {
    MaterialPageRoute route = MaterialPageRoute(
      builder: (context) => const WidgetAboutUs(),
    );
    Navigator.pop(context);
    Navigator.push(
      context,
      route,
    );
  }
}
