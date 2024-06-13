part of './../utils/import/u_import_app.dart';

class ControllerFavorite extends ChangeNotifier {
  /// [message] feedback user
  String? message;

  /// [changeMessage] update to message
  set changeMessage(String msg) {
    message = msg;
    notifyListeners();
  }

  /// [mangeFavorite] check product case when found in database not favorite
  /// otherwise not found article in database favorite
  Future<bool> mangeFavorite(DBModelFavorite data) async {
    if (await DBQueryProduct.db
            .getProductById(data, DBTableFavorite.nameTable) ==
        null) {
      // * not found data product  in database
      // * add product on database
      return await addFavoriteProductToDB(data);
    } else {
      // * found data product in database
      // * delete from database
      return await removeFavoriteProductFromDB(data);
    }
  }

  /// [addFavoriteProductToDB] return true when add to DB otherwise false
  ///
  /// update for message as show toast
  Future<bool> addFavoriteProductToDB(dynamic data) async {
    if (await DBQueryProduct.db.createProduct(data, DBTableFavorite.nameTable) >
        0) {
      // ✅
      changeMessage = tr(UtilsLangKey.successAddFavoriteProduct);
      return true;
    } else {
      // ❌
      changeMessage = tr(UtilsLangKey.errorOperations);
      return false;
    }
  }

  /// [removeFavoriteProductFromDB] return true when remove favorite product form database otherwise false
  ///
  /// update for message as show toast
  Future<bool> removeFavoriteProductFromDB(DBModelFavorite data) async {
    if (await DBQueryProduct.db
            .deleteProductById(data, DBTableFavorite.nameTable) >
        0) {
      // ✅
      changeMessage = tr(UtilsLangKey.successRemoveFavoriteProduct);

      return true;
    } else {
      // ❌
      changeMessage = tr(UtilsLangKey.errorOperations);
      return false;
    }
  }

  /// [convertObjectToDBFavorite] convert [ModelProduct] to [DBModelFavorite]
  DBModelFavorite convertObjectToDBFavorite(ModelProduct data) {
    return DBModelFavorite(
      id: data.id,
      name: data.name,
      price: data.price,
      image: data.image,
      quantity: data.quantity,
      unitType: data.unitType,
      timeStamp: DateTime.now().microsecondsSinceEpoch.toString(),
    );
  }

  /// [convertDBFavoriteToObject] convert [DBModelFavorite] to [ModelProduct]
  ModelProduct convertDBFavoriteToObject(DBModelFavorite data) {
    return ModelProduct(
      id: data.id,
      name: data.name,
      price: data.price,
      image: data.image,
      quantity: data.quantity,
      unitType: data.unitType,
    );
  }

  /// [manageIcon] return icon depended on product favorite or not
  Future<Icon> manageIcon(DBModelFavorite data) async {
    if (await DBQueryProduct.db
            .getProductById(data, DBTableFavorite.nameTable) ==
        null) {
      // * icon not favorite
      return const Icon(UtilsIcons.favoriteOutlined);
    } else {
      // * icon favorite
      return Icon(UtilsIcons.favorite, color: UtilsColor.red);
    }
  }

  /// [dataList] return all favorite products storage in database as `DBModelProduct`
  List<dynamic>? dataList;

  /// [fetchDataProductFromDB] get all favorite products form database
  Future<void> get fetchDataProductFromDB async {
    dataList = await DBQueryProduct.db.getFavoriteProductList;
    notifyListeners();
  }

  /// [removeFavoriteItemList] update ui for body favorite
  void removeFavoriteItemList(int id) {
    dataList?.removeWhere((element) => element.id == id);
    notifyListeners();
  }
}
