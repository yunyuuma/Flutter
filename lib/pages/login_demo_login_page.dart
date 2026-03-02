import 'package:flutter/material.dart';
import 'login_demo_home_page.dart';

class LoginDemoLoginPage extends StatefulWidget {
  const LoginDemoLoginPage({super.key});

  @override
  State<LoginDemoLoginPage> createState() => _LoginDemoLoginPageState();
}

class _LoginDemoLoginPageState extends State<LoginDemoLoginPage> {
  final idController = TextEditingController();
  final passController = TextEditingController();
  bool obscure = true;

  @override
  void dispose() {
    idController.dispose();
    passController.dispose();
    super.dispose();
  }

  Future<void> _showFailDialog() async {
    await showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text("ログイン失敗"),
        content: const Text("IDまたはパスワードが違います。"),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("OK"),
          )
        ],
      ),
    );
  }

  Future<void> _login() async {
    final id = idController.text.trim();
    final pass = passController.text;

    if (id == "user1" && pass == "pass1") {
      // 成功
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const LoginDemoHomePage()),
      );
    } else {
      // 失敗
      await _showFailDialog();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("ログイン（デモ）")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: idController,
              decoration: const InputDecoration(
                labelText: "ID",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 12),
            TextField(
              controller: passController,
              obscureText: obscure,
              decoration: InputDecoration(
                labelText: "パスワード",
                border: const OutlineInputBorder(),
                suffixIcon: IconButton(
                  onPressed: () => setState(() => obscure = !obscure),
                  icon: Icon(obscure ? Icons.visibility : Icons.visibility_off),
                ),
              ),
            ),
            const SizedBox(height: 16),
            SizedBox(
              width: double.infinity,
              height: 48,
              child: ElevatedButton(
                onPressed: _login,
                child: const Text("ログイン"),
              ),
            ),
            const SizedBox(height: 12),
            const Text("成功条件：user1 / pass1"),
          ],
        ),
      ),
    );
  }
}