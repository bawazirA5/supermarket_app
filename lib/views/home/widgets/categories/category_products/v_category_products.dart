part of '../../../../../utils/import/u_import_app.dart';

class ViewCategoryProducts extends StatelessWidget {
  const ViewCategoryProducts(
      {super.key, required this.categoryId, required this.category});
  final int categoryId;
  final String category;

  @override
  Widget build(BuildContext context) {
    // * create controller product
    ControllerProduct controllerProduct =
        Provider.of<ControllerProduct>(context);

    return Scaffold(
      // * appbar
      appBar: WidgetAppBar(title: category),
      // * body
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: StreamBuilder<List<ModelProduct>>(
          stream: controllerProduct.getCategoryProducts(
              UtilsLangConfig.isEnglish(context)
                  ? 'products-en'
                  : 'products-ar',
              'categoryId',
              categoryId),
          builder: (context, snapshot) {
            // * waiting
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const WidgetProgress();
            }
            // * check active connection
            if (snapshot.connectionState == ConnectionState.active) {
              // * check has data
              if (snapshot.hasData) {
                return WidgetGridViewProducts(
                  snapshot: snapshot,
                );
              } else {
                // * no data
                return const WidgetErrorText(title: UtilsLangKey.errorNoData);
              }
            } else {
              // * no active
              return const WidgetErrorText(
                  title: UtilsLangKey.errorInitFirebase);
            }
          },
        ),
      ),
    );
  }
}
