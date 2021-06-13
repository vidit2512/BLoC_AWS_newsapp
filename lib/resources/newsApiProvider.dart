import 'dart:convert';
import 'package:http/http.dart ' as http;
import 'package:news_app/models/article_model.dart';
import 'package:news_app/models/news_model.dart';

class NewsApiProvider {
  List<ArticleModel> news = [];

  Future<List<ArticleModel>> getNews() async {
    Uri url =
        'https://newsapi.org/v2/everything?q=tesla&from=2021-05-13&sortBy=publishedAt&apiKey=93beb86e24b8499db8c9ce1021068f1e '
            as Uri;
    var response = await http.get(url);
    var jsonData = jsonDecode(response.body);

    if (jsonData['status'] == "ok") {
      news = NewsModel.rawjson(jsonData).articles!;
      return news;
    } else {
      throw Exception('not able to load');
    }
  }
}
