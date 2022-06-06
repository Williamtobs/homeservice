class UpdateServiceAddress {
  String? address;
  UpdateServiceAddress({required this.address});

  UpdateServiceAddress.fromJson(Map<String, dynamic> json) {
    address = json['delivery_address'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['delivery_address'] = address;
    return data;
  }
}
