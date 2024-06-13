part of '../../../../utils/import/u_import_app.dart';

class WidgetShopBody extends StatelessWidget {
  const WidgetShopBody({super.key});

  @override
  Widget build(BuildContext context) {
    /// [verticalSpace]  SizedBox 16 height
    SizedBox verticalSpace = UtilsDime.md.verticalSpace;
    return SingleChildScrollView(
      // * padding for shop body
      child: Column(
        children: [
          // * space
          verticalSpace,
          // * image slider
          const WidgetImageSlider(),
          // * space
          verticalSpace,
          // * exclusive offer
          WidgetProductType(title: UtilsLangKey.exclusiveOffers.tr()),
          // * space
          verticalSpace,
          // * exclusive offer products
          const WidgetProductsSection(
            keyText: 'isExclusiveOffer',
            value: true,
          ),
          // * space
          verticalSpace,
          // * best selling
          WidgetProductType(title: UtilsLangKey.bestSeller.tr()),
          // * space
          verticalSpace,
          // * best selling products
          const WidgetProductsSection(
            keyText: 'isBestSelling',
            value: true,
          ),
        ],
      ),
    );
  }
}
