import 'dart:convert';
import 'package:http/http.dart' as http;

String baseUrl = 'http://api.openweathermap.org/data/2.5';

class RemoteService {

  var client = http.Client();

  Future<dynamic> get(String api) async {
    var url = Uri.parse(baseUrl + api);
    var header = {
      'Content-Type': 'application/json',
    };
    var response = await client.get(url);

    if (response.statusCode == 200) {
      final decodedData = utf8.decode(response.bodyBytes);

      return decodedData;
    } else if (response.statusCode == 429) {
      //error the app is temporary blocked due to overuse
      throw Exception('Too many requests');
      //Your account is temporary blocked due to exceeding of requests limitation of your subscription type.
    }
  }

  
}
