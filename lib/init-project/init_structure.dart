part of '../utils/import/u_import_app.dart';

class InitStructure extends StatelessWidget {
  const InitStructure({super.key});

  @override
  Widget build(BuildContext context) {
    // * device preview
    return
        // * provider
        InitManageState(
      // * lang
      child: InitLang(
        // * responsive ui
        child: InitResponsive(
          // * restart app
          child: UtilsRestart(
            child: InitTheme(
              child: (light, dark) => InitMaterial(
                light: light,
                dark: dark,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
