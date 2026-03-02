import 'package:flutter/material.dart';
import 'login_demo_login_page.dart';

class LoginDemoHomePage extends StatelessWidget {
  const LoginDemoHomePage({super.key});

  void _logout(BuildContext context) {
    // ログアウト
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (_) => const LoginDemoLoginPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("ホーム（デモ）"),
        actions: [
          TextButton(
            onPressed: () => _logout(context),
            child: const Text(
              "ログアウト",
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
      body: const Center(
        child: Text(
          "ログイン成功！\nここはデモ用ホーム画面です。",
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}