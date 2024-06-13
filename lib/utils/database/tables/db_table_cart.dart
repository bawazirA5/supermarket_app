part of './../../import/u_import_app.dart';

// * table name cart
/// -----------------------------------------------------------------------
/// id | productId| productName | productPrice | initialPrice | ProductImage | quantity |  unitType | timeStamp |
///    |          |              |             |              |              |          |           |           | 1
///    |          |              |             |              |              |          |           |           | 2
///    |          |              |             |              |              |          |           |           | 3
///    |          |              |             |              |              |          |           |           |
///    |          |              |             |              |              |          |           |           |
///    |          |              |             |              |              |          |           |           |
///    |          |              |             |              |              |          |           |           |
///    |          |              |             |              |              |          |           |           |
/// -----------------------------------------------------------------------
class DBTableCart {
  static const String nameTable = 'cart';
  static const String colId = 'id';
  static const String colProductId = 'productId';
  static const String colProductName = 'productName';
  static const String colProductPrice = 'productPrice';
  static const String colInitialPrice = 'initialPrice';
  static const String colProductImage = 'productImage';
  static const String colQuantity = 'quantity';
  static const String colUnitType = 'unitType';
  static const String colTimeStamp = 'timeStamp';
}
