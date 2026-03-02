import '../models/validation_result.dart';

class ValidationService {
  static final RegExp _emailRegex =
      RegExp(r'^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}$');

  static final RegExp _phoneRegex =
      RegExp(r'^(0\d{1,4}-?\d{1,4}-?\d{3,4})$');

  static ValidationResult validateEmail(String input) {
    final v = input.trim();
    if (v.isEmpty) return ValidationResult.ng("メールアドレス形式が不正です");
    if (!_emailRegex.hasMatch(v)) return ValidationResult.ng("メールアドレス形式が不正です");
    return ValidationResult.ok();
  }

  static ValidationResult validatePhone(String input) {
    final v = input.trim();
    if (v.isEmpty) return ValidationResult.ng("電話番号形式が不正です");
    if (!_phoneRegex.hasMatch(v)) return ValidationResult.ng("電話番号形式が不正です");
    return ValidationResult.ok();
  }
}