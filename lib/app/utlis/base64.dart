import 'dart:convert';

import 'package:http/http.dart' as http;
class ImageNetworkToBase64{
  String url;

  ImageNetworkToBase64({required this.url});

  Future<String> getHttp() async {
    var _base64;
    http.Response response = await http.get(Uri.parse(this.url));
    _base64 = base64.encode(response.bodyBytes);
    return _base64;
  }
}