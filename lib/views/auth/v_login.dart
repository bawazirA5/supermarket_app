part of '../../utils/import/u_import_app.dart';

class ViewLogin extends StatelessWidget {
  const ViewLogin({super.key});

  /// [_keyForm] controller Widget `Form`
  static final GlobalKey<FormState> _keyForm = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    /// [spaceVertical]  SizedBox 16 height
    SizedBox spaceVertical = UtilsDime.l.verticalSpace;
    return Scaffold(
      appBar: const WidgetAppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(UtilsDime.md).w,
          child: Form(
            key: _keyForm,
            child: Column(
              children: [
                // * space
                spaceVertical,

                // * logo
                const WidgetAuthLogo(),

                // * space
                spaceVertical,

                // * email
                const WidgetAuthEmail(),

                // * space
                spaceVertical,

                // * password
                const WidgetAuthPass(),

                // * space
                spaceVertical,

                // * Forgot pass
                const WidgetAuthBtnForgotBass(),

                // * space
                spaceVertical,

                // * login btn
                // WidgetAuthBtn(
                //   title: UtilsLangKey.login,
                //   onTap: () async {
                //     if (_keyForm.currentState?.validate() ?? false) {
                //       // * save user data
                //       ControllerAuth auth =
                //           Provider.of<ControllerAuth>(context, listen: false);
                //       _keyForm.currentState?.save();
                //       dev.log(auth.dataUser.toString());
                //       // * show error massage as toast
                //     }
                //   },
                // ),

                Consumer<ControllerAuth>(
                  builder: (context, pAuth, child) => pAuth.loading
                      ? const WidgetProgress()
                      : WidgetAuthBtn(
                          title: UtilsLangKey.login,
                          onTap: () async {
                            if (_keyForm.currentState?.validate() ?? false) {
                              // * save user data
                              _keyForm.currentState?.save();

                              // * show error massage as toast
                              if (!(await pAuth.login())) {
                                if (context.mounted) {
                                  WidgetToast.buildToast(
                                    context: context,
                                    msg: pAuth.errorMessage,
                                    translation: false,
                                  );
                                }
                              } else {
                                if (context.mounted) {
                                  dev.log('ok');
                                }
                              }
                            }
                          }),
                ),
                // * space
                spaceVertical,

                Consumer3<ControllerAuth, ControllerAuthSecurityPass,
                    ControllerImage>(
                  builder:
                      (BuildContext context, auth, securityPass, image, child) {
                    return WidgetAuthCheckAccount(
                        firstWord: UtilsLangKey.notAccount,
                        secondWord: UtilsLangKey.register,
                        onTap: () {
                          auth.resetAuth();
                          image.resetImage();
                          securityPass.reset();
                          dev.log(auth.dataUser.toString());
                          Navigator.pushNamed(context, UtilsRoutes.register);
                        });
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
