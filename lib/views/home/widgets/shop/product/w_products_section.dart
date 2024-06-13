part of '../../../../../utils/import/u_import_app.dart';

class WidgetProductsSection extends StatelessWidget {
  const WidgetProductsSection(
      {super.key, required this.keyText, required this.value});
  final String keyText;
  final bool value;

  @override
  Widget build(BuildContext context) {
    // * create controller products
    ControllerProduct controllerProducts =
        Provider.of<ControllerProduct>(context);

    return SizedBox(
      height: ((UtilsDime.xxxl + UtilsDime.xxxl) / UtilsDime.d1).h,
      child: StreamBuilder<List<ModelProduct>>(
        stream: controllerProducts.getProducts(
            UtilsLangConfig.isEnglish(context) ? 'products-en' : 'products-ar',
            keyText,
            value,
            1),
        builder: (context, snapshot) {
          // * waiting
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const WidgetProgress();
          }
          // * check active connection
          if (snapshot.connectionState == ConnectionState.active) {
            // * check has data
            if (snapshot.hasData) {
              return ListView.builder(
                // * scroll direction of list view
                scrollDirection: Axis.horizontal,
                // * count of products
                itemCount: snapshot.data!.length,
                itemBuilder: (BuildContext context, int index) {
                  return Row(
                    children: [
                      // * product card
                      WidgetProductCard(
                        data: snapshot.data![index],
                      ),
                      // * space 16
                      UtilsDime.l.horizontalSpace
                    ],
                  );
                },
              );
            } else {
              // * no data
              return const WidgetErrorText(title: UtilsLangKey.errorNoData);
            }
          } else {
            // * no active
            return const WidgetErrorText(title: UtilsLangKey.errorInitFirebase);
          }
        },
      ),
    );
  }
}
