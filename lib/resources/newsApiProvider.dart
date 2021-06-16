import 'dart:convert';
import 'package:http/http.dart ' as http;
import 'package:news_app/models/article_model.dart';
import 'package:news_app/models/news_model.dart';
import 'package:news_app/models/source_model.dart';

class NewsApiProvider {
  List<ArticleModel> news = [];

  Future<List<ArticleModel>> getNews() async {
    var url = Uri.parse(
        'https://newsapi.org/v2/everything?q=tesla&from=2021-05-16&sortBy=publishedAt&apiKey=93beb86e24b8499db8c9ce1021068f1e');
    //72c5ed39c7c04c48a2cf105ee3653d56
    //93beb86e24b8499db8c9ce1021068f1e
    var response = await http.get(url);
    // print(respone);
    Map<String, dynamic> jsonData =
        jsonDecode(response.body) as Map<String, dynamic>;

    //    print(jsonData);
    print(jsonData.runtimeType);
    print(jsonData['articles'].runtimeType);

    ArticleModel ard;
    print(jsonData['articles']);

    List<ArticleModel> sdf = (jsonData['articles'] as List<dynamic>)
        .map(
          (e) => ArticleModel.fromjson(e),
        )
        .toList();

    //  List<ArticleModel> sdf = mpp();
    sdf.forEach((x) => {
          print('bgggggg'),
          print(x.author),
        });
    print(sdf.length);
    print('chiraggggggggggggg');
    // print(jsonData.runtimeType);
    if (jsonData['status'] == "ok") {
      print('@@@@@@@@');
      news = NewsModel.rawjson(response.body).articles!;
      List<ArticleModel> safenews=[];
      news.forEach((el) {
        if (el.author != null &&
            el.content != null &&
            //el.publishedAt != null &&
            //el.source != null &&
            //el.source!.id != null &&
            //el.source!.name != null &&
            el.title != null &&
            //el.url != null &&
            el.urlToImage != null
            ) safenews.add(el);
        print(el);
        print('////////');
      });
      print(news);
      return safenews;
    } else {
      throw Exception('not able to load');
    }
  }

 Future<List<ArticleModel>> getCategoryNews(String category) async {
    var url = Uri.parse(
        'https://newsapi.org/v2/everything?q='+category+'&from=2021-05-15&sortBy=publishedAt&apiKey=72c5ed39c7c04c48a2cf105ee3653d56');
    //72c5ed39c7c04c48a2cf105ee3653d56
    //93beb86e24b8499db8c9ce1021068f1e
    var response = await http.get(url);
    // print(respone);
    Map<String, dynamic> jsonData =
        jsonDecode(response.body) as Map<String, dynamic>;

    //    print(jsonData);
    print(jsonData.runtimeType);
    print(jsonData['articles'].runtimeType);

    ArticleModel ard;
    print(jsonData['articles']);

    List<ArticleModel> sdf = (jsonData['articles'] as List<dynamic>)
        .map(
          (e) => ArticleModel.fromjson(e),
        )
        .toList();

    //  List<ArticleModel> sdf = mpp();
    sdf.forEach((x) => {
          print('bgggggg'),
          print(x.author),
        });
    print(sdf.length);
    print('chiraggggggggggggg');
    // print(jsonData.runtimeType);
    if (jsonData['status'] == "ok") {
      print('@@@@@@@@');
      news = NewsModel.rawjson(response.body).articles!;
      List<ArticleModel> safenews=[];
      news.forEach((el) {
        if (el.author != null &&
            el.content != null &&
            //el.publishedAt != null &&
            //el.source != null &&
            //el.source!.id != null &&
            //el.source!.name != null &&
            el.title != null &&
            //el.url != null &&
            el.urlToImage != null
            ) safenews.add(el);
        print(el);
        print('////////');
      });
      print(news);
      return safenews;
    } else {
      throw Exception('not able to load');
    }
  }


}

