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

//  List<ArticleModel> cnv(Map<String, dynamic> jsonData) {
//       List<ArticleModel> sdf=[];
//       jsonData['articles'].map((x) => {
//             print('assssssssssssppppppppppppppppppp'),
//             print(x.runtimeType),
//             sdf.add(ArticleModel.fromjson(x)),
//             print('zzssssssssssssszzzzzzzzzzzzzzzzzzzzzzz'),
//           });
//       return sdf;
//     }
  factory NewsModel.fromjson(Map<String, dynamic> json) {
    print('asdddddddd');
    //print(json.length);
    //    String? status;
    // int? totalResults;
    // List<ArticleModel>? articles;

    // json.entries.forEach(( value) {
    //   List<ArticleModel>.from(
    //           json['articles'].map((x) => {
    //                 ArticleModel.fromjson(x),
    //               }),
    //         ),
    // if(value.key.toString()=='status')
    // status=value.value;
    //  if(value.key.toString()=='totalResults')
    // totalResults=value.value;
    // List<ArticleModel> sdf = [];
    // json['articles'].map((x) =>  {
    //       print('assssssssssssppppppppppppppppppp'),
    //       print(x.runtimeType),
    //       sdf.add(ArticleModel.fromjson(x)),
    //       print('zzssssssssssssszzzzzzzzzzzzzzzzzzzzzzz'),
    //     });
    print(json['articles']);
    return NewsModel(
      json['status'] == null ? null : json['status'],
      json['totalResults'] == null ? null : json['totalResults'],
      json['articles'] == null ? null :  (json['articles'] as List<dynamic>)
                      .map(
                        (e) => ArticleModel.fromjson(e),
                      )
                      .toList(),
    );
    //  return  NewsModel(status,totalResults,articles);
  }

  factory NewsModel.rawjson(String s) {
    print('bbbbbbbbbbbb');
    return NewsModel.fromjson(jsonDecode(s));
  }

  String torawjson() {
    return jsonEncode(tojson());
  }
}
