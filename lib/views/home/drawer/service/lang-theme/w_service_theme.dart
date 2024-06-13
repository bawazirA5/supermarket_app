part of './../../../../../utils/import/u_import_app.dart';

class WidgetServiceTheme extends StatefulWidget {
  const WidgetServiceTheme({super.key});

  @override
  State<WidgetServiceTheme> createState() => _WidgetServiceThemeState();
}

class _WidgetServiceThemeState extends State<WidgetServiceTheme> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () {
      // * create provider lang & theme
      ControllerLangTheme pService =
          Provider.of<ControllerLangTheme>(context, listen: false);
      // * check current theme
      pService.handleCurrentTheme(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    // * create provider lang & theme
    ControllerLangTheme pService = Provider.of<ControllerLangTheme>(context);
    return Scaffold(
      // * appBar
      appBar: const WidgetAppBar(
        // * title
        title: UtilsLangKey.theme,
      ),

      // * body
      body: SizedBox(
        height: UtilsDime.xxxxl.h,
        child: Row(
          children: [
            for (ModelLangTheme data in pService.dataTheme)
              WidgetCardChoice(data: data)
          ],
        ),
      ),
    );
  }
}
