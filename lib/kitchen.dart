import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class KitchenScreen extends StatefulWidget {
  const KitchenScreen({Key? key}) : super(key: key); 

  @override
  KitchenScreenState createState() => KitchenScreenState(); 
}

class KitchenScreenState extends State<KitchenScreen> { 
  late final WebViewController controller;

  @override
  void initState() {
    super.initState();
    controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..loadFlutterAsset('assets/html/kitchen.html'); 
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Kitchen")), 
      body: WebViewWidget(controller: controller),
    );
  }
}
