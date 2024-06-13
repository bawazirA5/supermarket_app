part of '../utils/import/u_import_app.dart';

class WidgetToast {
  /// [buildToast] show toast
  static buildToast({
    required BuildContext context,
    required String msg,
    bool translation = true,
  }) {
    return Fluttertoast.showToast(
      msg: translation ? msg.tr() : msg,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      backgroundColor: UtilsTheme.isDark(context)
          ? UtilsColor.greemmm
          : UtilsColor.blueMagenta,
      textColor: UtilsColor.white,
      fontSize: UtilsDime.l.sp,
    );
  }
}
