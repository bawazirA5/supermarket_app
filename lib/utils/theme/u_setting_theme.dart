part of '../../utils/import/u_import_app.dart';

class UtilsSettingTheme {
// * fonts lang
  static String? enFont = GoogleFonts.aBeeZee().fontFamily;
  static String? arFont = GoogleFonts.cairo().fontFamily;

  /// [checkLangFont] return font depended lang
  static String? checkLangFont(BuildContext context) =>
      UtilsLangConfig.isEnglish(context) ? enFont : arFont;

  /// [light] return theme light Screen
  static ThemeData light(BuildContext context) {
    return ThemeData.light().copyWith(
        colorScheme: ColorScheme.light(primary: UtilsColor.greem),
        // * appBar theme
        appBarTheme: AppBarTheme(
          elevation: 5,
          centerTitle: true,
          iconTheme: IconThemeData(
            size: UtilsDime.xl.sp,
            color: UtilsColor.black,
          ),
          titleTextStyle: TextStyle(
            fontSize: UtilsDime.xl.sp,
            color: UtilsColor.black,
            fontFamily: checkLangFont(context),
          ),
        ),
        // * text theme
        textTheme: Typography.englishLike2021.apply(
          fontSizeFactor: 1.sp,
          displayColor: UtilsColor.black,
          bodyColor: UtilsColor.black,
          fontFamily: checkLangFont(context),
        ));
    // iconTheme: IconThemeData(color: UtilsColor.black));
  }

  /// [dark] return theme dark Screen
  static ThemeData dark(BuildContext context) {
    return ThemeData.dark().copyWith(
      // * appBar theme
      appBarTheme: AppBarTheme(
        elevation: 5,
        centerTitle: true,
        titleTextStyle: TextStyle(
          fontFamily: checkLangFont(context),
          fontSize: UtilsDime.xl.sp,
        ),
        iconTheme: IconThemeData(
          size: UtilsDime.xl,
          color: UtilsColor.white,
        ),
      ),
      // * text theme
      textTheme: Typography.englishLike2021.apply(
        fontSizeFactor: 1.sp,
        displayColor: UtilsColor.white,
        bodyColor: UtilsColor.white,
        fontFamily: checkLangFont(context),
      ),
    );
  }
}
