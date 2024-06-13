// ignore_for_file: public_member_api_docs, sort_constructors_first
part of '../../utils/import/u_import_app.dart';

class ModelAccountUser {
  String? email;
  String? pass;
  String? userName;

  void setEmail(String? value) => email = value;

  void setPass(String? value) => pass = value;

  void setUserName(String? value) => userName = value;

  @override
  String toString() =>
      'ModelAccountUser(email: $email, pass: $pass, userName: $userName)';
}
