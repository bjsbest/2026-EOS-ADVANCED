import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('로그인')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(onPressed: () => context.go('/'), child: const Text('로그인 하기 (홈으로)')),
            TextButton(onPressed: () => context.push('/signup'), child: const Text('회원가입 하러 가기')),
          ],
        ),
      ),
    );
  }
}