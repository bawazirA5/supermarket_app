part of '../../utils/import/u_import_app.dart';

class ViewHome extends StatelessWidget {
  const ViewHome({super.key});

  @override
  Widget build(BuildContext context) {
    // * create provider navigation
    ControllerNavigationBar pNavigation =
        Provider.of<ControllerNavigationBar>(context);

    return Scaffold(
      // * appbar
      appBar: const WidgetAppBar(),
      // * drawer
      drawer: const Drawer(
        child: WidgetBodyDrawer(),
      ),
      // * body
      body: Padding(
        padding: const EdgeInsets.all(UtilsDime.md).w,
        child: PageView(
            // * PageView controller
            controller: pNavigation.controllerPageView,
            // * prevent scroll between children of pageView
            physics: const NeverScrollableScrollPhysics(),
            children: pNavigation.pageViewChildren),
      ),
      // * bottom navigation bar
      bottomNavigationBar: const WidgetBottomNavigation(),
    );
  }
}
