class TextCounterService {
  static double progress(int currentLength, int maxLength) {
    if (maxLength <= 0) return 0.0;
    final p = currentLength / maxLength;
    if (p < 0) return 0.0;
    if (p > 1) return 1.0;
    return p;
  }

  static String counterText(int currentLength, int maxLength) {
    return "$currentLength/$maxLength文字";
  }
}