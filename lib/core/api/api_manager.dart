import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:islami/core/model/RadioResponse.dart';

class ApiManager {
  static Future<RadioResponse> fetchRadio() async {
    var uri = Uri.parse('https://mp3quran.net/api/v3/radios');
    var response = await http.get(uri);
    if (response.statusCode == 200) {
      var jsonResponse = jsonDecode(response.body);
      return RadioResponse.fromJson(jsonResponse);
    } else {
      throw Exception('Failed to load radios');
    }
  }
}
