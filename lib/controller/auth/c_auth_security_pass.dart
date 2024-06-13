part of '../../utils/import/u_import_app.dart';

class ControllerAuthSecurityPass extends ChangeNotifier {
  /// [iconEye] store default value for suffixIcon
  IconData iconEye = UtilsIcons.eye;

  /// [isNotShowPass] when `true` no show pass | `false` show Pass
  ///
  /// [isNotShowPass] default value [true]
  bool isNotShowPass = true;

  /// [handelPass] change [iconEye] and [isNotShowPass]
  void handelPass() {
    if (isNotShowPass) {
      // * show pass
      isNotShowPass = false;
      iconEye = UtilsIcons.eyeSlash;
    } else {
      // * no show pass
      isNotShowPass = true;
      iconEye = UtilsIcons.eye;
    }
    // * reDraw
    notifyListeners();
  }

  /// [reset] assign default values for iconEye and isNotShowPass
  void reset() {
    iconEye = UtilsIcons.eye;
    isNotShowPass = true;
    // * reDraw
    notifyListeners();
  }
}
