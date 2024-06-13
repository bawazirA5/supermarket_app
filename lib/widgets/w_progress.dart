part of '../utils/import/u_import_app.dart';

class WidgetProgress extends StatelessWidget {
  const WidgetProgress({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Transform.scale(
        scale: UtilsDime.xs,
        child: const Opacity(
          opacity: UtilsDime.half,
          child: CircularProgressIndicator.adaptive(),
        ),
      ),
    );
  }
}
