part of './../utils/import/u_import_app.dart';

class WidgetActionBtn extends StatelessWidget {
  const WidgetActionBtn({
    super.key,
    required this.title,
    required this.onPressed,
  });
  final String title;
  final void Function() onPressed;
  @override
  Widget build(BuildContext context) {
    /// [theme] help access type device
    ThemeData theme = Theme.of(context);

    // * check platform
    switch (theme.platform) {
      case TargetPlatform.android:
      case TargetPlatform.fuchsia:
      case TargetPlatform.linux:
      case TargetPlatform.windows:
        // * button material
        return OutlinedButton(
          onPressed: onPressed,
          child: Text(title.tr()),
        );

      case TargetPlatform.iOS:
      case TargetPlatform.macOS:
        // * button cupertino
        return CupertinoDialogAction(
          onPressed: onPressed,
          child: Text(title.tr()),
        );
    }
  }
}
