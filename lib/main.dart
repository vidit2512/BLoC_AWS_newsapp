import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/bloc/category_bloc.dart';
import 'package:news_app/presentation/home_page.dart';
import 'package:news_app/presentation/widgets/blog_tile.dart';
import 'package:news_app/resources/repository.dart';
//import 'package:flutter/material.dart';
// import 'package:amplify_flutter/amplify.dart';
// import 'package:amplify_analytics_pinpoint/amplify_analytics_pinpoint.dart';
//import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
//import 'amplifyconfiguration.dart';

 import 'bloc/listing_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
 MyApp({Key? key}) : super(key: key);
 final NewsRepository newsRepository=NewsRepository();
  @override
  Widget build(BuildContext context) {
     


    return MultiBlocProvider(
      providers: [
        BlocProvider<ListingBloc>
               (create: (context) => ListingBloc(newsRepository: newsRepository),),

      BlocProvider<CategoryBloc>
               (create: (context) => CategoryBloc(),),

      ],
    
      child: MaterialApp(
        title: 'Flutter Times',
        theme: ThemeData(
          primaryColor: Colors.white,
        ),
        debugShowCheckedModeBanner: false,
        home: HomePage(),
        // home:BlogTile(title: 'my name is vidit', desc: 'aaadmvfkvifovunfnvufdvnfduvfdnvn', imageurl: 'https://smeloans.co.uk/assets/media-library/images/hero-test-3-1000.jpg'),
      ),
    );
  }
}


// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatefulWidget {
//   @override
//   _MyAppState createState() => _MyAppState();
// }

// class _MyAppState extends State<MyApp> {
//   bool _amplifyConfigured = false;

//   @override
//   void initState() {
//     super.initState();
//     _configureAmplify(); 
//   }

//   void _configureAmplify() async {
//   }

//   void _recordEvent() async {
//   }

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//           appBar: AppBar(
//             title: const Text('Amplify Core example app'),
//           ),
//           body: ListView(padding: EdgeInsets.all(10.0), children: <Widget>[
//             Center( 
//               child: Column (
//                 children: [
//                   const Padding(padding: EdgeInsets.all(5.0)),
//                   Text(
//                     _amplifyConfigured ? 'configured' : 'not configured'
//                   ),                  
//                   ElevatedButton(
//                     onPressed: _amplifyConfigured ? _recordEvent : null,
//                     child: const Text('record event')
//                   )
//                 ]
//               ),
//             )
//           ])
//       )
//     );
//   }
// }
