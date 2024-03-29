import 'package:firebase_performance/firebase_performance.dart';
import 'package:newspaper_app/rest/RequestType.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class RestServiceManager {
  static const defaultheader = {'Content-Type': 'application/json'};

  static Future<Map<String, dynamic>> call(String url, String endpoint, Map<String, String>? requestHeader, RequestType requestType) async {
    Map<String, String> header = new Map<String, String>();
    FirebasePerformance performance = FirebasePerformance.instance;
    HttpMetric metric = performance.newHttpMetric(url + endpoint, HttpMethod.Post);

    header.addAll(defaultheader);

    if (requestHeader != null) {
      header.addAll(requestHeader);
    }

    try {
      await metric.start();
      var response;

      var uri = Uri.parse(url + endpoint);

      if (requestType == RequestType.POST) {
        response = await http.post(uri, headers: header, body: jsonEncode(response));
      } else {
        response = await http.get(uri, headers: header);
      }

      switch (response.statusCode) {
        case 200:
          return jsonDecode(response.body.toString()) as Map<String, dynamic>;
        case 201:
          return jsonDecode(response.body.toString()) as Map<String, dynamic>;
        case 400:
          throw Exception('Hata');
      }
      metric.httpResponseCode = int.tryParse(response.statusCode.toString());
      metric.responsePayloadSize = int.tryParse(response.contentLength.toString());
      await metric.stop();
    } catch (ex) {}

    return {};
  }
}
