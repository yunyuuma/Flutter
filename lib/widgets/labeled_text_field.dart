import 'package:flutter/material.dart';

class LabeledTextField extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final TextInputType keyboardType;
  final String? suffixText;
  final Widget? suffix;
  final bool obscureText;
  final void Function(String)? onChanged;

  const LabeledTextField({
    super.key,
    required this.controller,
    required this.label,
    this.keyboardType = TextInputType.text,
    this.suffixText,
    this.suffix,
    this.obscureText = false,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      keyboardType: keyboardType,
      obscureText: obscureText,
      onChanged: onChanged,
      decoration: InputDecoration(
        labelText: label,
        suffixText: suffixText,
        suffixIcon: suffix,
        border: const OutlineInputBorder(),
      ),
    );
  }
}