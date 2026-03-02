import 'package:flutter/material.dart';
import '../widgets/app_scaffold.dart';
import '../widgets/section_card.dart';

class OpacityPage extends StatefulWidget {
  const OpacityPage({super.key});

  @override
  State<OpacityPage> createState() => _OpacityPageState();
}

class _OpacityPageState extends State<OpacityPage> {
  double opacityValue = 1.0; // 100%

  @override
  Widget build(BuildContext context) {
    final percent = (opacityValue * 100).round();

    return AppScaffold(
      title: "透明度スライダー",
      body: Column(
        children: [
          SectionCard(
            title: "0〜100%で調整",
            child: Column(
              children: [
                Slider(
                  value: opacityValue,
                  min: 0.0,
                  max: 1.0,
                  divisions: 100,
                  label: "$percent%",
                  onChanged: (v) => setState(() => opacityValue = v),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text("透明度：$percent%", style: const TextStyle(fontSize: 16)),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          SectionCard(
            title: "図形（青）",
            child: Center(
              child: Opacity(
                opacity: opacityValue,
                child: Container(
                  width: 800,
                  height: 70,
                  color: Colors.deepPurple,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}