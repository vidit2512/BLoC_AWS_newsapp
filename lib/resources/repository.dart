import 'package:news_app/models/article_model.dart';

import 'newsApiProvider.dart';

class NewsRepository {
  NewsApiProvider _newsApiProvider = NewsApiProvider();

  Future<List<ArticleModel>> fetchingNews() async =>
    _newsApiProvider.getNews();

  
}
