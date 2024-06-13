part of '../../../../utils/import/u_import_app.dart';

class WidgetCategoryBody extends StatelessWidget {
  const WidgetCategoryBody({super.key});

  @override
  Widget build(BuildContext context) {
    // * create controller category
    ControllerCategory controllerCategory =
        Provider.of<ControllerCategory>(context);

    return StreamBuilder<List<ModelCategory>>(
      stream: controllerCategory.getAll(UtilsLangConfig.isEnglish(context)
          ? 'categories-en'
          : 'categories-ar'),
      builder: (context, snapshot) {
        // * waiting
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const WidgetProgress();
        }
        // * check active connection
        if (snapshot.connectionState == ConnectionState.active) {
          // * check has data
          if (snapshot.hasData) {
            return GridView.builder(
              // * count of categories
              itemCount: snapshot.data!.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                // * count of categories on cross axis
                crossAxisCount: 2,
                // * space between categories on cross axis
                crossAxisSpacing: (UtilsDime.l / UtilsDime.d5).w,
                // * space between categories on main axis
                mainAxisSpacing: (UtilsDime.l / UtilsDime.d5).w,
                // * height
                mainAxisExtent: (UtilsDime.xxxxl / UtilsDime.d5).h,
              ),
              itemBuilder: (BuildContext context, int index) {
                // * widget category card
                return WidgetCategoryCard(
                  data: snapshot.data![index],
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
    );
  }
}
