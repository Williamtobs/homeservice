class OtpModel {
  String? id;
  String? phone;

  OtpModel({
    required id,
    required phone,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['sender_id'] = id;
    data['destination'] = phone;
    return data;
  }
}
