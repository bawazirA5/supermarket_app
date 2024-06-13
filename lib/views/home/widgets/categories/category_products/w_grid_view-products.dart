part of '../../../../../utils/import/u_import_app.dart';

class WidgetGridViewProducts extends StatelessWidget {
  const WidgetGridViewProducts({
    super.key,
    required this.snapshot,
  });
  final AsyncSnapshot<List<ModelProduct>> snapshot;
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      // * count of products
      itemCount: snapshot.data!.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        // * count of products on cross axis
        crossAxisCount: 2,
        // * space between products on cross axis
        crossAxisSpacing: 10,
        // * space between products on main axis
        mainAxisSpacing: 10,
        // * height
        mainAxisExtent: ((UtilsDime.xxxl + UtilsDime.xxxl) / UtilsDime.d1).h,
      ),
      itemBuilder: (BuildContext context, int index) {
        // * product card
        return WidgetProductCard(
          data: snapshot.data![index],
        );
      },
    );
  }
}
