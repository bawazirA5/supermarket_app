part of './../utils/import/u_import_app.dart';

class ControllerLangTheme extends ChangeNotifier {
  // * list for lang
  List<ModelLangTheme> dataLang = [
    // english
    ModelLangTheme(
      key: UtilsLangConfig.en,
      title: UtilsLangKey.english,
      icon: UtilsIcons.english,
    ),
    // arabic
    ModelLangTheme(
      key: UtilsLangConfig.ar,
      title: UtilsLangKey.arabic,
      icon: UtilsIcons.arabic,
    ),
  ];

  // * list for Theme
  List<ModelLangTheme> dataTheme = [
    // light
    ModelLangTheme(
      key: UtilsLangKey.light,
      title: UtilsLangKey.light,
      icon: UtilsIcons.light,
      isTypeLang: false,
    ),
    // dark
    ModelLangTheme(
      key: UtilsLangKey.dark,
      title: UtilsLangKey.dark,
      icon: UtilsIcons.dark,
      isTypeLang: false,
    ),
  ];

  /// [handleSwitch] change lang or theme
  void handleSwitch({
    required BuildContext context,
    required String key,
    required bool newValue,
    required bool lang,
  }) {
    if (lang) {
      // * UI
      switchUI(key, newValue, dataLang);

      // * Change Lang
      handleLangChoice(context, key);

      // * restart app
      UtilsRestart.reDraw(context);
    } else {
      // * UI
      switchUI(key, newValue, dataTheme);

      // * Change theme
      handleThemeChoice(context, key);

      // * reDraw
      notifyListeners();
    }
  }

  /// [switchUI] search key when equal [isChoice] = newValue otherwise [isChoice] = false
  void switchUI(String key, bool newValue, List<ModelLangTheme> data) {
    for (ModelLangTheme item in data) {
      if (item.key == key) {
        item.isChoice = newValue;
      } else {
        item.isChoice = false;
      }
    }
  }

  // * ---------------------------- lang -----------------------------

  /// [handleLangChoice] change language depended on key
  void handleLangChoice(BuildContext context, key) {
    if (UtilsLangConfig.en == key) {
      context.setLocale(UtilsLangConfig.enLocale);
    } else {
      context.setLocale(UtilsLangConfig.arLocale);
    }
  }

  /// [handleCurrentLang] check lang when open page language
  void handleCurrentLang(BuildContext context) {
    /// [currentLang] save lang code
    String currentLang = UtilsLangConfig.currentLang(context);
    for (ModelLangTheme item in dataLang) {
      if (currentLang == item.key) {
        item.isChoice = true;
      } else {
        item.isChoice = false;
      }
    }

    // reDraw
    notifyListeners();
  }

  //* ---------------------------- theme -----------------------------

  /// [handleThemChoice] change theme depended on [key]
  void handleThemeChoice(BuildContext context, String key) {
    if (key == UtilsLangKey.light) {
      AdaptiveTheme.of(context).setLight();
    } else {
      AdaptiveTheme.of(context).setDark();
    }
  }

  /// [handleCurrentTheme] check theme when open page theme
  void handleCurrentTheme(BuildContext context) {
    /// [currentTheme] save theme light or dark
    String currentTheme =
        UtilsTheme.isDark(context) ? UtilsLangKey.dark : UtilsLangKey.light;
    for (ModelLangTheme item in dataTheme) {
      if (currentTheme == item.key) {
        item.isChoice = true;
      } else {
        item.isChoice = false;
      }
    }

    // reDraw
    notifyListeners();
  }
}
