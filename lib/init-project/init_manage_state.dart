part of '../utils/import/u_import_app.dart';

class InitManageState extends StatelessWidget {
  const InitManageState({super.key, required this.child});
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        // * NavigationBar
        ChangeNotifierProvider(
          create: (context) => ControllerNavigationBar(),
        ),
        // * product
        ChangeNotifierProvider(
          create: (context) => ControllerProduct(),
        ),
        // * category
        ChangeNotifierProvider(
          create: (context) => ControllerCategory(),
        ),
        // * AuthSecurityPass
        ChangeNotifierProvider(
          create: (context) => ControllerAuthSecurityPass(),
        ),
        // * Auth
        ChangeNotifierProvider(
          create: (context) => ControllerAuth(),
        ),
        // * image
        ChangeNotifierProvider(
          create: (context) => ControllerImage(),
        ),
        // * favorite
        ChangeNotifierProvider(
          create: (context) => ControllerFavorite(),
        ),
        // * cart
        ChangeNotifierProvider(
          create: (context) => ControllerCart(),
        ),
        // * lang&theme
        ChangeNotifierProvider(
          create: (context) => ControllerLangTheme(),
        ),
      ],
      child: child,
    );
  }
}
