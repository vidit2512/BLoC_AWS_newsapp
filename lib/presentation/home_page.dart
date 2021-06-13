import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/bloc/listing_bloc.dart';
import 'package:news_app/bloc/listing_events.dart';
import 'package:news_app/bloc/listing_states.dart';
import 'package:news_app/models/article_model.dart';
import 'package:news_app/models/category_model.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<ListingBloc>(context).add(CategoryListing()); //Testing
    BlocProvider.of<ListingBloc>(context).add(FetchNewsEvent()); //TESTING
    return Scaffold(
      appBar: AppBar(
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
            BlocBuilder<ListingBloc, ListingStates>(
              builder: (context, state) {
                if (state is LoadingList) {
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

            ///////////////////////////////
            BlocBuilder<ListingBloc, ListingStates>(builder: (context, state) {
              if (state is FetchedNews) {
                List<ArticleModel> articles = state.articles;
                return

                    //     SizedBox(
                    //   height:400,width:200,
                    Container(
                  // height: 90,
                  //    child: Expanded(

                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      physics: AlwaysScrollableScrollPhysics(),
                      // shrinkWrap: true,
                      itemCount: articles.length,
                      itemBuilder: (context, int index) {
                        return BlogTile(
                          imageurl: articles[index].url!,
                          title: articles[index].title!,
                          desc: articles[index].description!,
                        );
                      }),
                  //   ),
                );
              } else if (state is ErrorState) {
                return Card(child: Center(child: Text('Sorry,Unable to fetch News'),),);
              } else {
                return Center(child: CircularProgressIndicator());
              }
            })
            //  ),
            //   Text('HELLLOIII'),
          ],
        ),
      ),
    );
  }
}

class CategoryTile extends StatelessWidget {
  const CategoryTile({Key? key, required this.imageurl, required this.category})
      : super(key: key);
  final String imageurl, category;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 5.0),
      child: Container(
        child: Stack(
          children: [
            Center(
              child: Container(
                height: 90,
                width: 120,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(9),
                  child: Image.network(
                    imageurl,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Center(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(9)),
                  color: Colors.black38,
                ),
                height: 90,
                width: 120,
                child: Center(
                  child: Text(
                    category,
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class BlogTile extends StatelessWidget {
  const BlogTile(
      {Key? key,
      required this.title,
      required this.desc,
      required this.imageurl})
      : super(key: key);
  final String title, desc, imageurl;
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          Image.network(imageurl),
          Text(title),
          Text(desc),
        ],
      ),
    );
  }
}
