import 'dart:convert';
import 'package:http/http.dart' as http;

import '../models/zipcloud_address.dart';
import '../models/zipcloud_response.dart';

class ZipCloudService {
  static const String _baseUrl = 'https://zipcloud.ibsnet.co.jp/api/search';

  static Future<ZipCloudAddress> fetchAddress(String zipcode) async {
    final normalized = zipcode.replaceAll(RegExp(r'[^0-9]'), '');
    if (normalized.length != 7) {
      throw Exception('郵便番号は7桁で入力してください');
    }

    final uri = Uri.parse(_baseUrl).replace(queryParameters: {'zipcode': normalized});
    final res = await http.get(uri);

    if (res.statusCode != 200) {
      throw Exception('通信に失敗しました（HTTP ${res.statusCode}）');
    }

    final Map<String, dynamic> jsonMap = jsonDecode(res.body) as Map<String, dynamic>;
    final api = ZipCloudResponse.fromJson(jsonMap);

    if (api.status != 200) {
      throw Exception(api.message ?? '住所の取得に失敗しました');
    }

    if (api.results.isEmpty) {
      throw Exception('該当する住所が見つかりませんでした');
    }

    return api.results.first;
  }
}