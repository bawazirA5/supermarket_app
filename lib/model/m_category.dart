part of '../utils/import/u_import_app.dart';

class ModelCategory {
  int? _id;
  String? _name;
  String? _image;

  get id => _id;
  set id(value) => _id = value;

  get name => _name;
  set name(value) => _name = value;

  get image => _image;
  set image(value) => _image = value;

  ModelCategory();

// * used to read data format map, save on attribute
  ModelCategory.fromMap(Map<String, dynamic> map) {
    _id = map['id'];
    _name = map['name'];
    _image = map['image'];
  }

  /// [toMap] convert object dart to map
  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': _id,
      'name': _name,
      'image': _image,
    };
  }
}
