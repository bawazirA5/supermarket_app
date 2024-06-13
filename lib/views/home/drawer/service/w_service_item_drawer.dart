part of './../../../../utils/import/u_import_app.dart';

class WidgetServiceItemDrawer extends StatelessWidget {
  const WidgetServiceItemDrawer({
    super.key,
    required this.title,
    required this.icon,
    this.onTap,
    this.rotate = 0,
  });
  final String title;
  final IconData icon;
  final Function()? onTap;
  final int rotate;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      // * title
      title: Text(
        title,
        style: UtilsTheme.tLarge(context),
      ).tr(),
      // * icon
      leading: RotatedBox(
        quarterTurns: rotate,
        child: Icon(
          icon,
          size: UtilsDime.xl.w,
          color:
              UtilsTheme.isDark(context) ? UtilsColor.white : UtilsColor.purple,
        ),
      ),
      // * onTap => this function performed when click on item
      onTap: onTap,
    );
  }
}
