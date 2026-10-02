import 'dart:convert';

import 'package:http/http.dart' as http;

import 'api_constants.dart';
import 'end_point.dart';
import 'model/SourceResponse.dart';
import 'model/newsResponse.dart';

//https://newsapi.org/v2/top-headlines/sources?apiKey=e65bd19a99444d6ba207e60f561e4270
//https://newsapi.org/v2/everything?q=bitcoin&apiKey=e65bd19a99444d6ba207e60f561e4270

class ApiManager {
  static Future<SourceResponse> getSources(
    String language,
    String categoryId,
  ) async {
    try {
      Uri url = Uri.https(ApiConstants.serverName, EndPoint.sourcesAPi, {
        "apiKey": ApiConstants.apiKey,
        "language": language,
        "category": categoryId,
      });

      var response = await http.get(url);
      var responseBody = response.body;
      return SourceResponse.fromJson(jsonDecode(response.body));
    } catch (e) {
      rethrow;
    }
  }

  static Future<NewsResponse> getNews(String source_Id, String language) async {
    try {
      Uri url = Uri.https(ApiConstants.serverName, EndPoint.newsAPi, {
        "apiKey": ApiConstants.apiKey,
        "sources": source_Id,
        "language": language,
      });
      var response = await http.get(url);
      var responseBody = response.body;

      return NewsResponse.fromJson(jsonDecode(response.body));
    } catch (e) {
      rethrow;
    }
  }
}
