part of './../../../../utils/import/u_import_app.dart';

class WidgetUserImageDrawer extends StatelessWidget {
  const WidgetUserImageDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    ControllerAuth auth = Provider.of<ControllerAuth>(context, listen: false);

    /// [sizeImage] size for image
    double sizeImage = (UtilsDime.xxxl / UtilsDime.d3).w;
    return Container(
      width: sizeImage,
      height: sizeImage,
      decoration: BoxDecoration(
        // * image
        image: DecorationImage(
          image: NetworkImage(
            auth.userPhoto,
          ),
          fit: BoxFit.cover,
        ),
        // * shape circle
        shape: BoxShape.circle,
        // * border all side
        border: Border.all(
          width: (UtilsDime.sm / UtilsDime.d4).w,
          color:
              UtilsTheme.isDark(context) ? UtilsColor.teal : UtilsColor.purple,
        ),
      ),
    );
  }
}
