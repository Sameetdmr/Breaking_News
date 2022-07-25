import 'package:newspaper_app/rest/RequestType.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class RestServiceManager {
  static const defaultheader = {'Content-Type': 'application/json'};

  static dynamic call(String url, String endpoint, Map<String, String>? requestHeader, RequestType requestType) async {
    Map<String, String> header = new Map<String, String>();
    header.addAll(defaultheader);

    if (requestHeader != null) {
      header.addAll(requestHeader);
    }

    try {
      var response;

      var uri = Uri.parse(url + endpoint);
      if (requestType == RequestType.POST) {
        response = await http.post(uri, headers: header, body: jsonEncode(response));
      } else {
        response = await http.get(uri, headers: header);
      }

      switch (response.statusCode) {
        case 200:
          return jsonDecode(response.body);
        case 201:
          return jsonDecode(response.body);
        case 400:
          throw Exception('Hata');
      }
    } catch (ex) {}
  }
}
