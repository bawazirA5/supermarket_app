part of '../../../../../utils/import/u_import_app.dart';

class WidgetProductType extends StatelessWidget {
  const WidgetProductType({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        // * title
        Text(
          title,
          style: UtilsTheme.tLarge(context),
        ),

        // * see all
        TextButton(
          onPressed: () {},
          child: Text(
            UtilsLangKey.seeAll.tr(),
            style: UtilsTheme.tMedium(context)?.copyWith(
                color: UtilsTheme.isDark(context)
                    ? UtilsColor.white
                    : UtilsColor.greenMunsell,
                decoration: TextDecoration.underline),
          ),
        ),
      ],
    );
  }
}
