part of '../../../../../utils/import/u_import_app.dart';

class WidgetIndicator extends StatelessWidget {
  const WidgetIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    // * create provider navigation
    ControllerNavigationBar pNavigation =
        Provider.of<ControllerNavigationBar>(context);

    return Padding(
      padding: EdgeInsets.only(bottom: UtilsDime.md.w),
      // * location of indicators
      child: Align(
        alignment: Alignment.bottomCenter,
        child: AnimatedSmoothIndicator(
          // * active index for Indicators
          activeIndex: pNavigation.indicatorIndex,
          // * count of indicators
          count: 4,
          // * dots style
          effect: ExpandingDotsEffect(
            dotHeight: UtilsDime.md.w,
            dotWidth: UtilsDime.md.w,
            activeDotColor: UtilsColor.grayX11Gray,
            dotColor: UtilsColor.black,
          ),
        ),
      ),
    );
  }
}
