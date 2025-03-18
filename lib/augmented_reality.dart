import 'package:flutter/foundation.dart'; // Import kIsWeb
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class AugmentedRealityScreen extends StatefulWidget {
  const AugmentedRealityScreen({Key? key}) : super(key: key);

  @override
  AugmentedRealityScreenState createState() => AugmentedRealityScreenState();
}

class AugmentedRealityScreenState extends State<AugmentedRealityScreen> {
  late final WebViewController controller;

  @override
  void initState() {
    super.initState();
    if (!kIsWeb) { // Only load WebView if not running on Flutter Web
      controller = WebViewController()
        ..setJavaScriptMode(JavaScriptMode.unrestricted)
        ..loadRequest(Uri.parse('https://your-ar-url.com')); // Replace with your AR web page
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Augmented Reality")),
      body: kIsWeb
          ? const Center(child: Text("WebView is not supported on Flutter Web"))
          : WebViewWidget(controller: controller),
    );
  }
}
