part of '../../utils/import/u_import_app.dart';

class WidgetMediaSelected extends StatelessWidget {
  const WidgetMediaSelected({
    super.key,
    required this.image,
    required this.title,
    required this.onTap,
  });
  final String image;
  final String title;
  final void Function() onTap;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        borderRadius: BorderRadius.circular(UtilsDime.l.r),
        onTap: onTap,
        child: Ink(
          child: Column(
            children: [
              Expanded(
                flex: 2,
                child: Image(
                  image: AssetImage(image),
                ),
              ),
              UtilsDime.sm.verticalSpace,
              Flexible(
                child: Text(
                  title.tr(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
