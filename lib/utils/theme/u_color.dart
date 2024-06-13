part of '../../utils/import/u_import_app.dart';

class UtilsColor {
  /// [colorFromHex] convert from hex to flutter
  ///
  /// example : #ff3322 -> 0xFFff3322
  static Color colorFromHex(String hexColor, [String opacity = 'FF']) {
    // * delete `#`
    String color = hexColor.replaceAll('#', ''); // ff3322

    if (color.length == 6) {
      // * opacity
      String colorOpacity = '$opacity$color'; // FFff3322
      //* 0xFFff3322
      int? colorHex = int.tryParse(colorOpacity, radix: 16);
      return Color(colorHex ?? (0xFFFFFFFF));
    } else {
      return const Color(0xFFFFFFFF);
    }
  }

  // * colors
  static final Color white = colorFromHex('#ffffff');
  static final Color black = colorFromHex('#000000');
  static final Color grey = colorFromHex('#C8C8C8');
  static final Color green = colorFromHex('#A5D6A7');
  static final Color greenBold = colorFromHex('#1B5E20');
  static final Color blue = colorFromHex('#2196F3');
  static final Color red = colorFromHex('#FF0000');
  static final Color pink = colorFromHex('#BB86FC');
  static final Color purple = colorFromHex('#9C27B0');
  static final Color teal = colorFromHex('#008080');
  static final Color blueMagenta = colorFromHex('#151026');
  static final Color blueGrey = colorFromHex('#607D8B');
  static final Color deepOrange = colorFromHex('#FF5722');
  static final Color redAccent = colorFromHex('#FF5252');
  static final Color greem = colorFromHex('#10c43a');
  static final Color screaminGreen = colorFromHex('#66FF66');
  static final Color brightGreen = colorFromHex('#66FF00');
  static final Color grayX11Gray = colorFromHex('#BEBEBE');
  static final Color greenMunsell = colorFromHex('#00A877');
  static final Color greemm = colorFromHex('#469157');
  static final Color greemmm = colorFromHex('#1e570a');

  // * Theme
  static final Color darkMode = colorFromHex('#121212');
  static final Color lightMode = colorFromHex('#ffffff');

  // * list color
  // static final List<Color> btnAuth = [redAccent, deepOrange];
  static final List<Color> btnAuth = [greem, greemm];
}
