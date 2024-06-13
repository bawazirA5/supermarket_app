part of './../../../../utils/import/u_import_app.dart';

// class WidgetCardBody extends StatelessWidget {
//   const WidgetCardBody({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Consumer<ModelCart>(
//       builder: (context, cart, child) {
//         // * padding for cart
//         return Padding(
//           padding:
//               const EdgeInsets.only(right: 15, left: 15, bottom: 10, top: 5),
//           // * column
//           child: Column(
//             // * cart products
//             children: [
//               Expanded(
//                 child: ListView.separated(
//                   separatorBuilder: (context, index) {
//                     // horizontal line
//                     return const Divider(
//                       thickness: 1,
//                       height: 5,
//                     );
//                   },
//                   // number of products inside cart
//                   itemCount: cart.cart.length,
//                   itemBuilder: (BuildContext context, int index) {
//                     ModelProductt product = cart.cart[index];
//                     // * product
//                     return SizedBox(
//                       height: 130,
//                       child: Row(
//                         children: [
//                           // * product image
//                           Expanded(
//                             child: Image.asset(
//                               product.productImage,
//                               height: 60,
//                               width: 60,
//                             ),
//                           ),
//                           // * product details
//                           Expanded(
//                             flex: 2,
//                             child: Column(
//                               mainAxisAlignment: MainAxisAlignment.spaceAround,
//                               children: [
//                                 Column(
//                                   crossAxisAlignment: CrossAxisAlignment.start,
//                                   children: [
//                                     Row(
//                                       mainAxisAlignment:
//                                           MainAxisAlignment.spaceBetween,
//                                       children: [
//                                         // product name
//                                         Text(
//                                           product.productName,
//                                           style: const TextStyle(
//                                             fontWeight: FontWeight.bold,
//                                           ),
//                                         ),
//                                         // product remove icon
//                                         InkWell(
//                                           onTap: () {
//                                             cart.remove(cart.cart[index]);
//                                             ScaffoldMessenger.of(context)
//                                                 .showSnackBar(
//                                               const SnackBar(
//                                                 content: Text(
//                                                   'product removed successfully',
//                                                   style: TextStyle(
//                                                     color: Colors.white,
//                                                   ),
//                                                 ),
//                                                 backgroundColor: Colors.red,
//                                                 duration: Duration(
//                                                   seconds: 2,
//                                                 ),
//                                               ),
//                                             );
//                                           },
//                                           child: const Icon(Icons.clear),
//                                         )
//                                       ],
//                                     ),
//                                     // product quantity and unit type
//                                     Text(
//                                       product.productQuantity.toString() +
//                                           product.productUnitType,
//                                       style: const TextStyle(
//                                         fontWeight: FontWeight.bold,
//                                         fontSize: 12,
//                                         color:
//                                             Color.fromARGB(255, 143, 137, 137),
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                                 Row(
//                                   mainAxisAlignment:
//                                       MainAxisAlignment.spaceBetween,
//                                   children: [
//                                     // counter increase and decrease
//                                     Row(
//                                       children: [
//                                         // decrease counter
//                                         InkWell(
//                                           onTap: () {
//                                             cart.decrement(product);
//                                           },
//                                           child: Container(
//                                             decoration: BoxDecoration(
//                                               // border radius
//                                               borderRadius:
//                                                   BorderRadius.circular(15),
//                                               // border
//                                               border: Border.all(
//                                                 color: const Color.fromARGB(
//                                                     255, 233, 231, 231),
//                                               ),
//                                             ),
//                                             padding: const EdgeInsets.all(6),
//                                             child: const Icon(
//                                               Icons.remove,
//                                               color: Colors.green,
//                                             ),
//                                           ),
//                                         ),
//                                         // counter
//                                         Container(
//                                             padding: const EdgeInsets.all(12),
//                                             child: Text(cart.counters.isNotEmpty
//                                                 ? cart.counters[index]
//                                                     .toString()
//                                                 : '1')),
//                                         // increase counter
//                                         InkWell(
//                                           onTap: () {
//                                             cart.increment(product);
//                                           },
//                                           child: Container(
//                                             // border radius
//                                             decoration: BoxDecoration(
//                                               borderRadius:
//                                                   BorderRadius.circular(
//                                                 15,
//                                               ),
//                                               // border
//                                               border: Border.all(
//                                                 color: const Color.fromARGB(
//                                                     255, 233, 231, 231),
//                                               ),
//                                             ),
//                                             padding: const EdgeInsets.all(6),
//                                             child: const Icon(
//                                               Icons.add,
//                                               color: Colors.green,
//                                             ),
//                                           ),
//                                         ),
//                                       ],
//                                     ),
//                                     // product price
//                                     Text('\$${product.productPrice}'),
//                                   ],
//                                 ),
//                               ],
//                             ),
//                           )
//                         ],
//                       ),
//                     );
//                   },
//                 ),
//               ),
//               Column(
//                 children: [
//                   // * total price
//                   SizedBox(
//                     // height
//                     height: 50,
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceAround,
//                       children: [
//                         // text
//                         const Text(
//                           'Total Price:',
//                           // text style
//                           style: TextStyle(
//                             fontWeight: FontWeight.w500,
//                           ),
//                         ),
//                         // total price
//                         Text(
//                           '\$${cart.totalPrice}',
//                         ),
//                       ],
//                     ),
//                   ),
//                   // * checkout
//                   InkWell(
//                     onTap: () {},
//                     child: Container(
//                       // height
//                       height: 50,
//                       decoration: BoxDecoration(
//                         // color
//                         color: Colors.green,
//                         // border radius
//                         borderRadius: BorderRadius.circular(20),
//                       ),
//                       child: const Center(
//                         // text
//                         child: Text(
//                           'Go to Checkout',
//                           // text style
//                           style: TextStyle(
//                             fontSize: 17,
//                             fontWeight: FontWeight.w500,
//                             color: Colors.white,
//                           ),
//                         ),
//                       ),
//                     ),
//                   ),
//                 ],
//               )
//             ],
//           ),
//         );
//       },
//     );
//   }
// }

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

class WidgetCartBody extends StatefulWidget {
  const WidgetCartBody({super.key});

  @override
  State<WidgetCartBody> createState() => _WidgetCartBodyState();
}

class _WidgetCartBodyState extends State<WidgetCartBody> {
  @override
  Widget build(BuildContext context) {
    // * provider cart
    ControllerCart pCart = Provider.of<ControllerCart>(context);
    return Column(
      children: [
        Expanded(
          child: FutureBuilder(
            future: pCart.getData(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (pCart.cart.isEmpty) {
                return const WidgetErrorText(
                    title: UtilsLangKey.notHaveCartProduct);
              }
              if (snapshot.hasData) {
                return ListView.separated(
                  itemCount: snapshot.data.length,
                  itemBuilder: (context, index) {
                    dev.log("body");
                    return WidgetCartProductCard(
                      data: snapshot.data[index],
                    );
                  },
                  separatorBuilder: (BuildContext context, int index) {
                    return const Divider(
                      thickness: 1,
                      height: 5,
                    );
                  },
                );
              } else {
                return const Text('no');
              }
            },
          ),
        ),
        Consumer<ControllerCart>(
          builder: (context, value, child) {
            return Visibility(
              visible: value.getTotalPrice().toStringAsFixed(2) == "0.00"
                  ? false
                  : true,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    UtilsLangKey.total.tr(),
                  ),
                  Text(
                    r'$' + value.getTotalPrice().toStringAsFixed(2).toString(),
                  )
                ],
              ),
            );
          },
        )
      ],
    );
  }
}
