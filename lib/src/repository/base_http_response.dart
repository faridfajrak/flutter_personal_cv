import 'package:flutter/foundation.dart';

class BaseHttpResponse {
  final Map<String, dynamic> data;
  final String message;
  final int httpCode;

  BaseHttpResponse({this.data, this.message, this.httpCode});

  factory BaseHttpResponse.fromJson(
      {Map<String, dynamic> jsonData, int resCode, String url = ''}) {
    Map<String, dynamic> bodyJson = {};
    if (jsonData.containsKey('data')) {
      try {
        bodyJson = jsonData['data'];
      }catch(e) {
        bodyJson = {};
      }
    }
    String message = '';
    if (jsonData.containsKey('message')) {
      message = jsonData['message'];
    }
    // if(!kIsWeb)
      print("HTTP_RESPONSE from:$url, status_code:$resCode , message: $message, body: $bodyJson");
    return BaseHttpResponse(
        data: bodyJson, message: message, httpCode: resCode);
  }
}
