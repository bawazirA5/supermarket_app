// ignore_for_file: public_member_api_docs, sort_constructors_first
part of './../../import/u_import_app.dart';

class DBModelFavorite {
  int? id;
  String? name;
  num? price;
  String? image;
  num? quantity;
  String? unitType;
  String? timeStamp;
  

  DBModelFavorite({
    this.id,
    this.name,
    this.price,
    this.image,
    this.quantity,
    this.unitType,
    this.timeStamp,
  });

  DBModelFavorite.formMap({required Map<String, dynamic> map}) {
    id = map[DBTableFavorite.colId];
    name = map[DBTableFavorite.colName];
    price = map[DBTableFavorite.colPrice];
    image = map[DBTableFavorite.colImage];
    quantity = map[DBTableFavorite.colQuantity];
    unitType = map[DBTableFavorite.colUnitType];
    timeStamp = map[DBTableFavorite.colTimeStamp];
  }

  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data[DBTableFavorite.colId] = id;
    data[DBTableFavorite.colName] = name;
    data[DBTableFavorite.colPrice] = price;
    data[DBTableFavorite.colImage] = image;
    data[DBTableFavorite.colQuantity] = quantity;
    data[DBTableFavorite.colUnitType] = unitType;
    data[DBTableFavorite.colTimeStamp] = timeStamp;
    return data;
  }

  

  @override
  String toString() {
    return 'DBModelFavorite(id: $id, name: $name, price: $price, image: $image, quantity: $quantity, unitType: $unitType, timeStamp: $timeStamp)';
  }
}
