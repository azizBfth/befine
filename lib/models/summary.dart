class SummaryModel {
  final int deviceId;
  final String deviceName;
  
  SummaryModel({
    required this.deviceId,
    
    required this.deviceName,
    
  });

  factory SummaryModel.fromJson(Map<String, dynamic> data) {
    return SummaryModel(
      deviceId: data["deviceId"],
      deviceName: data["deviceName"],
    
    );
  }
}
