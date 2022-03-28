class Users {
  String? uid;
  String? name;
  String? phone;
  String? state;
  String? email;
  String? code;

  Users(
      {required this.uid,
      required this.name,
      required this.phone,
      required this.state,
      required this.email,
      required this.code});

  Users.fromJson(Map<String, dynamic> json) {
    uid = json['uid'];
    name = json['name'];
    phone = json['phone'];
    state = json['state'];
    email = json['email'];
    code = json['code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};

    data['uid'] = uid;
    data['name'] = name;
    data['phone'] = phone;
    data['state'] = state;
    data['email'] = email;
    data['code'] = code;

    return data;
  }
}
