import 'package:flutter/material.dart';
import 'package:navershop/webview_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const WebViewScreen(),
      debugShowCheckedModeBanner: false,
      title: '네이버쇼핑',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
    );
  }
}
