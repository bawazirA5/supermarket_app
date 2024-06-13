part of './../../import/u_import_app.dart';

class DBConnection {
  static Future<Database> get init async {
    // * path directory for storage
    // String databasePath = await getDatabasesPath(); // not recommended
    Directory directory = await dir.getApplicationDocumentsDirectory();
    dev.log('directory : ${directory.path}', name: 'Connection DataBase');

    // * path storage database
    String pathDB = path.join(directory.path, 'Product.db');

    return openDatabase(
      pathDB,
      version: 1,
      onCreate: (db, version) async {
        // * table favorite
        await db.execute(
          'CREATE TABLE ${DBTableFavorite.nameTable} ('
          '${DBTableFavorite.colId} INT, '
          '${DBTableFavorite.colName} String, '
          '${DBTableFavorite.colPrice} NUM, '
          '${DBTableFavorite.colImage} String, '
          '${DBTableFavorite.colQuantity} NUM, '
          '${DBTableFavorite.colUnitType} String, '
          '${DBTableFavorite.colTimeStamp} TEXT '
          ')',
        );

        // * table cart
        await db.execute(
          'CREATE TABLE ${DBTableCart.nameTable} ('
          '${DBTableCart.colId} INTEGER, '
          '${DBTableCart.colProductId} TEXT, '
          '${DBTableCart.colProductName} TEXT, '
          '${DBTableCart.colProductPrice} NUM, '
          '${DBTableCart.colInitialPrice} NUM, '
          '${DBTableCart.colProductImage} TEXT, '
          '${DBTableCart.colQuantity} INTEGER, '
          '${DBTableCart.colUnitType} TEXT, '
          '${DBTableCart.colTimeStamp} TEXT '
          ')',
        );
        // * other table
        // await db.execute(
        //   'CREATE TABLE ${DBTableArticle.nameTable} ('
        //   '${DBTableArticle.colId} TEXT PRIMARY KEY, '
        //   '${DBTableArticle.colTitle} TEXT, '
        //   '${DBTableArticle.colImage} TEXT, '
        //   '${DBTableArticle.colDate} TEXT, '
        //   '${DBTableArticle.colSource} TEXT, '
        //   '${DBTableArticle.colTimeStamp} TEXT '
        //   ')',
        // );
      },
    );
  }
}
