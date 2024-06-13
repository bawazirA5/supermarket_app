part of './../../../../utils/import/u_import_app.dart';

class WidgetHeaderDrawer extends StatelessWidget {
  const WidgetHeaderDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    ControllerAuth auth = Provider.of<ControllerAuth>(context, listen: false);
    return Column(
      children: [
        // * image
        const WidgetUserImageDrawer(),
        // * space 8
        UtilsDime.md.verticalSpace,
        // * name
        Text(
          auth.userName,
          style: UtilsTheme.tLarge(context),
        ),
        // * space 4
        UtilsDime.sm.verticalSpace,
        // * email
        Text(
          auth.userEmail,
          style: UtilsTheme.tMedium(context)?.copyWith(
            color: UtilsTheme.isDark(context)
                ? UtilsColor.grey
                : UtilsColor.blueGrey,
          ),
        )
      ],
    );
  }
}
