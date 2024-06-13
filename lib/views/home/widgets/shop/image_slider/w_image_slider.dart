part of '../../../../../utils/import/u_import_app.dart';

class WidgetImageSlider extends StatefulWidget {
  const WidgetImageSlider({super.key});

  @override
  State<WidgetImageSlider> createState() => _WidgetImageSliderState();
}

class _WidgetImageSliderState extends State<WidgetImageSlider> {
  @override
  void initState() {
    super.initState();
    // * create provider navigation
    ControllerNavigationBar pNavigation =
        Provider.of<ControllerNavigationBar>(context, listen: false);
    pNavigation.indicatorIndex = 0;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: (UtilsDime.xxxl + UtilsDime.l).h,
      child: const Stack(
        children: [
          // * image slider announcements
          WidgetAnnouncements(),
          // * Indicators
          WidgetIndicator(),
        ],
      ),
    );
  }
}
