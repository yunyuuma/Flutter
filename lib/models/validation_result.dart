class ValidationResult {
  final bool isValid;
  final String? errorMessage;

  const ValidationResult({
    required this.isValid,
    this.errorMessage,
  });

  factory ValidationResult.ok() => const ValidationResult(isValid: true);

  factory ValidationResult.ng(String message) =>
      ValidationResult(isValid: false, errorMessage: message);
}