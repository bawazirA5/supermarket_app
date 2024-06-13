part of '../../../../utils/import/u_import_app.dart';

class WidgetAuthEmail extends StatelessWidget {
  const WidgetAuthEmail({super.key});

  @override
  Widget build(BuildContext context) {
    ControllerAuth controllerAuth =
        Provider.of<ControllerAuth>(context, listen: false);
    dev.log('send data email to provider', name: 'widget email');
    return WidgetTextField(
      keyboardType: TextInputType.emailAddress,
      labelText: UtilsLangKey.email,
      hintText: UtilsLangKey.email,
      iconBefore: UtilsIcons.mail,
      validator: FormBuilderValidators.compose([
        FormBuilderValidators.required(),
        FormBuilderValidators.email(),
      ]),
      onSaved: controllerAuth.dataUser.setEmail,
    );
  }
}
