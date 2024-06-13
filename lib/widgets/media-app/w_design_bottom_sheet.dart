part of '../../utils/import/u_import_app.dart';

class WidgetDesignBottomSheet extends StatelessWidget {
  const WidgetDesignBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    // * create controller image user
    ControllerImage authImage = Provider.of<ControllerImage>(context);
    return Container(
        height: (UtilsDime.xxxl + UtilsDime.xl).h,
        padding: EdgeInsets.all(UtilsDime.l.w),
        child: Column(
          children: [
            // * title
            Text(UtilsLangKey.chooseProfile.tr()),

            // * space
            UtilsDime.l.verticalSpace,

            // * choice gallery or camera
            Expanded(
              // flex: 3,
              child: Row(
                children: [
                  // * gallery
                  WidgetMediaSelected(
                    image: UtilsImage.gallery,
                    title: UtilsLangKey.gallery,
                    onTap: () => authImage.selectImage(context),
                  ),
                  // * camera
                  WidgetMediaSelected(
                    image: UtilsImage.camera,
                    title: UtilsLangKey.camera,
                    onTap: () =>
                        authImage.selectImage(context, isGallery: false),
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}
