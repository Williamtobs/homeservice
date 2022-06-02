import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart';

import 'api_base_helper.dart';

class ApiService {
  Future requestId(String userId) async {
    Map<String, dynamic> body = {
      'sender_id': userId,
    };
    final uri = Uri.parse('${ApiBase.liveUrl}${ApiBase.requestIdEndpoint}');
    var header = {
      'Appid': ApiBase.appId,
      HttpHeaders.authorizationHeader: ApiBase.authorizationKey,
      HttpHeaders.contentTypeHeader: 'application/json',
    };
    var encd = jsonEncode(body);
    Response response = await post(uri, headers: header, body: encd);
    print(response.body);
    print('request');
    print(response.statusCode);
    //Map<String, dynamic> data = jsonDecode(response.body);
    if (response.statusCode == 200 || response.statusCode == 201) {
      print(response.statusCode);
      print('request id success');
      return response.statusCode;
    } else {
      return response.statusCode;
    }
  }

  Future verifyOtp(String otp, String referenceId) async {
    var header = {
      'Accept': 'text/plain',
      'AppId': ApiBase.appId,
      'Authorization': ApiBase.authorizationKey,
    };
    final uri = Uri.parse(
        '${ApiBase.liveUrl}${ApiBase.validateOtp}?code=$otp&reference_id=$referenceId');
    Response response = await get(uri, headers: header);
    print(response.body);
    print(response.statusCode);
    Map<String, dynamic> data = jsonDecode(response.body);
    if (response.statusCode == 200 || response.statusCode == 201) {
      return data;
    } else {
      return data;
    }
    // return response;
  }

  Future postOtp(String id, String phone) async {
    Response response;
    Map<String, dynamic>? body = {
      'sender_id': id,
      'destination': phone,
      'channel': 'whatsapp, sms',
    };
    var header = {
      'Accept': 'text/plain',
      'AppId': ApiBase.appId,
      'Authorization': ApiBase.authorizationKey,
      'Content-Type': 'application/json',
    };
    try {
      var url = Uri.parse(ApiBase.liveUrl + ApiBase.sendOtpendPoint);
      response = await post(url, body: body, headers: header);
      if (kDebugMode) {
        print(response.statusCode);
      }
      Map<String, dynamic> data = jsonDecode(response.body);
      if (response.statusCode == 200 || response.statusCode == 201) {
        return data;
      } else if (response.statusCode == 401) {
        throw ClientException('Unauthorized');
      } else if (response.statusCode == 500) {
        throw ClientException('Server error');
      } else {
        throw Exception('Oh darn! Something went wrong');
      }
    } catch (e) {
      throw Exception(e);
    }
  }

  Future createCustomer(
      String email, String lastname, String firstname, String phone) async {
    Response response;
    Map<String, dynamic>? body = {
      'email': email,
      'first_name': firstname,
      'last_name': lastname,
      'phone': phone,
    };
    var header = {
      'Authorization': 'Bearer ${ApiBase.paystackPublicKey}',
      'Content-Type': 'application/json',
    };
    try {
      var url = Uri.parse('${ApiBase.paystackBaseUrl}customer');
      response = await post(url, body: jsonEncode(body), headers: header);
      if (kDebugMode) {
        print(response.statusCode);
      }
      Map<String, dynamic> data = jsonDecode(response.body);
      if (kDebugMode) {
        print(data);
      }
      if (response.statusCode == 200 || response.statusCode == 201) {
        return data;
      } else if (response.statusCode == 401) {
        throw ClientException('Unauthorized');
      } else if (response.statusCode == 500) {
        throw ClientException('Server error');
      } else {
        throw Exception('Oh darn! Something went wrong');
      }
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<String> initializeTransaction(String email, String amount) async {
    Response response;
    Map<String, dynamic>? body = {'email': email, 'amount': amount};
    var header = {
      'Authorization': 'Bearer ${ApiBase.paystackSecretKey}',
      'Content-Type': 'application/json',
    };
    //transaction/initialize
    try {
      var url = Uri.parse('${ApiBase.paystackBaseUrl}transaction/initialize');
      response = await post(url, body: jsonEncode(body), headers: header);
      if (kDebugMode) {
        print(response.statusCode);
      }
      Map<String, dynamic> data = jsonDecode(response.body);
      if (kDebugMode) {
        print(response.body);
      }
      if (response.statusCode == 200 || response.statusCode == 201) {
        return data['data']['access_code'];
      } else if (response.statusCode == 401) {
        throw ClientException('Unauthorized');
      } else if (response.statusCode == 500) {
        throw ClientException('Server error');
      } else {
        throw Exception('Oh darn! Something went wrong');
      }
    } catch (e) {
      throw Exception(e);
    }
  }

  Future createUserAccount(String customerId) async {
    Response response;
    Map<String, dynamic>? body = {
      'customer': customerId,
      'preferred_bank': 'wema-bank'
    };
    var header = {
      'Authorization': 'Bearer ${ApiBase.paystackPublicKey}',
      'Content-Type': 'application/json',
    };
    try {
      var url = Uri.parse('${ApiBase.paystackBaseUrl}dedicated_account');
      response = await post(url, body: jsonEncode(body), headers: header);
      if (kDebugMode) {
        print(response.statusCode);
      }
      Map<String, dynamic> data = jsonDecode(response.body);
      if (kDebugMode) {
        print(data);
      }
      if (response.statusCode == 200 || response.statusCode == 201) {
        return data;
      } else if (response.statusCode == 401) {
        throw ClientException('Unauthorized');
      } else if (response.statusCode == 500) {
        throw ClientException('Server error');
      } else {
        throw Exception('Oh darn! Something went wrong');
      }
    } catch (e) {
      throw Exception(e);
    }
  }
}
