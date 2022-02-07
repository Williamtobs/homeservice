class User {
  String? uid;
  String? name;
  String? phone;
  String? state;

  User({
    required this.uid,
    required this.name,
    required this.phone,
    required this.state,
  });

  User.fromJson(Map<String, dynamic> json) {
    uid = json['uid'];
    name = json['name'];
    phone = json['phone'];
    state = json['last_seen'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};

    data['uid'] = uid;
    data['name'] = name;
    data['presence'] = phone;
    data['last_seen'] = state;

    return data;
  }
}