import 'package:flutter/material.dart';
import '../services/validation_service.dart';
import '../widgets/app_scaffold.dart';
import '../widgets/section_card.dart';

class ValidationPage extends StatefulWidget {
  const ValidationPage({super.key});

  @override
  State<ValidationPage> createState() => _ValidationPageState();
}

class _ValidationPageState extends State<ValidationPage> {
  final _formKey = GlobalKey<FormState>();

  final _emailCtrl = TextEditingController();
  final _phoneCtrl = TextEditingController();

  final _emailFocus = FocusNode();
  final _phoneFocus = FocusNode();

  bool _showEmailError = false;
  bool _showPhoneError = false;

  @override
  void initState() {
    super.initState();

    _emailFocus.addListener(() {
      if (!_emailFocus.hasFocus) {
        setState(() => _showEmailError = true);
        _formKey.currentState?.validate();
      }
    });

    _phoneFocus.addListener(() {
      if (!_phoneFocus.hasFocus) {
        setState(() => _showPhoneError = true);
        _formKey.currentState?.validate();
      }
    });
  }

  @override
  void dispose() {
    _emailCtrl.dispose();
    _phoneCtrl.dispose();
    _emailFocus.dispose();
    _phoneFocus.dispose();
    super.dispose();
  }

  String? _validateEmail(String? value) {
    if (!_showEmailError) return null;
    final res = ValidationService.validateEmail(value ?? "");
    return res.isValid ? null : res.errorMessage;
  }

  String? _validatePhone(String? value) {
    if (!_showPhoneError) return null;
    final res = ValidationService.validatePhone(value ?? "");
    return res.isValid ? null : res.errorMessage;
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      title: "形式判定（メール/電話）",
      body: Form(
        key: _formKey,
        child: Column(
          children: [
            SectionCard(
              title: "入力欄から移動したときに判定",
              child: Column(
                children: [
                  TextFormField(
                    controller: _emailCtrl,
                    focusNode: _emailFocus,
                    keyboardType: TextInputType.emailAddress,
                    decoration: const InputDecoration(
                      labelText: "メールアドレス入力欄",
                      border: OutlineInputBorder(),
                    ),
                    validator: _validateEmail,
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                    controller: _phoneCtrl,
                    focusNode: _phoneFocus,
                    keyboardType: TextInputType.phone,
                    decoration: const InputDecoration(
                      labelText: "電話番号入力欄",
                      border: OutlineInputBorder(),
                    ),
                    validator: _validatePhone,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}