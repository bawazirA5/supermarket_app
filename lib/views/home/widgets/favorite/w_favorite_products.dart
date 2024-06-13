part of './../../../../utils/import/u_import_app.dart';

// class WidgetFavoriteProducts extends StatelessWidget {
//   const WidgetFavoriteProducts({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Consumer<ModelFavorite>(
//       builder: (BuildContext context, favorite, Widget? child) {
//         return ListView.separated(
//             itemBuilder: (BuildContext context, int index) {
//               return Container(
//                 color: Colors.amber,
//                 height: 200,
//               );
//             },
//             separatorBuilder: (BuildContext context, int index) {
//               return Divider();
//             },
//             itemCount: favorite.favorite.length);
//       },
//     );
//   }
// }

class WidgetFavoriteBody extends StatefulWidget {
  const WidgetFavoriteBody({super.key});

  @override
  State<WidgetFavoriteBody> createState() => _WidgetFavoriteBodyState();
}

class _WidgetFavoriteBodyState extends State<WidgetFavoriteBody> {
  @override
  void initState() {
    super.initState();
    // * provider favorite
    ControllerFavorite pFavorite =
        Provider.of<ControllerFavorite>(context, listen: false);

    pFavorite.fetchDataProductFromDB;
  }

  @override
  Widget build(BuildContext context) {
    // * provider favorite
    ControllerFavorite pFavorite = Provider.of<ControllerFavorite>(context);
    return (pFavorite.dataList?.isNotEmpty) ?? false
        ? GridView.builder(
            // * count of products
            itemCount: pFavorite.dataList!.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              // * count of products on cross axis
              crossAxisCount: 2,
              // * space between products on cross axis
              crossAxisSpacing: 10,
              // * space between products on main axis
              mainAxisSpacing: 10,
              // * height
              mainAxisExtent:
                  ((UtilsDime.xxxl + UtilsDime.xxxl) / UtilsDime.d1).h,
            ),
            itemBuilder: (BuildContext context, int index) {
              // * product card
              return WidgetProductCard(
                bodyFavorite: true,
                data: pFavorite
                    .convertDBFavoriteToObject(pFavorite.dataList![index]),
              );
            },
          )
        : const WidgetErrorText(title: UtilsLangKey.notHaveFavoriteProduct);
  }
}
