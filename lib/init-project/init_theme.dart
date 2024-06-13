part of './../utils/import/u_import_app.dart';

class InitTheme extends StatelessWidget {
  const InitTheme({super.key, required this.child});
  final Widget Function(ThemeData, ThemeData) child;

  @override
  Widget build(BuildContext context) {
    // * adaptive theme package
    return AdaptiveTheme(
        light: UtilsSettingTheme.light(context),
        dark: UtilsSettingTheme.dark(context),
        initial: AdaptiveThemeMode.system,
        builder: child);
  }
}
