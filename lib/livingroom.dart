import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class LivingRoomScreen extends StatefulWidget {
  const LivingRoomScreen({Key? key}) : super(key: key); 

  @override
  LivingRoomScreenState createState() => LivingRoomScreenState(); 
}

class LivingRoomScreenState extends State<LivingRoomScreen> { 
  late final WebViewController controller;

  @override
  void initState() {
    super.initState();
    controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..loadFlutterAsset('assets/html/livingroom.html'); 
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Living Room")), 
      body: WebViewWidget(controller: controller),
    );
  }
}
