part of './../../../utils/import/u_import_app.dart';

class WidgetBodyDrawer extends StatelessWidget {
  const WidgetBodyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Column(
        children: [
          // * drawer header
          WidgetHeaderDrawer(),
          // * divider 0.5
          Divider(
            thickness: UtilsDime.half,
          ),
          // * drawer
          WidgetServiceDrawer(),
        ],
      ),
    );
  }
}
