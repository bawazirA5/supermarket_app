part of '../../utils/import/u_import_app.dart';

class ViewRegister extends StatelessWidget {
  const ViewRegister({super.key});

  /// [_keyForm] controller Widget `Form`
  static final GlobalKey<FormState> _keyForm = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    /// [spaceVertical] SizedBox 16 height
    SizedBox spaceVertical = UtilsDime.l.verticalSpace;
    return Consumer2<ControllerAuthSecurityPass, ControllerAuth>(
      builder: (context, securityPass, auth, child) {
        return PopScope(
          onPopInvoked: (value) {
            if (value) {
              dev.log(auth.dataUser.toString());
              securityPass.reset();
            }
          },
          child: Scaffold(
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
                      const WidgetAuthImageUser(),

                      // * space
                      spaceVertical,

                      // * username
                      const WidgetAuthUsername(),

                      // * space
                      spaceVertical,

                      // * email
                      const WidgetAuthEmail(),

                      // * space
                      spaceVertical,

                      // * password
                      const WidgetAuthPass(
                        isWorkChange: true,
                      ),

                      // * space
                      spaceVertical,

                      // * Confirm password
                      const WidgetAuthPass(
                        isConfirmPass: true,
                      ),

                      // * space
                      spaceVertical,

                      // * register btn
                      Consumer<ControllerAuth>(
                        builder: (context, pAuth, child) => pAuth.loading
                            ? const WidgetProgress()
                            : WidgetAuthBtn(
                                title: UtilsLangKey.register,
                                onTap: () async {
                                  if (_keyForm.currentState?.validate() ??
                                      false) {
                                    // * save user data
                                    _keyForm.currentState?.save();
                                    dev.log(pAuth.dataUser.toString());

                                    // * show error massage as toast
                                    if (!(await pAuth.register(context))) {
                                      if (context.mounted) {
                                        WidgetToast.buildToast(
                                          context: context,
                                          msg: pAuth.errorMessage,
                                          translation: false,
                                        );
                                      }
                                    } else {
                                      if (context.mounted) {
                                        UtilsRestart.reDraw(context);
                                        dev.log('ok');
                                      }
                                    }
                                  }
                                },
                              ),
                      ),

                      // * space
                      spaceVertical,

                      // * check account
                      WidgetAuthCheckAccount(
                        firstWord: UtilsLangKey.haveAccount,
                        secondWord: UtilsLangKey.login,
                        onTap: () {
                          Navigator.pop(context);
                        },
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
