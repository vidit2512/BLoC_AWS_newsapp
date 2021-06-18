import 'dart:convert';

import 'package:intl/intl.dart';

import 'source_model.dart';

class ArticleModel {
  Source? source;
  String? author = " ";
  String? title = " ";
  String? description = " ";
  String? url = " ";
  String? urlToImage = " ";
  DateTime? publishedAt;
  String? content = " ";

  ArticleModel(this.source, this.author, this.title, this.description, this.url,
      this.urlToImage, this.publishedAt, this.content);
  
  

  Map<String, dynamic> tojson() {
    return {
      "source": source == null ? null : source!.tojson(),
      "author": author == null ? null : author,
      "title": title == null ? null : title,
      "description": description == null ? null : description,
      "url": url == null ? null : url,
      "urlToImage": urlToImage == null ? null : urlToImage,
      "publishedAt":
          publishedAt == null ? null : publishedAt!.toIso8601String(),
      "content": content == null ? null : content,
    };
  }

   factory ArticleModel.fromjson(Map<String, dynamic> json) {
    return ArticleModel(
      json['source'] == null ? null : Source.fromjson(json['source']),
      json['author'] == null ? null : json['author'],
      json['title'] == null ? null : json['title'],
      json['description'] == null ? null : json['description'],
      json['url'] == null ? null : json['url'],
      json['urlToImage'] == null ? null : json['urlToImage'],
      json['publishedAt'] == null ? null : DateTime.parse(json["publishedAt"]),
      json['content'] == null ? null : json['content'],
    );
  }


  factory ArticleModel.rawjson(String s) {
    return ArticleModel.fromjson(jsonDecode(s));
  }
  torawjson() {
    return jsonEncode(tojson());
  }

  String getTime() {
    //  assert(publishedAt != null);
    var formatter = new DateFormat('dd MMMM yyyy h:m');

    String formatted = formatter.format(publishedAt!);
    return formatted;
  }

  String getDate() {
    //  assert(publishedAt != null);
    var formatter = new DateFormat('dd MMMM yyyy');

    String formatted = formatter.format(publishedAt!);
    return formatted;
  }
}
