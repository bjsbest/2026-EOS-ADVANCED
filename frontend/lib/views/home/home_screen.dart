import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('나의 TODO'),
        actions: [
          IconButton(onPressed: () => context.push('/friends'), icon: const Icon(Icons.people)),
        ],
      ),
      body: const Center(child: Text('여기에 캘린더와 TODO 리스트가 들어옵니다.')),
    );
  }
}