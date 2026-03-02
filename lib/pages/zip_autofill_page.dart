import 'package:flutter/material.dart';

import '../services/zipcloud_service.dart';
import '../widgets/app_scaffold.dart';
import '../widgets/section_card.dart';
import '../widgets/labeled_text_field.dart';
import '../widgets/primary_button.dart';

class ZipAutoFillPage extends StatefulWidget {
  const ZipAutoFillPage({super.key});

  @override
  State<ZipAutoFillPage> createState() => _ZipAutoFillPageState();
}

class _ZipAutoFillPageState extends State<ZipAutoFillPage> {
  final zipController = TextEditingController();
  final prefController = TextEditingController();
  final cityController = TextEditingController();

  bool loading = false;
  String? errorText;

  @override
  void dispose() {
    zipController.dispose();
    prefController.dispose();
    cityController.dispose();
    super.dispose();
  }

  Future<void> onAutoFill() async {
    setState(() {
      loading = true;
      errorText = null;
    });

    try {
      final addr = await ZipCloudService.fetchAddress(zipController.text);

      // 都道府県、市区町村に反映
      prefController.text = addr.address1;
      cityController.text = addr.address2;
    } catch (e) {
      setState(() {
        errorText = e.toString().replaceFirst('Exception: ', '');
      });
    } finally {
      setState(() => loading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      title: "住所自動入力（ZipCloud）",
      body: Column(
        children: [
          SectionCard(
            title: "郵便番号",
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: LabeledTextField(
                        controller: zipController,
                        label: "郵便番号（7桁）",
                        keyboardType: TextInputType.number,
                      ),
                    ),
                    const SizedBox(width: 12),
                    SizedBox(
                      width: 120,
                      height: 56,
                      child: ElevatedButton(
                        onPressed: loading ? null : onAutoFill,
                        child: loading
                            ? const SizedBox(
                                width: 18,
                                height: 18,
                                child: CircularProgressIndicator(strokeWidth: 2),
                              )
                            : const Text("自動入力"),
                      ),
                    ),
                  ],
                ),
                if (errorText != null) ...[
                  const SizedBox(height: 10),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      errorText!,
                      style: const TextStyle(color: Colors.red),
                    ),
                  ),
                ],
              ],
            ),
          ),
          const SizedBox(height: 16),
          SectionCard(
            title: "都道府県",
            child: LabeledTextField(
              controller: prefController,
              label: "都道府県",
            ),
          ),
          const SizedBox(height: 16),
          SectionCard(
            title: "市区町村",
            child: LabeledTextField(
              controller: cityController,
              label: "市区町村",
            ),
          ),

          // 便利：クリア（任意）
          const SizedBox(height: 16),
          PrimaryButton(
            text: "クリア",
            onPressed: () {
              zipController.clear();
              prefController.clear();
              cityController.clear();
              setState(() => errorText = null);
            },
          ),
        ],
      ),
    );
  }
}