import 'package:flutter/material.dart';
import '../widgets/app_scaffold.dart';

import 'counter_page.dart';
import 'checkbox_page.dart';
import 'radio_page.dart';
import 'password_page.dart';
import 'text_progress_page.dart';
import 'opacity_page.dart';
import 'validation_page.dart';
import 'bmi_page.dart';
import 'zip_autofill_page.dart';
import 'login_demo_login_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  void _push(BuildContext context, Widget page) {
    Navigator.push(context, MaterialPageRoute(builder: (_) => page));
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      title: "メニュー",
      body: ListView(
        children: [
          ListTile(
            title: const Text("カウンターアプリ"),
            onTap: () => _push(context, const CounterPage()),
          ),
          ListTile(
            title: const Text("チェックボックス（選択を表示）"),
            onTap: () => _push(context, const CheckboxPage()),
          ),
          ListTile(
            title: const Text("ラジオボタン（選択を表示）"),
            onTap: () => _push(context, const RadioPage()),
          ),
          ListTile(
            title: const Text("トグルボタン"),
            onTap: () => _push(context, const PasswordPage()),
          ),
          ListTile(
            title: const Text("文字数プログレスバー"),
            onTap: () => _push(context, const TextProgressPage()),
          ),
          ListTile(
            title: const Text("スライダーで透明度調整"),
            onTap: () => _push(context, const OpacityPage()),
          ),
          ListTile(
            title: const Text("メール形式、電話番号形式判定"),
            onTap: () => _push(context, const ValidationPage()),
          ),
          ListTile(
            title: const Text("BMI計算機"),
            onTap: () => _push(context, const BmiPage()),
          ),
          ListTile(
            title: const Text("住所自動入力"),
            onTap: () => _push(context, const ZipAutoFillPage()),
          ),
          ListTile(
            title: const Text("ログイン機能（デモ）"),
            onTap: () => _push(context, const LoginDemoLoginPage()),
          ),
        ],
      ),
    );
  }
}