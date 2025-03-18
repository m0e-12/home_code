import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class BathroomScreen extends StatefulWidget {
  const BathroomScreen({Key? key}) : super(key: key); 

  @override
  BathroomScreenState createState() => BathroomScreenState(); 
}

class BathroomScreenState extends State<BathroomScreen> { 
  late final WebViewController controller;

  @override
  void initState() {
    super.initState();
    controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..loadFlutterAsset('assets/html/bathroom.html'); 
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Bathroom")), 
      body: WebViewWidget(controller: controller),
    );
  }
}
