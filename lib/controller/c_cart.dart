part of '../utils/import/u_import_app.dart';

class ControllerCart extends ChangeNotifier {
  /// [message] feedback user
  String? message;

  /// [changeMessage] update to message
  set changeMessage(String msg) {
    message = msg;
    notifyListeners();
  }

  /// [mangeAddProduct] check product case when found in database not cart
  /// otherwise not found product in database cart
  Future<bool> mangeAddProduct(
      DBModelCart data, num price, double itemPrice) async {
    if (await DBQueryProduct.db.getProductById(data, DBTableCart.nameTable) ==
        null) {
      // * not found data product  in database
      // * add product on database
      return await addCartProductToDB(data, price);
    } else {
      // * found data product in database
      // * delete from database
      return await removeCartProductFromDB(data, itemPrice);
    }
  }

  /// [addCartProductToDB] return true when add to DB otherwise false
  ///
  /// update for message as show toast
  Future addCartProductToDB(DBModelCart data, num price) async {
    if (await DBQueryProduct.db.createProduct(data, DBTableCart.nameTable) >
        0) {
      // ✅
      changeMessage = tr(UtilsLangKey.successAddCartProduct);
      addTotalPrice(price.toDouble());
      // addItemPrice(price.toDouble());
      // dev.log("$itemPrice");
      return true;
    } else {
      // ❌
      changeMessage = tr(UtilsLangKey.errorOperations);
      return false;
    }
  }

  /// [removeCartProductFromDB] return true when remove cart product form database otherwise false
  ///
  /// update for message as show toast
  Future<bool> removeCartProductFromDB(DBModelCart data, num itemPrice) async {
    if (await DBQueryProduct.db.deleteProductById(data, DBTableCart.nameTable) >
        0) {
      // ✅
      changeMessage = tr(UtilsLangKey.successRemoveCartProduct);
      removeTotalPrice(itemPrice);
      // removeItemPrice(itemPrice);
      // dev.log("$itemPrice");
      // _itemPrice = 0;

      return true;
    } else {
      // ❌
      changeMessage = tr(UtilsLangKey.errorOperations);
      return false;
    }
  }

  Future updateProduct(DBModelCart data) async {
    DBQueryProduct.db.updateProductById(data);
  }

  // /// [removeCartProductFromDB] return true when remove cart product form database otherwise false
  //   Future updateCartProductFromDB(DBModelCart data) async {
  //   await DBQueryProduct.db.updateProductById(data);
  // }

  // int _counter = 0;
  // int get counter => _counter;

  double _totalPrice = 0.0;
  double get totalPrice => _totalPrice;
  double _itemPrice = 0.0;
  double get itemPrice => _itemPrice;

  late List<DBModelCart> cart = [];

  Future<List<DBModelCart>> getData() async {
    cart = await DBQueryProduct.db.getCartProductList;
    return cart;
  }

  /// [convertObjectToDBCart] convert [ModelProduct] to [DBModelCart]
  DBModelCart convertObjectToDBCart(ModelProduct data) {
    return DBModelCart(
      id: data.id,
      productName: data.name,
      productPrice: data.price,
      initialPrice: data.price,
      productImage: data.image,
      unitType: data.unitType,
      timeStamp: DateTime.now().microsecondsSinceEpoch.toString(),
    );
  }

  /// [convertDBModelToModelCart] convert [DBModelCart] to [ModelProduct]
  ModelProduct convertDBModelToModelCart(DBModelCart data) {
    return ModelProduct(
      id: data.id,
      name: data.productName,
      price: data.productPrice,
      image: data.productImage,
      quantity: data.quantity,
      unitType: data.unitType,
    );
  }

  void _setPrefItems() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setDouble('total_price', _totalPrice);
    prefs.setDouble('item_price', _itemPrice);
    notifyListeners();
  }

  // void removeItem(int id) {
  //   // final index = cart.indexWhere((element) => element.id == id);
  //   // cart.removeAt(index);
  //   _setPrefItems();
  //   // cart.removeWhere()
  //   notifyListeners();
  // }

  void _getPrefItems() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _totalPrice = prefs.getDouble('total_price') ?? 0.0;
    _itemPrice = prefs.getDouble('item_price') ?? 0.0;
    notifyListeners();
  }

  void addTotalPrice(num productPrice) {
    _totalPrice = _totalPrice + productPrice;
    _setPrefItems();
    notifyListeners();
  }

  void removeTotalPrice(num productPrice) {
    _totalPrice = _totalPrice - productPrice;
    _setPrefItems();
    notifyListeners();
  }

  double getTotalPrice() {
    _getPrefItems();
    return _totalPrice;
  }

  void addItemPrice(num productPrice) {
    _itemPrice = _itemPrice + productPrice;
    _setPrefItems();
    notifyListeners();
  }

  void removeItemPrice(num productPrice) {
    _itemPrice = _itemPrice - productPrice;
    _setPrefItems();
    notifyListeners();
  }

  double getItemPrice() {
    _getPrefItems();
    return _itemPrice;
  }
  // void addCounter() {
  //   _counter++;
  //   _setPrefItems();
  //   notifyListeners();
  // }

  // void removerCounter() {
  //   _counter--;
  //   _setPrefItems();
  //   notifyListeners();
  // }

  // int getCounter() {
  //   _getPrefItems();
  //   return _counter;
  // }
}
