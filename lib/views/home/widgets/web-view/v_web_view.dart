part of './../../../../utils/import/u_import_app.dart';

class ViewWebView extends StatefulWidget {
  const ViewWebView({super.key, required this.url});
  final String url;

  @override
  State<ViewWebView> createState() => _ViewWebViewState();
}

class _ViewWebViewState extends State<ViewWebView> {
  /// [controller]  controller WebView
  late WebViewController controller;

  /// [isLoading] when  loading true show loading otherwise stop loading
  bool isLoading = true;
  @override
  void initState() {
    super.initState();
    controller = WebViewController()
      // * active javaScript
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      // * receive string and convert it to url
      ..loadRequest(Uri.parse(widget.url))
      // * when page opened the value of isLoading variable will change into false
      ..setNavigationDelegate(
        NavigationDelegate(
          onPageStarted: (url) {
            isLoading = false;
            setState(() {});
          },
        ),
      );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // * appBar
      appBar: const WidgetAppBar(),
      // * body
      body: isLoading
          ? const WidgetProgress()
          : WebViewWidget(controller: controller),
    );
  }
}
