part of '../../utils/import/u_import_app.dart';

class ViewWrapper extends StatelessWidget {
  const ViewWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    ControllerAuth auth = Provider.of<ControllerAuth>(context);
    return StreamBuilder<User?>(
      stream: auth.userState,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const WidgetProgress();
        } else if (snapshot.connectionState == ConnectionState.active) {
          if (snapshot.hasData) {
            return const ViewHome();
          } else {
            return const ViewLogin();
          }
        } else {
          return const ViewLogin();
        }
      },
    );
  }
}
