import 'dart:convert';

import 'models/articles.dart';
import 'package:http/http.dart';

class News {
  Future<List<Article>> getApi() async {
    Response response = await get(Uri.parse(
        "https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=8207e18b9fc34d4ba4cfe769384981e5"));

    if (response.statusCode == 200) {
      Map<String, dynamic> json = jsonDecode(response.body);

      List<dynamic> body = json['articles'];
      List<Article> article = body.map((e) => Article.fromJson(e)).toList();
      return article;
    } else {
      throw ("cant get the articles");
    }
  }
}
