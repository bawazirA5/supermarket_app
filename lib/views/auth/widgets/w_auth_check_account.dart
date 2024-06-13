part of '../../../utils/import/u_import_app.dart';

class WidgetAuthCheckAccount extends StatelessWidget {
  const WidgetAuthCheckAccount({
    super.key,
    required this.firstWord,
    required this.secondWord,
    required this.onTap,
  });
  final String firstWord;
  final String secondWord;
  final void Function() onTap;
  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: firstWord.tr(),
        style: UtilsTheme.bLarge(context),
        children: [
          const TextSpan(text: ' '),
          TextSpan(
            text: secondWord.tr(),
            style: UtilsTheme.tLarge(context)
                ?.copyWith(decoration: TextDecoration.underline),
            recognizer: TapGestureRecognizer()..onTap = onTap,
          ),
        ],
      ),
    );
  }
}
