part of '../../../../utils/import/u_import_app.dart';

class WidgetAuthUsername extends StatelessWidget {
  const WidgetAuthUsername({super.key});

  @override
  Widget build(BuildContext context) {
    ControllerAuth auth = Provider.of<ControllerAuth>(context, listen: false);
    dev.log('send data username to provider', name: 'widget username');
    return WidgetTextField(
      hintText: UtilsLangKey.hintUsername,
      labelText: UtilsLangKey.userName,
      iconBefore: UtilsIcons.userName,
      helperText: UtilsLangKey.helpUsername,
      validator: FormBuilderValidators.compose([
        FormBuilderValidators.required(),
        FormBuilderValidators.match(r'^[a-zA-Z\u0600-\u06FF\s]{5,}$',
            errorText: UtilsLangKey.helpUsername.tr()),
      ]),
      onSaved: auth.dataUser.setUserName,
    );
  }
}
