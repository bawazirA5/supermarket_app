part of '../utils/import/u_import_app.dart';

class InitLang extends StatelessWidget {
  const InitLang({super.key, required this.child});
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return EasyLocalization(
      supportedLocales: UtilsLangConfig.supportLocale,
      path: UtilsLangConfig.path,
      fallbackLocale: UtilsLangConfig.enLocale,
      child: child,
    );
  }
}
