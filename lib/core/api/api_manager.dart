import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:islami/core/model/RadioResponse.dart';

class ApiManager {
  static Future<RadioResponse> fetchRadio() async {
    var response = await http
        .get(Uri.parse('https://api.mp3quran.net/radios/radio_arabic.json'));
    var jsonResponse = jsonDecode(utf8.decode(response.bodyBytes));
    return RadioResponse.fromJson(jsonResponse);
  }
}
