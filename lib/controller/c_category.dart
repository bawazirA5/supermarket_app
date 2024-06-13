part of '../utils/import/u_import_app.dart';
// import 'package:supermarket/constant/categories.dart';
// import 'package:supermarket/model/m_categoryw.dart';
// // import 'package:supermarket_app/constant/categories.dart';
// // import 'package:supermarket_app/models/m_category.dart';

class ControllerCategory extends ChangeNotifier {
  /// [getAllNews] get list all products
  Stream<List<ModelCategory>> getAll(String data) {
    /// [collectionReference] place where data stored
    CollectionReference collectionReference =
        FirebaseFirestore.instance.collection(data);
    return collectionReference
        .orderBy('id')
        .snapshots()
        .map(_newsFromSnapshots);
  }

  // * get data as map and return list type of ModelProduct
  List<ModelCategory> _newsFromSnapshots(QuerySnapshot snapshot) {
    // dev.log('${snapshot.docs}aaaa');
    return snapshot.docs.map((doc) {
      Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
      return ModelCategory.fromMap(data);
    }).toList();
  }

//   // * list of categories
//   List<ModelCategory> categories = [
//     ModelCategory(
//         categoryName: Categories.categoryName1,
//         categoryImage: Categories.categoryImage1),
//     ModelCategory(
//         categoryName: Categories.categoryName2,
//         categoryImage: Categories.categoryImage2),
//     ModelCategory(
//         categoryName: Categories.categoryName3,
//         categoryImage: Categories.categoryImage3),
//     ModelCategory(
//         categoryName: Categories.categoryName4,
//         categoryImage: Categories.categoryImage4),
//     ModelCategory(
//         categoryName: Categories.categoryName5,
//         categoryImage: Categories.categoryImage5),
//     ModelCategory(
//         categoryName: Categories.categoryName6,
//         categoryImage: Categories.categoryImage6),
//   ];

//   /// [getLength] return count of categories
//   int getLength() => categories.length;

//   /// [getCategory] return any category by index
//   ModelCategory getCategory(int index) => categories.elementAt(index);
}
