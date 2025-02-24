


class Device {
  final int? id;
  final String? uniqueId;
  final String? name;
  final String status;
  final bool disabled;
  final lastUpdate;
 
  final String? model;

  Device(
      {this.id,
      this.name,
      this.uniqueId,
      required this.status,
      required this.disabled,
      required this.lastUpdate,
      this.model,
});

  factory Device.fromJson(Map<String, dynamic> data) {
    return Device(
      id: data["id"],
    
      name: data["name"],
      status: data['status'], 
      lastUpdate: data["lastUpdate"],
      model: data["model"],
      uniqueId: data["uniqueId"],
      disabled: data['disabled'],
    
    );
  }
}
