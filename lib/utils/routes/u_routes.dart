part of '../import/u_import_app.dart';

class UtilsRoutes {
  // * keys for pages in application
  static const String home = 'ViewHome';
  static const String login = 'ViewLogin';
  static const String register = 'ViewRegister';
  static const String forgotPass = 'ViewForgotPass';
  static const String serviceLang = 'WidgetServiceLang';
  static const String serviceTheme = 'WidgetServiceTheme';
  static const String initFirebase = 'InitFirebase';

  /// [routes] map to pages in application
  static Map<String, WidgetBuilder> routes = {
    home: (context) => const ViewHome(),
    login: (context) => const ViewLogin(),
    register: (context) => const ViewRegister(),
    forgotPass: (context) => const ViewForgotPass(),
    serviceLang: (context) => const WidgetServiceLang(),
    serviceTheme: (context) => const WidgetServiceTheme(),
    initFirebase: (context) => const InitFirebase(),
  };


}
