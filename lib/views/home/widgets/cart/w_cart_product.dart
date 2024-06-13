part of '../../../../utils/import/u_import_app.dart';

class WidgetCartProductCard extends StatelessWidget {
  const WidgetCartProductCard({
    super.key,
    required this.data,
  });
  final DBModelCart data;

  @override
  Widget build(BuildContext context) {
    /// [priceStyle] style of price
    TextStyle? priceStyle =
        UtilsTheme.bLarge(context)?.copyWith(fontWeight: FontWeight.bold);

    /// [quantityStyle] style of quantity & unitType
    TextStyle? quantityStyle = UtilsTheme.bMedium(context);
    return Container(
      // * height
      height: (UtilsDime.xxl + UtilsDime.xxl).h,
      // * padding
      padding: const EdgeInsets.all(UtilsDime.md + UtilsDime.xs).w,
      decoration: BoxDecoration(
        // * border radius
        borderRadius: BorderRadius.circular(UtilsDime.l.r),
      ),
      child: Row(
        children: [
          // * product image
          Expanded(
            child: Image.network(
              data.productImage ?? "",
            ),
          ),
          UtilsDime.md.horizontalSpace,
          Expanded(
            flex: 2,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // * product name
                        Text(data.productName ?? "",
                            style: UtilsTheme.bLarge(context)),
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
                    InkWell(
                      onTap: () async {
                        // * provider cart
                        ControllerCart pCart =
                            Provider.of<ControllerCart>(context, listen: false);

                        await pCart.removeCartProductFromDB(
                            data, data.productPrice!);
                        if (context.mounted) {
                          WidgetToast.buildToast(
                              context: context,
                              msg: pCart.message ?? "",
                              translation: true);
                        }
                      },
                      child: const Icon(Icons.clear),
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        // * decrease counter
                        InkWell(
                          borderRadius: BorderRadius.circular(UtilsDime.l).r,
                          onTap: () {
                            // * provider cart
                            ControllerCart pCart = Provider.of<ControllerCart>(
                                context,
                                listen: false);
                            num quantity = data.quantity!;
                            num price = data.initialPrice!;
                            quantity--;
                            num newPrice = price * quantity;
                            if (quantity > 0) {
                              pCart
                                  .updateProduct(DBModelCart(
                                id: data.id,
                                productId: data.id.toString(),
                                productName: data.productName,
                                initialPrice: data.initialPrice,
                                productPrice: newPrice,
                                quantity: quantity,
                                unitType: data.unitType,
                                productImage: data.productImage,
                                timeStamp: data.timeStamp,
                              ))
                                  .then((value) {
                                // newPrice = 0;
                                // quantity = 0;
                                pCart.removeTotalPrice(price);
                                // pCart.removeItemPrice(price);
                              }).onError((error, stackTrace) {
                                dev.log(error.toString());
                              });
                            }
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              // * border radius
                              borderRadius:
                                  BorderRadius.circular(UtilsDime.l).r,
                              // * border
                              border: Border.all(
                                color: const Color.fromARGB(255, 233, 231, 231),
                              ),
                            ),
                            padding: const EdgeInsets.all(
                                    UtilsDime.sm + UtilsDime.xs)
                                .w,
                            child: const Icon(
                              Icons.remove,
                              color: Colors.green,
                            ),
                          ),
                        ),
                        Container(
                          padding:
                              const EdgeInsets.all(UtilsDime.md + UtilsDime.sm)
                                  .w,
                          child: Text("${data.quantity}"),
                        ),
                        // * increase counter
                        InkWell(
                          borderRadius: BorderRadius.circular(UtilsDime.l).r,
                          onTap: () {
                            // * provider cart
                            ControllerCart pCart = Provider.of<ControllerCart>(
                                context,
                                listen: false);
                            num quantity = data.quantity!;
                            num price = data.initialPrice!;
                            quantity++;
                            num newPrice = price * quantity;
                            pCart
                                .updateProduct(DBModelCart(
                              id: data.id,
                              productId: data.id.toString(),
                              productName: data.productName,
                              initialPrice: data.initialPrice,
                              productPrice: newPrice,
                              quantity: quantity,
                              unitType: data.unitType,
                              productImage: data.productImage,
                              timeStamp: data.timeStamp,
                            ))
                                .then((value) {
                              // newPrice = 0;
                              // quantity = 0;
                              pCart.addTotalPrice(price);
                              // pCart.addItemPrice(price);
                            }).onError((error, stackTrace) {
                              dev.log(error.toString());
                            });
                          },
                          child: Container(
                            // * border radius
                            decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.circular(UtilsDime.l).r,
                              // * border
                              border: Border.all(
                                color: const Color.fromARGB(255, 233, 231, 231),
                              ),
                            ),
                            padding: const EdgeInsets.all(
                                    UtilsDime.sm + UtilsDime.xs)
                                .w,
                            child: const Icon(
                              Icons.add,
                              color: Colors.green,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        // * product price
                        Text(
                          '${data.productPrice}',
                          style: priceStyle,
                        ),
                        Text(
                          '\$',
                          style: priceStyle,
                        ),
                      ],
                    )
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
