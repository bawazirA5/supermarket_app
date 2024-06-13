part of '../import/u_import_app.dart';

class UtilsRestart extends StatefulWidget {
  const UtilsRestart({super.key, required this.child});
  final Widget child;

  // * access for any thing include class private
  static void reDraw(BuildContext context) =>
      context.findAncestorStateOfType<_UtilsRestartState>()?.changeKey();

  @override
  State<UtilsRestart> createState() => _UtilsRestartState();
}

class _UtilsRestartState extends State<UtilsRestart> {
  /// [key] create key
  Key key = UniqueKey();

  /// [changeKey]  new key and update ui
  void changeKey() {
    key = UniqueKey();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return KeyedSubtree(
      key: key,
      child: widget.child,
    );
  }
}
