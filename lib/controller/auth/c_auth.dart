part of '../../utils/import/u_import_app.dart';

class ControllerAuth extends ChangeNotifier {
  /// [dataUser] create object for save data user
  ModelAccountUser dataUser = ModelAccountUser();

  /// [currentPass ]  save current password
  String currentPass = '';

  /// [changeCurrentPass] update current password
  void changeCurrentPass(String? value) {
    currentPass = value ?? '';
    notifyListeners();
  }

  /// [resetAuth] reset provider
  void resetAuth() {
    // * empty object (data)
    dataUser = ModelAccountUser();

    // * reset current pass
    currentPass = '';
    notifyListeners();
  }

  // ------------------[Firebase]------------------
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  bool loading = false;
  String errorMessage = '';

  /// [changeLoading] change value loading
  set changeLoading(bool value) {
    loading = value;
    notifyListeners();
  }

  /// [setErrorMessage] assign error message
  set setErrorMessage(String value) {
    errorMessage = value;
    notifyListeners();
  }

  /// [register] create account on firebase when successful  return `true`  otherwise `false`
  Future<bool> register(BuildContext context) async {
    try {
      // * start loading
      changeLoading = true;

      // * create user
      UserCredential userCredential =
          await firebaseAuth.createUserWithEmailAndPassword(
              email: dataUser.email!, password: dataUser.pass!);

      // * check create user or not
      if (userCredential.user != null) {
        // * task upload image user
        if (context.mounted) {
          ControllerImage controllerImage =
              Provider.of<ControllerImage>(context, listen: false);

          // * update image user
          userCredential.user?.updatePhotoURL(
              await controllerImage.uploadImage('userImage') ??
                  UtilsImage.userImage);
        }

        // * update user name
        userCredential.user?.updateDisplayName((dataUser.userName));

        // * stop loading
        changeLoading = false;
        return true;
      } else {
        // * stop loading
        changeLoading = false;
        return false;
      }
    } on SocketException {
      // * stop loading
      changeLoading = false;
      setErrorMessage = tr(UtilsLangKey.noInternet);
      return false;
    } on FirebaseAuthException catch (error) {
      // * stop loading
      changeLoading = false;
      setErrorMessage = error.message ?? 'error firebase ';
      return false;
    } catch (error) {
      // * stop loading
      changeLoading = false;
      setErrorMessage = error.toString();
      return false;
    }
  }

  /// [login] login account on firebase when successful  return `true`  otherwise `false`
  Future<bool> login() async {
    try {
      // * start loading
      changeLoading = true;

      // * sign in
      UserCredential userCredential =
          await firebaseAuth.signInWithEmailAndPassword(
              email: dataUser.email!, password: dataUser.pass!);

      // * check user exist or not
      if (userCredential.user != null) {
        // * stop loading
        changeLoading = false;
        return true;
      } else {
        // * stop loading
        changeLoading = false;
        return false;
      }
    } on SocketException {
      // * stop loading
      changeLoading = false;
      setErrorMessage = tr(UtilsLangKey.noInternet);
      return false;
    } on FirebaseAuthException catch (error) {
      // * stop loading
      changeLoading = false;
      setErrorMessage = error.message ?? 'error firebase ';
      return false;
    } catch (error) {
      // * stop loading
      changeLoading = false;
      setErrorMessage = error.toString();
      return false;
    }
  }

  Future<bool> resetPass() async {
    try {
      // * start loading
      changeLoading = true;
      await firebaseAuth.sendPasswordResetEmail(email: dataUser.email!);
      // * stop loading
      changeLoading = false;
      return true;
    } on SocketException {
      // * stop loading
      changeLoading = false;
      setErrorMessage = tr(UtilsLangKey.noInternet);
      return false;
    } on FirebaseAuthException catch (error) {
      // * stop loading
      changeLoading = false;
      setErrorMessage = error.message!;
      return false;
    } catch (error) {
      // * stop loading
      changeLoading = false;
      setErrorMessage = error.toString();
      return false;
    }
  }

  /// [singOut] logout user account
  Future<bool> singOut() async {
    try {
      // * start loading
      changeLoading = true;
      await firebaseAuth.signOut();
      // * stop loading
      changeLoading = false;
      return true;
    } on SocketException {
      // * stop loading
      changeLoading = false;
      setErrorMessage = tr(UtilsLangKey.noInternet);
      return false;
    } on FirebaseAuthException catch (error) {
      // * stop loading
      changeLoading = false;
      setErrorMessage = error.message!;
      return false;
    } catch (error) {
      // * stop loading
      changeLoading = false;
      setErrorMessage = error.toString();
      return false;
    }
  }

// * ---------- user info -------
  Stream<User?> get userState => firebaseAuth.authStateChanges();

  /// [userName] user name
  String get userName => firebaseAuth.currentUser?.displayName ?? 'user test';

  /// [userEmail] user email
  String get userEmail => firebaseAuth.currentUser?.email ?? 'user@gmial.com';

  /// [userPhoto] user photo
  String get userPhoto =>
      firebaseAuth.currentUser?.photoURL ?? UtilsImage.userImage;
}
