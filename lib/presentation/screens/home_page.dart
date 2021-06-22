import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/bloc/category_bloc.dart';
import 'package:news_app/bloc/category_event.dart';
import 'package:news_app/bloc/category_state.dart';
import 'package:news_app/bloc/listing_bloc.dart';
import 'package:news_app/bloc/listing_events.dart';
import 'package:news_app/bloc/listing_states.dart';
import 'package:news_app/models/article_model.dart';
import 'package:news_app/models/category_model.dart';
import 'package:news_app/presentation/widgets/bottom_navigator.dart';

import '../widgets/blog_tile.dart';
import '../widgets/category_tile.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);
  final String route = 'homepage';

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<CategoryBloc>(context).add(LoadCategory()); //Testing
    BlocProvider.of<ListingBloc>(context).add(FetchNewsEvent()); //TESTING
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          
          children: <Widget>[
            Text(
              'Flutter',
              style: TextStyle(
                color: Colors.red,
              ),
            ),
            Text(
              'Times',
              style: TextStyle(
                color: Colors.black,
              ),
            ),
          ],
        ),
        elevation: 0,
      ),
      body: Container(
        child: Column(
          children: [
            BlocBuilder<CategoryBloc, CategoryState>(
              // buildWhen: (InitialState, LoadingList) {
              //   return true;
              // },
              builder: (context, state) {
                if (state is LoadedCategory) {
                  List<CategoryModel> categories = state.categories;
                  return

                      //     SizedBox(
                      //   height:400,width:200,
                      Container(
                    height: 90,
                    //    child: Expanded(

                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        physics: AlwaysScrollableScrollPhysics(),
                        // shrinkWrap: true,
                        itemCount: categories.length,
                        itemBuilder: (context, int index) {
                          return CategoryTile(
                              imageurl: categories[index].imageurl,
                              category: categories[index].category);
                        }),
                    //   ),
                  );
                  //    );
                  //     Text('HELLLOIII');

                  // CategoryTile(
                  //     imageurl:
                  //         'https://smeloans.co.uk/assets/media-library/images/hero-test-3-1000.jpg',
                  //     category: 'Tech');
                } else
                  return Center(child: CircularProgressIndicator());
              },
            ),
            SizedBox(
              height: 10,
            ),
            // ///////////////////////////////
            BlocBuilder<ListingBloc, ListingStates>(builder: (context, state) {
              if (state is FetchedNews) {
                List<ArticleModel> articles = state.articles;

                return

                    //     SizedBox(
                    //   height:400,width:200,
                    Expanded(
                  // height: 90,
                  //    child: Expanded(

                  child: ListView.builder(
                      scrollDirection: Axis.vertical,
                      physics: AlwaysScrollableScrollPhysics(),
                      // shrinkWrap: true,
                      itemCount: articles.length,
                      itemBuilder: (context, int index) {
                        return BlogTile(
                          imageurl: articles[index].urlToImage ?? '',
                          title: articles[index].title ?? '',
                          desc: articles[index].description ?? '',
                        );
                      }),
                  //   ),
                );
              } else if (state is FetchErrorState) {
                return Container(
                  height: 200,
                  width: double.infinity,
                  child: Center(
                    child: Text('Sorry,Unable to fetch News'),
                  ),
                );
              } else if (state is ZeroResults) {
                return Container(
                  height: 200,
                  width: double.infinity,
                  child: Center(
                    child: Text(
                        'Sorry,No results found accodring to your search :( '),
                  ),
                );
              } else {
                return Center(child: CircularProgressIndicator());
              }
            })
            //  ),
            //   Text('HELLLOIII'),
          ],
        ),
      ),
    //  bottomNavigationBar: BottomNavigator(),
    );
  }
}
