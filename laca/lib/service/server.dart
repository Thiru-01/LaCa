import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';

class Server {
  Future<Map> getResponse(
      {required String link, required String imagePath}) async {
    String rawUrl = "$link/g_code";
    Uri url = Uri.parse(rawUrl);
    http.MultipartRequest request = http.MultipartRequest('POST', url);

    request.files.add(await http.MultipartFile.fromPath("media", imagePath,
        contentType: MediaType("application", 'jpeg')));
    http.StreamedResponse r = await request.send();
    String rawData = await r.stream.transform(utf8.decoder).join();
    Map data = jsonDecode(rawData);
    return data;
  }
}
