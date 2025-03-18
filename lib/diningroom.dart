import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class DiningRoomScreen extends StatefulWidget {
  const DiningRoomScreen({Key? key}) : super(key: key); 

  @override
  DiningRoomScreenState createState() => DiningRoomScreenState(); 
}

class DiningRoomScreenState extends State<DiningRoomScreen> { 
  late final WebViewController controller;

  @override
  void initState() {
    super.initState();
    controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..loadFlutterAsset('assets/html/diningroom.html'); 
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Dining Room")), 
      body: WebViewWidget(controller: controller),
    );
  }
}
