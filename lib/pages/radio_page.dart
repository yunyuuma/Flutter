import 'package:flutter/material.dart';
import '../widgets/app_scaffold.dart';
import '../widgets/section_card.dart';

class RadioPage extends StatefulWidget {
  const RadioPage({super.key});

  @override
  State<RadioPage> createState() => _RadioPageState();
}

class _RadioPageState extends State<RadioPage> {
  String selectedGender = "男性";

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      title: "ラジオボタン",
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SectionCard(
            title: "性別",
            child: Column(
              children: [
                RadioListTile<String>(
                  title: const Text("男性"),
                  value: "男性",
                  groupValue: selectedGender,
                  onChanged: (v) => setState(() => selectedGender = v!),
                ),
                RadioListTile<String>(
                  title: const Text("女性"),
                  value: "女性",
                  groupValue: selectedGender,
                  onChanged: (v) => setState(() => selectedGender = v!),
                ),
              ],
            ),
          ),
          const SizedBox(height: 12),
          Text(
            "選択中：$selectedGender",
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}