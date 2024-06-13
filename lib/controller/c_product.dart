part of '../utils/import/u_import_app.dart';

class ControllerProduct extends ChangeNotifier {

  /// [getProducts] get 3 products for exclusive offer and best selling
  Stream<List<ModelProduct>> getProducts(
      String collection, String key, dynamic value,int limit) {
    /// [collectionReference] place where data stored
    Query collectionReference = FirebaseFirestore.instance
        .collection(collection)
        .where(key, isEqualTo: value)
        .limit(limit);
    return collectionReference.snapshots().map(newsFromSnapshots);
  }
  /// [getCategoryProducts] get all products for categories
  Stream<List<ModelProduct>> getCategoryProducts(
      String collection, String key, dynamic value) {
    /// [collectionReference] place where data stored
    Query collectionReference = FirebaseFirestore.instance
        .collection(collection)
        .where(key, isEqualTo: value)
       ;
    return collectionReference.snapshots().map(newsFromSnapshots);
  }

  // * get data as map and return list type of ModelProduct
  List<ModelProduct> newsFromSnapshots(QuerySnapshot snapshot) {
    return snapshot.docs.map((doc) {
      Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
      return ModelProduct.fromMap(data);
    }).toList();
  }
}
