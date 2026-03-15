import 'package:flutter/material.dart';
import 'cores/router.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: router, // router 설정 연결
      title: '공유 TODO 앱',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: true, // 최신 UI 스타일 적용
      ),
    );
  }
}