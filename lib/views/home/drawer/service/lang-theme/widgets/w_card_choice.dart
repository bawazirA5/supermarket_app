part of './../../../../../../utils/import/u_import_app.dart';

class WidgetCardChoice extends StatelessWidget {
  const WidgetCardChoice({super.key, required this.data});
  final ModelLangTheme data;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Card(
        elevation: 8,
        // clipBehavior: Clip.antiAlias,
        child: Column(
          children: [
            Expanded(
              // * flag and title
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // * flag
                  Expanded(
                    child: SizedBox(
                      width: UtilsDime.xxxl.w,
                      height: UtilsDime.xxxl.w,
                      child: SvgPicture.asset(data.icon),
                    ),
                  ),
                  // * title
                  Flexible(
                    child: Text(
                      data.title.tr(),
                      style: UtilsTheme.hSmall(context),
                    ),
                  ),
                ],
              ),
            ),
            // * switch
            Align(
              alignment: AlignmentDirectional.bottomEnd,
              child: Switch(
                value: data.isChoice,
                onChanged: (newValue) {
                  if (newValue) {
                    // * create Provider
                    ControllerLangTheme pService =
                        Provider.of<ControllerLangTheme>(context,
                            listen: false);
                    pService.handleSwitch(
                      context: context,
                      key: data.key,
                      newValue: newValue,
                      lang: data.isTypeLang,
                    );
                  } else {
                    WidgetToast.buildToast(
                        context: context,
                        msg: data.isTypeLang
                            ? UtilsLangKey.errorLang
                            : UtilsLangKey.errorTheme);
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
