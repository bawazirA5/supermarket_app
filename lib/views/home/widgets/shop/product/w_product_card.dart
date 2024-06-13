part of '../../../../../utils/import/u_import_app.dart';

class WidgetProductCard extends StatelessWidget {
  const WidgetProductCard({
    super.key,
    required this.data,
    this.bodyFavorite = false,
  });
  final ModelProduct data;
  final bool bodyFavorite;

  @override
  Widget build(BuildContext context) {
    /// [priceStyle] style of price
    TextStyle? priceStyle =
        UtilsTheme.bLarge(context)?.copyWith(fontWeight: FontWeight.bold);

    // * provider favorite
    ControllerFavorite pFavorite = Provider.of<ControllerFavorite>(context);

    // * convert to dbModelArticle
    DBModelFavorite dbModelFavorite = pFavorite.convertObjectToDBFavorite(data);

    /// [quantityStyle] style of quantity & unitType
    TextStyle? quantityStyle = UtilsTheme.bMedium(context);

    return Container(
      // * width
      width: (UtilsDime.xxxl + UtilsDime.xl).w,
      // * padding
      padding: const EdgeInsets.all(UtilsDime.md + UtilsDime.xs).w,
      decoration: BoxDecoration(
        // * border
        border: Border.all(
          color: UtilsColor.grayX11Gray,
        ),
        // * border radius
        borderRadius: BorderRadius.circular(UtilsDime.l.r),
      ),
      child: Stack(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // * product image
              Center(
                child: Image.network(
                  data.image ?? "",
                  // * image height
                  height: (UtilsDime.xxxl).h,
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // * product name
                  Text(data.name ?? "", style: UtilsTheme.bLarge(context)),
                  Row(
                    children: [
                      // * product quantity
                      Text(
                        '${data.quantity}',
                        style: quantityStyle,
                      ),
                      // * product unit type
                      Text(
                        ' ${data.unitType}',
                        style: quantityStyle,
                      ),
                    ],
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // * product price
                  Row(
                    children: [
                      Text(
                        '${data.price}',
                        style: priceStyle,
                      ),
                      Text(
                        '\$',
                        style: priceStyle,
                      ),
                    ],
                  ),
                  // * add product
                  WidgetAddProduct(
                    data: data,
                  )
                ],
              )
            ],
          ),
          IconButton(
            onPressed: () async {
              if (bodyFavorite) {
                if (await pFavorite
                    .removeFavoriteProductFromDB(dbModelFavorite)) {
                  pFavorite.removeFavoriteItemList(dbModelFavorite.id!);
                }
              } else {
                await pFavorite.mangeFavorite(dbModelFavorite);
                if (context.mounted) {
                  WidgetToast.buildToast(
                      context: context,
                      msg: pFavorite.message ?? '',
                      translation: false);
                }
              }
            },
            icon: FutureBuilder(
              future: pFavorite
                  .manageIcon(pFavorite.convertObjectToDBFavorite(data)),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return snapshot.data!;
                }
                return Container();
              },
            ),
            iconSize: UtilsDime.xl.w,
          )
        ],
      ),
    );
  }
}
