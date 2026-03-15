import 'package:flutter/material.dart';
import 'utils/router.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: router, 
      title: '공유 TODO 앱',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: true, 
      ),
    );
  }
}