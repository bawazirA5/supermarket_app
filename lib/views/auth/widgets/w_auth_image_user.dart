part of '../../../utils/import/u_import_app.dart';

class WidgetAuthImageUser extends StatelessWidget {
  const WidgetAuthImageUser({super.key});

  @override
  Widget build(BuildContext context) {
    ControllerImage controllerImage = Provider.of<ControllerImage>(context);
    return InkWell(
      borderRadius: BorderRadius.circular(UtilsDime.xxl.r),
      onTap: () {
        // * bottom Sheet
        showMaterialModalBottomSheet(
          context: context,
          builder: (context) {
            return const WidgetDesignBottomSheet();
          },
        );
      },
      child: Stack(
        children: [
          Ink(
            width: UtilsDime.xxxl.w,
            height: UtilsDime.xxxl.w,
            // padding: EdgeInsets.zero,
            decoration: BoxDecoration(
              color: Colors.transparent,
              shape: BoxShape.circle,
              border:
                  Border.all(color: UtilsColor.greemmm, width: UtilsDime.xs.w),
              image: DecorationImage(
                  image: controllerImage.getImageUser(), fit: BoxFit.fill),
            ),
          ),
          PositionedDirectional(
            bottom: 0,
            end: 5,
            child: Icon(
              CupertinoIcons.pencil_circle_fill,
              size: UtilsDime.xl.w,
              color: UtilsColor.greemm,
            ),
          )
        ],
      ),
    );
  }
}
