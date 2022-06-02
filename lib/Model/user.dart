class Users {
  String? uid;
  String? firstName;
  String? lastName;
  String? phone;
  String? state;
  String? email;
  String? code;
  List<String>? deliveryAddress;
  String? houseAddress;
  String? walletAmount;
  String? customerCode;
  String? bankName;
  String? accountNumber;
  String? bankAcctName;

  Users(
      {required this.uid,
      required this.firstName,
      required this.lastName,
      required this.phone,
      required this.state,
      required this.email,
      this.code,
      this.houseAddress,
      this.deliveryAddress,
      this.walletAmount,
      required this.customerCode,
      required this.bankName,
      required this.accountNumber,
      required this.bankAcctName});

  Users.fromJson(Map<String, dynamic> json) {
    uid = json['uid'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    phone = json['phone'];
    state = json['state'];
    email = json['email'];
    code = json['code'];
    deliveryAddress = json['delivery_address'];
    houseAddress = json['house_address'];
    walletAmount = json['wallet_amount'];
    customerCode = json['customer_code'];
    bankName = json['bank_name'];
    accountNumber = json['account_number'];
    bankAcctName = json['bank_acctname'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};

    data['uid'] = uid;
    data['first_name'] = firstName;
    data['last_name'] = lastName;
    data['phone'] = phone;
    data['state'] = state;
    data['email'] = email;
    data['code'] = code;
    data['delivery_address'] = deliveryAddress;
    data['house_address'] = houseAddress;
    data['wallet_amount'] = walletAmount;
    data['customer_code'] = customerCode;
    data['bank_name'] = bankName;
    data['account_number'] = accountNumber;
    data['bank_acctname'] = bankAcctName;

    return data;
  }
}
