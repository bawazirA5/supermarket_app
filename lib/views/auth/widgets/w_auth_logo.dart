part of '../../../utils/import/u_import_app.dart';

class WidgetAuthLogo extends StatelessWidget {
  const WidgetAuthLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(UtilsDime.md.r),
        child: Image(
          width: UtilsDime.xxxl.w,
          height: UtilsDime.xxxl.w,
          image: const AssetImage(UtilsImage.logo),
        ),
      ),
    );
  }
}
