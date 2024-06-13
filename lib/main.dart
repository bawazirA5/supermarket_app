import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:supermarket/utils/import/u_import_app.dart';
// import 'package:supermarket/views/v_home.dart';

void main() async {
  // * flutter engine
  WidgetsFlutterBinding.ensureInitialized();
  await Future.wait([
    // * language engine
    EasyLocalization.ensureInitialized(),
    // * delay splash screen 2 minutes
    // Future.delayed(
    //   const Duration(seconds: 2),
    //   () {
    //     // * get data from api
    //     // * remove splash screen
    //     FlutterNativeSplash.remove();
    //   },
    // )
  ]);
  runApp(
    const InitStructure(),
  );
}
