part of './../utils/import/u_import_app.dart';

class WidgetAlert extends StatelessWidget {
  const WidgetAlert(
      {super.key,
      required this.title,
      required this.msg,
      required this.action});
  final String title;
  final String msg;
  final Function() action;
  @override
  Widget build(BuildContext context) {
    return AlertDialog.adaptive(
      // * title
      title: Text(title.tr()),
      // * message
      content: Text(msg.tr()),
      actionsAlignment: MainAxisAlignment.spaceAround,
      // * buttons
      actions: [
        // * cancel
        WidgetActionBtn(
          title: UtilsLangKey.cancel,
          onPressed: () => Navigator.pop(context),
        ),

        // * exit
        WidgetActionBtn(
          title: UtilsLangKey.exit,
          onPressed: () {
            action();
            Navigator.pop(context);
          },
        )
      ],
    );
  }
}
