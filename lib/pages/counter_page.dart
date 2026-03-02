import 'package:flutter/material.dart';
import '../widgets/app_scaffold.dart';
import '../widgets/section_card.dart';

class CounterPage extends StatefulWidget {
  const CounterPage({super.key});

  @override
  State<CounterPage> createState() => _CounterPageState();
}

class _CounterPageState extends State<CounterPage> {
  int count = 0;

  void plus() => setState(() => count++);
  void minus() => setState(() => count--);

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      title: "カウンター",
      body: Center(
        child: SectionCard(
          title: "ボタンを押して増減",
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text("count : $count", style: const TextStyle(fontSize: 28)),
              const SizedBox(height: 18),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(onPressed: minus, child: const Text("-1ボタン")),
                  const SizedBox(width: 14),
                  ElevatedButton(onPressed: plus, child: const Text("+1ボタン")),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}