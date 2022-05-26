import 'dart:convert';

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
      'Accept': 'text/plain',
      'AppId': ApiBase.appId,
      'Authorization': ApiBase.authorizationKey,
      'Content-Type': 'application/json',
    };
    var encd = jsonEncode(body);
    Response response = await post(uri, headers: header, body: encd);
    print(response.body);
    print('request id');
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
}
