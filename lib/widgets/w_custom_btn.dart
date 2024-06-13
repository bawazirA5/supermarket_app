part of '../utils/import/u_import_app.dart';

class WidgetAuthBtn extends StatelessWidget {
  const WidgetAuthBtn({
    super.key,
    required this.title,
    required this.onTap,
    this.height,
  });
  final double? height;
  final String title;
  final void Function() onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Ink(
        height: (height ?? (UtilsDime.xl * UtilsDime.d2)).h,
        // padding: EdgeInsets.zero,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: AlignmentDirectional.topStart,
            end: AlignmentDirectional.bottomEnd,
            // stops: [0.5, 0.5],
            colors: UtilsColor.btnAuth,
          ),
          borderRadius: BorderRadius.circular(UtilsDime.md).r,
        ),
        child: Align(
          alignment: AlignmentDirectional.center,
          child: Text(
            title.tr().toUpperCase(),
            // textAlign: TextAlign.center,
            style: UtilsTheme.hSmall(context)?.copyWith(
              color: UtilsColor.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
