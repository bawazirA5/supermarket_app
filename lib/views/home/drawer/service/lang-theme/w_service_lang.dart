part of './../../../../../utils/import/u_import_app.dart';

class WidgetServiceLang extends StatefulWidget {
  const WidgetServiceLang({super.key});

  @override
  State<WidgetServiceLang> createState() => _WidgetServiceLangState();
}

class _WidgetServiceLangState extends State<WidgetServiceLang> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () {
      // * create provider lang & theme
      ControllerLangTheme pService =
          Provider.of<ControllerLangTheme>(context, listen: false);
      // * check current lang
      pService.handleCurrentLang(context);
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
        title: UtilsLangKey.lang,
       
      ),

      // * body
      body: SizedBox(
        height: UtilsDime.xxxxl.h,
        child: Row(
          children: [
            for (ModelLangTheme data in pService.dataLang)
              WidgetCardChoice(data: data)
          ],
        ),
      ),
    );
  }
}
