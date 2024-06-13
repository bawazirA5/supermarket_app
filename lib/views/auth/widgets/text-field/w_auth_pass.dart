part of '../../../../utils/import/u_import_app.dart';

class WidgetAuthPass extends StatelessWidget {
  const WidgetAuthPass({
    super.key,
    this.isConfirmPass = false,
    this.isWorkChange = false,
  });
  final bool isConfirmPass;
  final bool isWorkChange;

  @override
  Widget build(BuildContext context) {
    return Consumer2<ControllerAuthSecurityPass, ControllerAuth>(
      builder: (context, securityPass, auth, child) => WidgetTextField(
        labelText: isConfirmPass ? UtilsLangKey.confirmPass : UtilsLangKey.pass,
        hintText: isConfirmPass ? UtilsLangKey.confirmPass : UtilsLangKey.pass,
        iconBefore: UtilsIcons.pass,
        helperText: isConfirmPass
            ? UtilsLangKey.helpConfirmPass
            : UtilsLangKey.helpPass,
        isPass: securityPass.isNotShowPass,
        isShowIconPass: true,
        validator: FormBuilderValidators.compose([
          FormBuilderValidators.required(),
          // * pass
          if (!isConfirmPass) FormBuilderValidators.minLength(6),
          if (!isConfirmPass) FormBuilderValidators.maxLength(12),
          // * confirm pass
          if (isConfirmPass) FormBuilderValidators.equal(auth.currentPass),
        ]),
        onSaved: auth.dataUser.setPass,
        onChanged: isWorkChange ? auth.changeCurrentPass : null,
      ),
    );
  }
}
