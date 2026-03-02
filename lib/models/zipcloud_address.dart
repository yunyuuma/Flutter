class ZipCloudAddress {
  final String address1; 
  final String address2; 
  final String address3; 

  const ZipCloudAddress({
    required this.address1,
    required this.address2,
    required this.address3,
  });

  factory ZipCloudAddress.fromJson(Map<String, dynamic> json) {
    return ZipCloudAddress(
      address1: (json['address1'] ?? '') as String,
      address2: (json['address2'] ?? '') as String,
      address3: (json['address3'] ?? '') as String,
    );
  }
}