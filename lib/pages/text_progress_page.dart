import 'package:flutter/material.dart';
import '../services/text_counter_service.dart';
import '../widgets/app_scaffold.dart';
import '../widgets/section_card.dart';

class TextProgressPage extends StatefulWidget {
  const TextProgressPage({super.key});

  @override
  State<TextProgressPage> createState() => _TextProgressPageState();
}

class _TextProgressPageState extends State<TextProgressPage> {
  static const int maxLength = 50;
  int currentLength = 0;

  @override
  Widget build(BuildContext context) {
    final progress = TextCounterService.progress(currentLength, maxLength);
    final counter = TextCounterService.counterText(currentLength, maxLength);

    return AppScaffold(
      title: "文字数プログレスバー",
      body: SectionCard(
        title: "最大$maxLength文字",
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              maxLength: maxLength,
              onChanged: (t) => setState(() => currentLength = t.length),
              decoration: const InputDecoration(
                labelText: "入力欄",
                border: OutlineInputBorder(),
                counterText: "",
              ),
            ),
            const SizedBox(height: 12),
            LinearProgressIndicator(value: progress, minHeight: 8),
            const SizedBox(height: 10),
            Text(counter, style: const TextStyle(fontSize: 16)),
          ],
        ),
      ),
    );
  }
}