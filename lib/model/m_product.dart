// ignore_for_file: public_member_api_docs, sort_constructors_first
part of './../../utils/import/u_import_app.dart';

class ModelProduct {
  int? id;
  String? name;
  num? price;
  String? image;
  num? quantity;
  // todo : edit
  String? unitType;

  ModelProduct({
    this.id,
    this.name,
    this.price,
    this.image,
    this.quantity,
    this.unitType,
  });

  // get id => _id;
  // set id(value) => _id = value;

  // get name => _name;
  // set name(value) => _name = value;

  // get price => _price;
  // set price(value) => _price = value;

  // get image => _image;
  // set image(value) => _image = value;

  // get quantity => _quantity;
  // set quantity(value) => _quantity = value;

  // get unitType => _unitType;
  // set unitType(value) => _unitType = value;

  // * used to read data format map, save on attribute
  ModelProduct.fromMap(Map<String, dynamic> map) {
    id = map['id'];
    name = map['name'];
    price = map['price'];
    image = map['image'];
    quantity = map['quantity'];
    unitType = map['unitType'];
  }

  /// [toMap] convert object dart to map
  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'price': price,
      'image': image,
      'quantity': quantity,
      'unitType': unitType,
    };
  }

  @override
  String toString() {
    return 'ModelProduct(_id: $id, _name: $name, _price: $price, _image: $image, _quantity: $quantity, _unitType: $unitType)';
  }
}
