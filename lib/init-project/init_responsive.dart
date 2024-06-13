part of '../utils/import/u_import_app.dart';

class InitResponsive extends StatelessWidget {
  const InitResponsive({super.key, required this.child});
  final Widget child;
  @override
  Widget build(BuildContext context) {
    // * screen util package
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      child: child,
    );
  }
}
