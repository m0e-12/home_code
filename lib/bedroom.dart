import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class BedroomScreen extends StatefulWidget {
  const BedroomScreen({Key? key}) : super(key: key); 

  @override
  BedroomScreenState createState() => BedroomScreenState(); 
}

class BedroomScreenState extends State<BedroomScreen> { 
  late final WebViewController controller;

  @override
  void initState() {
    super.initState();
    controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..loadFlutterAsset('assets/html/bedroom.html'); 
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Bedroom")), 
      body: WebViewWidget(controller: controller),
    );
  }
}
