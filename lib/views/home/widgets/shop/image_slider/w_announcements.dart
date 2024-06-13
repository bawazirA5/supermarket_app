part of '../../../../../utils/import/u_import_app.dart';

class WidgetAnnouncements extends StatelessWidget {
  const WidgetAnnouncements({super.key});

  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
      // * count of images
      itemCount: imageSlider.length,
      itemBuilder: (BuildContext context, int itemIndex, int pageViewIndex) =>
          Image.asset(
        imageSlider[itemIndex],
        // * images take full width and height of sizedBox
        fit: BoxFit.fill,
      ),
      options: CarouselOptions(
        // * height
        height: (UtilsDime.xxxl + UtilsDime.l).h,
        // * means image take full width of sizedBox
        viewportFraction: 1,
        // * auto play
        autoPlay: true,
        // * duration of auto play
        autoPlayInterval: const Duration(
          seconds: 3,
        ),
        // * performed when change image slider
        onPageChanged: (int index, CarouselPageChangedReason reason) {
          // * create provider navigation
          ControllerNavigationBar pNavigation =
              Provider.of<ControllerNavigationBar>(context, listen: false);
          pNavigation.changeIndicatorIndex(index);
        },
      ),
    );
  }
}

// todo : edit
// * list of images
List imageSlider = [
  'assets/images/slider/1.jpg',
  'assets/images/slider/2.jpg',
  'assets/images/slider/3.jpg',
  'assets/images/slider/4.jpg',
];
