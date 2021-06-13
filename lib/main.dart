import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/presentation/home_page.dart';
import 'package:news_app/resources/repository.dart';

import 'bloc/listing_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
 MyApp({Key? key}) : super(key: key);
 final NewsRepository newsRepository=NewsRepository();
  @override
  Widget build(BuildContext context) {
     

    return BlocProvider(
      create: (context) => ListingBloc(newsRepository: newsRepository),
      child: MaterialApp(
        title: 'Flutter Times',
        theme: ThemeData(
          primaryColor: Colors.white,
        ),
        debugShowCheckedModeBanner: false,
        home: HomePage(),
      ),
    );
  }
}
