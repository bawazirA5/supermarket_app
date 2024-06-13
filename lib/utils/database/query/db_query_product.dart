part of './../../import/u_import_app.dart';

class DBQueryProduct {
  // * constructor private
  DBQueryProduct._();

  // * singleton pattern
  // * create object
  static final DBQueryProduct db = DBQueryProduct._();

  // * database
  Database? database;

  /// [haveDB] check the database
  Future<Database> get haveDB async => database ??= await DBConnection.init;

  Future<int> createProduct(dynamic cart, String nameTable) async {
    return haveDB
        .then(
      (dbConnection) => dbConnection.insert(nameTable, cart.toMap()),
    )
        .onError((error, stackTrace) {
      dev.log('error when add favorite product to table favorite in DB',
          name: 'DBQueryProduct', error: error.toString());
      return -1;
    });
  }

  /// [deleteProductById] delete product by id and return number of row deleted
  ///
  /// when return -1 error delete product
  Future<int> deleteProductById(dynamic data, String nameTable) async {
    return haveDB
        .then(
      (dbConnection) => dbConnection.delete(
        nameTable,
        where: 'id = ?',
        whereArgs: [data.id],
      ),
    )
        .onError((error, stackTrace) {
      dev.log('error when delete favorite product form db ',
          name: 'DBQueryProduct', error: error.toString());
      return -1;
    });
  }

  /// [getFavoriteProductList] return list as DBModelFavorite  form db
  ///
  /// when error return list empty form type DBModelFavorite
  Future<List<DBModelFavorite>> get getFavoriteProductList async {
    return haveDB
        .then(
      (dbConnection) => dbConnection
          .query(
            DBTableFavorite.nameTable,
            orderBy: '${DBTableFavorite.colTimeStamp} desc',
          )
          .then((listData) => listData.isNotEmpty
              ? listData
                  .map((product) => DBModelFavorite.formMap(map: product))
                  .toList()
              : <DBModelFavorite>[]),
    )
        .onError(
      (error, stackTrace) {
        dev.log('error when get all favorite Product form db',
            name: 'DBQueryProduct', error: error.toString());
        return <DBModelFavorite>[];
      },
    );
  }

  /// [getCartProductList] return list as DBModelCart  form db
  ///
  /// when error return list empty form type DBModelCart
  Future<List<DBModelCart>> get getCartProductList async {
    return haveDB
        .then(
      (dbConnection) => dbConnection
          .query(
            DBTableCart.nameTable,
            orderBy: '${DBTableCart.colTimeStamp} desc',
          )
          .then((listData) => listData.isNotEmpty
              ? listData
                  .map((product) => DBModelCart.formMap(map: product))
                  .toList()
              : <DBModelCart>[]),
    )
        .onError(
      (error, stackTrace) {
        dev.log('error when get all cart Product form db',
            name: 'DBQueryProduct', error: error.toString());
        return <DBModelCart>[];
      },
    );
  }

  /// [getProductById] return Product by id form db
  ///
  /// when error return null no have found favorite Product
  Future getProductById(dynamic data, String nameTable) {
    return haveDB
        .then((dbConnection) => dbConnection
            .query(nameTable, where: 'id = ?', whereArgs: [data.id]))
        .then(
          (listData) => listData.isNotEmpty
              ? DBModelFavorite.formMap(map: listData.first)
              : null,
        )
        .onError((error, stackTrace) {
      dev.log('error when get favorite Product by id form db',
          name: 'DBQueryProduct', error: error.toString());
      return null;
    });
  }

  /// [updateProductById] update data for Product by id and return number is update row
  ///
  /// when error return -1 not found
  Future<int> updateProductById(DBModelCart data) {
    return haveDB.then(
      (dbConnection) => dbConnection.update(DBTableCart.nameTable, data.toMap(),
          where: 'id = ?', whereArgs: [data.id]),
    );
  }

  /// [closeDB] closeDB
  Future<void> closeDB() async {
    await database?.close();
  }
}
