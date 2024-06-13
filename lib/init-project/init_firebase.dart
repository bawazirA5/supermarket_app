part of './../utils/import/u_import_app.dart';

class InitFirebase extends StatelessWidget {
  const InitFirebase({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<FirebaseApp>(
        future: Firebase.initializeApp(
          options: DefaultFirebaseOptions.currentPlatform,
        ),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const WidgetProgress();
          } else if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasData) {
              return const ViewWrapper();
            } else {
              return const WidgetErrorText(title: UtilsLangKey.errorNoData);
            }
          } else {
            return const WidgetErrorText(title: UtilsLangKey.errorInitFirebase);
          }
        },
      ),
    );
  }
}
