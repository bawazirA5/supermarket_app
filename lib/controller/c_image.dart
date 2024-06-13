part of '../utils/import/u_import_app.dart';

class ControllerImage extends ChangeNotifier {
  /// [image] save image user
  XFile? image;

  /// [selectImage] choice image from gallery or camera
  Future<void> selectImage(BuildContext context,
      {bool isGallery = true}) async {
    // * create object from ImagePicker
    final ImagePicker picker = ImagePicker();

    // * ways get image user (gallery or camera)
    image = await picker.pickImage(
      source: isGallery ? ImageSource.gallery : ImageSource.camera,
    );

    if (image != null && context.mounted) {
      Navigator.pop(context);
    }

    cropImage();
  }

  /// [cropImage] edit image
  Future<void> cropImage() async {
    if (image != null) {
      CroppedFile? croppedFile =
          await ImageCropper().cropImage(sourcePath: image!.path);

      if (croppedFile != null) {
        // * convert imageUser to XFile
        image = XFile(croppedFile.path);
      }

      notifyListeners();
    }
  }

  /// [getImageUser] check user image have or not
  /// image picker return File
  /// is not return Network image default
  ImageProvider getImageUser() {
    if (image != null) {
      return FileImage(File(image!.path));
    } else {
      return const NetworkImage(UtilsImage.userImage);
    }
  }

  /// [uploadImage] upload image user in firebase storage
  ///  return url of image user when complete upload image
  Future<String?> uploadImage(String pathFolder) async {
    try {
      // * check if user selected image or not
      if (image != null) {
        // * take only name image from its path  ex : download/mohamed.png
        String nameImage = path.basename(image!.path);

        // * upload image user
        UploadTask uploadTask = FirebaseStorage.instance
            .ref()
            .child('$pathFolder/$nameImage')
            .putData(await image!.readAsBytes());

        // * done upload image user
        TaskSnapshot taskSnapshot = await uploadTask.whenComplete(() => {});

        // * download image user as url
        String urlImage = await taskSnapshot.ref.getDownloadURL();

        // * return url of image user
        return urlImage;
      } else {
        return null;
      }
    } catch (e) {
      return null;
    }
  }

  /// [resetImage] reset image user
  void resetImage() {
    image = null;
    notifyListeners();
  }
}
