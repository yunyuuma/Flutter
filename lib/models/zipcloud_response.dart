import 'zipcloud_address.dart';

class ZipCloudResponse {
  final int status;
  final String? message;
  final List<ZipCloudAddress> results;

  const ZipCloudResponse({
    required this.status,
    required this.message,
    required this.results,
  });

  factory ZipCloudResponse.fromJson(Map<String, dynamic> json) {
    final rawResults = json['results'];
    final list = (rawResults is List)
        ? rawResults
            .whereType<Map<String, dynamic>>()
            .map(ZipCloudAddress.fromJson)
            .toList()
        : <ZipCloudAddress>[];

    return ZipCloudResponse(
      status: (json['status'] ?? 0) as int,
      message: json['message'] as String?,
      results: list,
    );
  }
}