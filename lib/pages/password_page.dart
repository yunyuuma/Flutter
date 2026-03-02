import 'package:flutter/material.dart';
import '../widgets/app_scaffold.dart';
import '../widgets/labeled_text_field.dart';
import '../widgets/section_card.dart';

class PasswordPage extends StatefulWidget {
  const PasswordPage({super.key});

  @override
  State<PasswordPage> createState() => _PasswordPageState();
}

class _PasswordPageState extends State<PasswordPage> {
  final controller = TextEditingController();
  bool isObscure = true;

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      title: "パスワード表示切替",
      body: SectionCard(
        title: "トグルボタン",
        child: LabeledTextField(
          controller: controller,
          label: "パスワード",
          obscureText: isObscure,
          suffix: TextButton(
            onPressed: () => setState(() => isObscure = !isObscure),
            child: Text(isObscure ? "表示" : "非表示"),
          ),
        ),
      ),
    );
  }
}