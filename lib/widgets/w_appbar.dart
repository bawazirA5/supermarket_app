part of '../utils/import/u_import_app.dart';

class WidgetAppBar extends StatelessWidget implements PreferredSizeWidget {
  const WidgetAppBar({
    super.key,
    this.title = UtilsLangKey.nameProject,
  });
  final String title;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      // * title
      title: Text(title.tr().toUpperCase(), style: UtilsTheme.hSmall(context)),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(AppBar().preferredSize.height);
}
