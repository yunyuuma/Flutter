import '../models/bmi_result.dart';

class BmiService {
  static BmiResult? calculate(double? heightCm, double? weightKg) {
    if (heightCm == null || weightKg == null) return null;
    if (heightCm <= 0 || weightKg <= 0) return null;

    final heightM = heightCm / 100.0;
    final bmi = weightKg / (heightM * heightM);
    return BmiResult(bmi: bmi, judge: judgeByBmi(bmi));
  }

  static String judgeByBmi(double bmi) {
    if (bmi < 18.5) return "痩せ";
    if (bmi < 25) return "普通";
    return "肥満";
  }
}