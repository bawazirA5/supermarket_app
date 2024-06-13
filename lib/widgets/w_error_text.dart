part of './../utils/import/u_import_app.dart';

class WidgetErrorText extends StatelessWidget {
  const WidgetErrorText({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        title,
        style: UtilsTheme.bLarge(context)?.copyWith(color: UtilsColor.red),
      ).tr(),
    );
  }
}
