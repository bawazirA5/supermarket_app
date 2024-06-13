part of '../../utils/import/u_import_app.dart';

class ViewForgotPass extends StatelessWidget {
  const ViewForgotPass({super.key});

  /// [keyForm] controller Widget `Form`
  static final GlobalKey<FormState> keyForm = GlobalKey<FormState>();
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
            key: keyForm,
            child: Column(
              children: [
                // * space
                spaceVertical,

                // * logo
                const WidgetAuthLogo(),

                // * space
                spaceVertical,

                // * Description
                Text(
                  UtilsLangKey.hintResetPass.tr(),
                  textAlign: TextAlign.center,
                  style: UtilsTheme.bLarge(context)?.copyWith(height: 1.8),
                ),

                // * space
                spaceVertical,

                // * email
                const WidgetAuthEmail(),

                // * space 32
                UtilsDime.xl.verticalSpace,

                // * reset btn
                Consumer<ControllerAuth>(
                  builder: (context, auth, child) => auth.loading
                      ? const WidgetProgress()
                      : WidgetAuthBtn(
                          title: UtilsLangKey.resetPassword,
                          onTap: () async {
                            if (keyForm.currentState?.validate() ?? false) {
                              // * save email
                              keyForm.currentState?.save();

                              // * show error massage as toast
                              if (!(await auth.resetPass())) {
                                if (context.mounted) {
                                  WidgetToast.buildToast(
                                    context: context,
                                    msg: auth.errorMessage,
                                    translation: false,
                                  );
                                }
                              } else {
                                dev.log('message');
                              }
                            }
                          },
                        ),
                ),

                // * space
                spaceVertical,

                WidgetAuthCheckAccount(
                  firstWord: UtilsLangKey.haveAccount,
                  secondWord: UtilsLangKey.login,
                  onTap: () => Navigator.pop(context),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
