part of '../../../../utils/import/u_import_app.dart';

class WidgetAboutUs extends StatelessWidget {
  const WidgetAboutUs({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const WidgetAppBar(
          title: UtilsLangKey.about,
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 3),
          child: RichText(
            text: TextSpan(
              text: UtilsLangKey.about1.tr(),
              style: UtilsTheme.bLarge(context),
              children: [
                const TextSpan(text: ' '),
                TextSpan(
                  text: UtilsLangKey.about2.tr(),
                  style: UtilsTheme.tLarge(context),
                ),
              ],
            ),
          ),
        ));
  }
}
