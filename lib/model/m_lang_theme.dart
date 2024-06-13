part of './../utils/import/u_import_app.dart';
// ignore_for_file: public_member_api_docs, sort_constructors_first

class ModelLangTheme {
  String key;
  String title;
  String icon;
  bool isChoice;
  bool isTypeLang;
  ModelLangTheme({
    required this.key,
    required this.title,
    required this.icon,
    this.isChoice = false,
    this.isTypeLang = true,
  });
}
