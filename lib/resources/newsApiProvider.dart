import 'dart:convert';
import 'package:http/http.dart ' as http;
import 'package:news_app/models/article_model.dart';
import 'package:news_app/models/news_model.dart';
import 'package:news_app/models/source_model.dart';

class NewsApiProvider {
  List<ArticleModel> news = [];

  Future<List<ArticleModel>> getNews() async {
    var url = Uri.parse(
        'https://newsapi.org/v2/everything?q=tesla&from=2021-05-14&sortBy=publishedAt&apiKey=72c5ed39c7c04c48a2cf105ee3653d56');
    //72c5ed39c7c04c48a2cf105ee3653d56
    //93beb86e24b8499db8c9ce1021068f1e
    var response = await http.get(url);
    // print(respone);
    Map<String, dynamic> jsonData =
        jsonDecode(response.body) as Map<String, dynamic>;

    //    print(jsonData);
    print(jsonData.runtimeType);
    print(jsonData['articles'].runtimeType);
    // Map<String, dynamic> newjsonData;

    // Map<String, dynamic> newjsonData = Map.from(jsonData.map((key, value) {
    //   List<dynamic> values = List.from(value);
    //   return MapEntry(
    //       key.toString(),
    //       values.map((theValue) {
    //         return theValue.toString();
    //       }).toList());
    // }));

    // Map<String, dynamic>.from(jsonData);
    //  List<ArticleModel>chutiya=
    //List<ArticleModel>.from(

    // Source? source = new Source("1", "chirag");
    // // source!.id="1";
    // // source.name="chirag";
    // String? author;
    // String? title;
    // String? description;
    // String? urll;
    // String? urlToImage;
    // DateTime? publishedAt;
    // String? content;

//     (jsonData['articles'] as List<dynamic>)
//         .map((json) => {
// //print('@@@  '+ json['author']),
//    //       ArticleModel(
//      //source,
//     print(  json['source'] == null ? null : Source.fromjson(json['source'])),
//     print(  json['author'] == null ? null : json['author']),
//     print(  json['title'] == null ? null : json['title']),
//     print(  json['description'] == null ? null : json['description']),
//     print(  json['url'] == null ? null : json['url']),
//     print(  json['urlToImage'] == null ? null : json['urlToImage']),
//     print(  json['publishedAt'] == null ? null : DateTime.parse(json["publishedAt"])),
//     print(  json['content'] == null ? null : json['content']),
//     //),

//         //  print(x),
//           print('lllllllllllllllllllllllllllllllllllllllll++++++++++++++++++++++'),
//              // ArticleModel.fromjson(x),

//             })
//         .toList();
    // );
    ///#####################

    // map.forEach((k, v) => {
    //   print('??????/'),
    //   print(k),
    //   print('______'),
    //   print(v),
    // });
    // print(map.runtimeType);
    ArticleModel ard;
    print(jsonData['articles']);
    
      List<ArticleModel> sdf = (jsonData['articles'] as List<dynamic>)
                      .map(
                        (e) => ArticleModel.fromjson(e),
                      )
                      .toList();
    // var mpp = () {
    
    //   print('asdkkkkkkkkkkkkkkkkkkkkkkkkdddd');
    //   print(jsonData['articles'].length);
    //   jsonData['articles'].map((x) => {
    //         print('assssssssssssppppppppppppppppppp'),
    //         print(x.runtimeType),
    //         ard = ArticleModel.fromjson(x),
    //         print(ard.author),
    //         sdf.add(ard),
    //         print('zzssssssssssssszzzzzzzzzzzzzzzzzzzzzzz'),
    //       });
    //   return sdf;
    // };
    var simple = () {
      print('asddddd');
    };
    print(simple());
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
      print(news);
      return news;
    } else {
      throw Exception('not able to load');
    }
  }
}
