part of '../../../../utils/import/u_import_app.dart';

class WidgetCategoryCard extends StatelessWidget {
  const WidgetCategoryCard({super.key, required this.data});
  final ModelCategory data;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(UtilsDime.l.r),
      // this function use to move to view product details
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ViewCategoryProducts(
              category: data.name, categoryId: data.id,
             
            ),
          ),
        );
      },
      child: Container(
        // * padding
        padding: const EdgeInsets.all(UtilsDime.l / UtilsDime.d5).w,
        decoration: BoxDecoration(
          // * border
          border: Border.all(
            color: UtilsColor.grayX11Gray,
          ),
          // * border radius
          borderRadius: BorderRadius.circular(UtilsDime.l.r),
        ),
        // * category name & image
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            // * image
            Image.network(
              data.image,
              height: (UtilsDime.xxl + UtilsDime.l).h,
            ),
            // * name
            Text(
              data.name,
              textAlign: TextAlign.center,
              style: UtilsTheme.tSmall(context)
                  ?.copyWith(fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
