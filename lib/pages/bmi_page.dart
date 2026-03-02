import 'package:flutter/material.dart';
import '../services/bmi_service.dart';
import '../widgets/app_scaffold.dart';
import '../widgets/labeled_text_field.dart';
import '../widgets/section_card.dart';

class BmiPage extends StatefulWidget {
  const BmiPage({super.key});

  @override
  State<BmiPage> createState() => _BmiPageState();
}

class _BmiPageState extends State<BmiPage> {
  final heightController = TextEditingController();
  final weightController = TextEditingController();

  double? bmi;
  String judgeText = "";

  void calculate() {
    final heightCm = double.tryParse(heightController.text.trim());
    final weightKg = double.tryParse(weightController.text.trim());

    final res = BmiService.calculate(heightCm, weightKg);

    setState(() {
      bmi = res?.bmi;
      judgeText = res?.judge ?? "";
    });
  }

  @override
  void dispose() {
    heightController.dispose();
    weightController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final bmiText = bmi == null ? "--" : bmi!.toStringAsFixed(1);
    final judge = judgeText.isEmpty ? "--" : judgeText;

    return AppScaffold(
      title: "BMI計算機",
      body: Column(
        children: [
          SectionCard(
            title: "入力",
            child: Column(
              children: [
                LabeledTextField(
                  controller: heightController,
                  label: "身長",
                  suffixText: "cm",
                  keyboardType: TextInputType.number,
                  onChanged: (_) => calculate(),
                ),
                const SizedBox(height: 16),
                LabeledTextField(
                  controller: weightController,
                  label: "体重",
                  suffixText: "kg",
                  keyboardType: TextInputType.number,
                  onChanged: (_) => calculate(),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          SectionCard(
            title: "結果",
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("BMI : $bmiText", style: const TextStyle(fontSize: 20)),
                const SizedBox(height: 8),
                Text(
                  "判定 : $judge",
                  style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}