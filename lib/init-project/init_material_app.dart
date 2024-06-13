part of '../utils/import/u_import_app.dart';

// class InitMaterialApp extends StatelessWidget {
//   const InitMaterialApp({super.key, required this.light, required this.dark});
//   final ThemeData light;
//   final ThemeData dark;

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       // * name app
//       onGenerateTitle: (context) => UtilsLangKey.nameProject.tr(),

//       // * stop debug label
//       debugShowCheckedModeBanner: false,

//       // * language
//       localizationsDelegates: context.localizationDelegates,
//       supportedLocales: context.supportedLocales,
//       locale: context.locale,

//       // * theme
//       theme: light,
//       darkTheme: dark,

//       // * route
//       initialRoute: UtilsRoutes.initPage,
//       routes: UtilsRoutes.routes,
//     );
//   }
// }

class InitMaterial extends StatelessWidget {
  const InitMaterial({super.key, required this.light, required this.dark});
  final ThemeData light;
  final ThemeData dark;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      onGenerateTitle: (context) => UtilsLangKey.nameProject.tr(),
      theme: light,
      darkTheme: dark,
      debugShowCheckedModeBanner: false,

      // * route
      initialRoute: UtilsRoutes.initFirebase,
      routes: UtilsRoutes.routes,
    );
  }
}
