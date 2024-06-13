part of '../../../../../utils/import/u_import_app.dart';

class WidgetAddProduct extends StatelessWidget {
  const WidgetAddProduct({
    super.key,
    required this.data,
  });
  final ModelProduct data;
  @override
  Widget build(BuildContext context) {
    // * provider cart
    ControllerCart pCart = Provider.of<ControllerCart>(context);

    return InkWell(
      borderRadius: BorderRadius.circular((UtilsDime.l / UtilsDime.d5).r),
      onTap: () async {
        if (await pCart.addCartProductToDB(
          DBModelCart(
            id: data.id,
            productId: data.id.toString(),
            productName: data.name,
            productPrice: data.price,
            initialPrice: data.price,
            productImage: data.image,
            quantity: 1,
            unitType: data.unitType,
            timeStamp: DateTime.now().microsecondsSinceEpoch.toString(),
          ),
          data.price!,
        ))
        // pCart.addTotalPrice(data.price!.toDouble());
        // todo: edit
        // pCart.addItemPrice(data.price!);
        // pCart.addCounter();
        // pCart._totalPrice = 0.0;
        if (context.mounted) {
          WidgetToast.buildToast(
            context: context,
            msg: pCart.message ?? "",
            translation: true,
          );
        }
      },
      child: Ink(
        // * padding
        padding: EdgeInsets.all(UtilsDime.md.w),
        decoration: BoxDecoration(
          // * background color
          color: UtilsColor.greenMunsell,
          // * border radius
          borderRadius: BorderRadius.circular((UtilsDime.l / UtilsDime.d5).r),
        ),
        // * add icon
        child: Icon(
          Icons.add,
          color: UtilsColor.white,
        ),
      ),
    );
  }
}
