part of '../../../utils/import/u_import_app.dart';

class WidgetAuthBtnForgotBass extends StatelessWidget {
  const WidgetAuthBtnForgotBass({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional.centerStart,
      child: TextButton(
        onPressed: () {
          // * reset provider
          ControllerAuth auth =
              Provider.of<ControllerAuth>(context, listen: false);
          auth.resetAuth();
          // * push Forgot Pass
          Navigator.pushNamed(context, UtilsRoutes.forgotPass);
        },
        child: Text(
          UtilsLangKey.forgotPass.tr(),
          style: UtilsTheme.bLarge(context)?.copyWith(
            decoration: TextDecoration.underline,
            fontWeight: FontWeight.w900,
          ),
        ),
      ),
    );
  }
}
