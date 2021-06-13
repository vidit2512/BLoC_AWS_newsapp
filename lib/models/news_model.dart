import 'dart:convert';

import 'article_model.dart';

class NewsModel {
  String? status;
  int? totalResults;
  List<ArticleModel>? articles;

  NewsModel(this.status, this.totalResults, this.articles);

  Map<String, dynamic> tojson() {
    return {
      "status": status == null ? null : status,
      "totalResults": totalResults == null ? null : totalResults,
      "articles": articles == null ? null : articles
    };
  }

  factory NewsModel.fromjson(Map<String, dynamic> json) {
    return NewsModel(
      json['status'] == null ? null : json['status'],
      json['totalResults'] == null ? null : json['totalResults'],
      json['articles'] == null
          ? null
          : List<ArticleModel>.from(
              json['articles'].map((x) => {
                    ArticleModel.fromjson(x),
                  }),
            ),
    );
  }

  factory NewsModel.rawjson(String s) {
    return NewsModel.fromjson(jsonDecode(s));
  }

  String torawjson() {
    return jsonEncode(tojson());
  }
}
