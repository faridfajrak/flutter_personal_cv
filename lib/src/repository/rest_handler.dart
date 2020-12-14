
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:personalcv/src/repository/base_http_response.dart';

class RestHandler{
  // static String BASE_URL = 'https://base_url.com'
  // static String API_KEY = 'API_KEY'; //

  static Future<BaseHttpResponse> getMainPage() async{
    var url = BASE_URL + 'get-main-page';
    var response = await http.get(url,headers: {'key':API_KEY});
    return handleResponse(response, url);

  }


  static Future<BaseHttpResponse> getProjects() async{
    var url = BASE_URL + 'get-projects';
    var response = await http.get(url,headers: {'key':API_KEY});
    return handleResponse(response, url);

  }


  static Future<BaseHttpResponse> getSkills() async{
    var url = BASE_URL + 'get-skills';
    var response = await http.get(url,headers: {'key':API_KEY});
    return handleResponse(response, url);
  }

  static Future<BaseHttpResponse> handleResponse(
      var response, String url) async {
    if (response != null) {
      return BaseHttpResponse.fromJson(
          jsonData: json.decode(response.body),
          resCode: response.statusCode,
          url: url);
    } else {
      return BaseHttpResponse(
          data: null, message: 'Connection Error', httpCode: -1);
    }
  }
}