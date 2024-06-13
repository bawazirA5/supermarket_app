part of '../import/u_import_app.dart';

class UtilsLangConfig {
  // * language code
  static const String en = 'en';
  static const String ar = 'ar';

  // * support locale
  static Locale enLocale = const Locale(en);
  static Locale arLocale = const Locale(ar);

  /// [supportlocale] list of support locale
  static List<Locale> supportLocale = [enLocale, arLocale];

  /// [path] path language
  static const String path = 'assets/translations';

  /// [currentLang] return `languageCode`
  ///
  /// ex languageCode : `ar` or `en`
  static String currentLang(BuildContext context) =>
      context.locale.languageCode;

  /// [isEnglish] return `true` when lang english
  static bool isEnglish(BuildContext context) =>
      currentLang(context) == en ? true : false;
}
