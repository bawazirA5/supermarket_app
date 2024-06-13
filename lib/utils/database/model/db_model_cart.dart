// ignore_for_file: public_member_api_docs, sort_constructors_first
part of './../../import/u_import_app.dart';

class DBModelCart {
  int? id;
  String? productId;
  String? productName;
  num? productPrice;
  num? initialPrice;
  String? productImage;
  num? quantity;
  String? unitType;
  String? timeStamp;
  DBModelCart({
    this.id,
    this.productId,
    this.productName,
    this.productPrice,
    this.initialPrice,
    this.productImage,
    this.quantity,
    this.unitType,
    this.timeStamp,
  });

  DBModelCart.formMap({required Map<String, dynamic> map}) {
    id = map[DBTableCart.colId];
    productId = map[DBTableCart.colProductId];
    productName = map[DBTableCart.colProductName];
    productPrice = map[DBTableCart.colProductPrice];
    initialPrice = map[DBTableCart.colInitialPrice];
    productImage = map[DBTableCart.colProductImage];
    quantity = map[DBTableCart.colQuantity];
    unitType = map[DBTableCart.colUnitType];
    timeStamp = map[DBTableCart.colTimeStamp];
  }

  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data[DBTableCart.colId] = id;
    data[DBTableCart.colProductId] = productId;
    data[DBTableCart.colProductName] = productName;
    data[DBTableCart.colProductPrice] = productPrice;
    data[DBTableCart.colInitialPrice] = initialPrice;
    data[DBTableCart.colProductImage] = productImage;
    data[DBTableCart.colQuantity] = quantity;
    data[DBTableCart.colUnitType] = unitType;
    data[DBTableCart.colTimeStamp] = timeStamp;
    return data;
  }

  

  @override
  String toString() {
    return 'DBModelCart(id: $id, productId: $productId, productName: $productName, productPrice: $productPrice, initialPrice: $initialPrice, productImage: $productImage, quantity: $quantity, unitType: $unitType, timeStamp: $timeStamp)';
  }
}
