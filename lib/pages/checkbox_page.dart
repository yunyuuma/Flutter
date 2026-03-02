import 'package:flutter/material.dart';
import '../models/food_option.dart';
import '../widgets/app_scaffold.dart';
import '../widgets/section_card.dart';

class CheckboxPage extends StatefulWidget {
  const CheckboxPage({super.key});

  @override
  State<CheckboxPage> createState() => _CheckboxPageState();
}

class _CheckboxPageState extends State<CheckboxPage> {
  final List<FoodOption> options = [
    FoodOption(label: "すし"),
    FoodOption(label: "天ぷら"),
    FoodOption(label: "焼肉"),
  ];

  String get selectedText {
    final selected = options.where((o) => o.selected).map((o) => o.label).toList();
    return selected.isEmpty ? "なし" : selected.join(", ");
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      title: "チェックボックス",
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SectionCard(
            title: "好きな食べ物",
            child: Column(
              children: options.map((opt) {
                return CheckboxListTile(
                  title: Text(opt.label),
                  value: opt.selected,
                  onChanged: (v) => setState(() => opt.selected = v ?? false),
                );
              }).toList(),
            ),
          ),
          const SizedBox(height: 12),
          Text(
            "選択中：$selectedText",
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}