part of '../utils/import/u_import_app.dart';

class WidgetTextField extends StatelessWidget {
  const WidgetTextField({
    super.key,
    // * General
    this.controller,
    this.keyboardType,
    this.initialValue,
    this.isPass = false,
    this.validator,
    this.onSaved,
    this.onChanged,
    this.maxLines = 1,
    this.minLines,

    // * decoration
    this.enabledBorderColor,
    this.focusedBorderColor,
    this.labelText,
    this.hintText,
    this.helperText,
    this.iconBefore,
    this.isShowIconPass = false,
  });

  // * General
  final TextInputType? keyboardType;
  final String? initialValue;
  final bool isPass;
  final String? Function(String?)? validator;
  final void Function(String?)? onSaved;
  final void Function(String)? onChanged;
  // * decoration
  final TextEditingController? controller;
  final Color? enabledBorderColor;
  final Color? focusedBorderColor;
  final String? labelText;
  final String? hintText;
  final String? helperText;
  final IconData? iconBefore;
  final bool isShowIconPass;
  final int? minLines;
  final int? maxLines;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      // * General
      controller: controller,
      // * close keyboard when click outside text field
      onTapOutside: (event) => FocusManager.instance.primaryFocus?.unfocus(),
      cursorColor: UtilsTheme.mainColor(context),
      keyboardType: keyboardType,
      initialValue: initialValue,
      obscureText: isPass,
      obscuringCharacter: '✤',
      validator: validator,
      onSaved: onSaved,
      onChanged: onChanged,
      minLines: minLines,
      maxLines: maxLines,
      // * Decoration
      decoration: InputDecoration(
        border: InputBorder.none,
        labelText: labelText?.tr(),
        labelStyle: UtilsTheme.bLarge(context),
        hintText: hintText?.tr(),
        helperText: helperText?.tr(),
        helperMaxLines: 2,
        helperStyle:
            UtilsTheme.bSmall(context)?.copyWith(color: UtilsColor.blueGrey),

        // * icon
        prefixIcon: Icon(iconBefore),
        suffixIcon: isShowIconPass
            ? Consumer<ControllerAuthSecurityPass>(
                builder: (context, pSecurityPass, child) => IconButton(
                  onPressed: () {
                    pSecurityPass.handelPass();
                  },
                  icon: Icon(pSecurityPass.iconEye),
                ),
              )
            : null,

        // * Border Style
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(UtilsDime.l.r),
          borderSide:
              BorderSide(color: enabledBorderColor ?? UtilsColor.greemm),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(UtilsDime.l.r),
          borderSide:
              BorderSide(color: focusedBorderColor ?? UtilsColor.greemm),
        ),

        // * error style border
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(UtilsDime.l.r),
          borderSide: BorderSide(color: UtilsColor.red),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(UtilsDime.l.r),
          borderSide: BorderSide(color: UtilsColor.teal),
        ),
        errorMaxLines: 2,
      ),
    );
  }
}
