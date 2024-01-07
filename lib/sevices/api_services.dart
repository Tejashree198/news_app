import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:news_app/models/article.dart';

class ApiServices {
  final endpointUrl =
      "https://newsapi.org/v2/everything?q=tesla&from=2023-11-27&sortBy=publishedAt&apiKey=cde53355f65948b3b5b9719aaacfbf46";
}

Future<List<Article>> getArticle() async {
  final response = await http.get(Uri.parse(
      'https://newsapi.org/v2/top-headlines? country=us&category=business&apiKey=cde53355f65948b3b5b9719aaacfbf46'));

  if (response.statusCode == 200) {
    Map<String, dynamic> json = jsonDecode(response.body);
    List<dynamic> body = json['articles'];

    List<Article> articles =
        body.map((dynamic item) => Article.fromJson(item)).toList();

    return articles;
  } else {
    throw ("Can't get the articles");
  }
}
