// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:news_app/bloc/category_bloc.dart';
// import 'package:news_app/presentation/screens/home_page.dart';
// //import 'package:news_app/presentation/widgets/blog_tile.dart';
// import 'package:news_app/resources/repository.dart';
// import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
// import 'package:amplify_core/amplify_core.dart';

// import 'amplifyconfiguration.dart';
// //import 'package:flutter/material.dart';
// // import 'package:amplify_flutter/amplify.dart';
// // import 'package:amplify_analytics_pinpoint/amplify_analytics_pinpoint.dart';
// //import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
// //import 'amplifyconfiguration.dart';

//  import 'bloc/listing_bloc.dart';
// // @dart=2.9
// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//  MyApp({Key? key}) : super(key: key);
//  final NewsRepository newsRepository=NewsRepository();

//  bool _amplifyConfigured=false;
//   Amplify amplifyInstance = Amplify();

//   @override
//   Widget build(BuildContext context) {

//     return MultiBlocProvider(
//       providers: [
//         BlocProvider<ListingBloc>
//                (create: (context) => ListingBloc(newsRepository: newsRepository),),

//       BlocProvider<CategoryBloc>
//                (create: (context) => CategoryBloc(),),

//       ],

//       child: MaterialApp(
//         title: 'Flutter Times',
//         theme: ThemeData(
//           primaryColor: Colors.white,
//         ),
//         debugShowCheckedModeBanner: false,
//         home: HomePage(),
//         // home:BlogTile(title: 'my name is vidit', desc: 'aaadmvfkvifovunfnvufdvnfduvfdnvn', imageurl: 'https://smeloans.co.uk/assets/media-library/images/hero-test-3-1000.jpg'),
//       ),
//     );
//   }
// }

// // void main() {
// //   runApp(MyApp());
// // }

// // class MyApp extends StatefulWidget {
// //   @override
// //   _MyAppState createState() => _MyAppState();
// // }

// // class _MyAppState extends State<MyApp> {
// //   bool _amplifyConfigured = false;

// //   @override
// //   void initState() {
// //     super.initState();
// //     _configureAmplify();
// //   }

// //   void _configureAmplify() async {
// //   }

// //   void _recordEvent() async {
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     return MaterialApp(
// //       home: Scaffold(
// //           appBar: AppBar(
// //             title: const Text('Amplify Core example app'),
// //           ),
// //           body: ListView(padding: EdgeInsets.all(10.0), children: <Widget>[
// //             Center(
// //               child: Column (
// //                 children: [
// //                   const Padding(padding: EdgeInsets.all(5.0)),
// //                   Text(
// //                     _amplifyConfigured ? 'configured' : 'not configured'
// //                   ),
// //                   ElevatedButton(
// //                     onPressed: _amplifyConfigured ? _recordEvent : null,
// //                     child: const Text('record event')
// //                   )
// //                 ]
// //               ),
// //             )
// //           ])
// //       )
// //     );
// //   }
// // }

///////////////////////////////////////////////////////////////////////////////////
///
// @dart=2.9
// Amplify Flutter Packages
import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_flutter/amplify.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_login/flutter_login.dart';
import 'package:news_app/presentation/screens/register_page.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

import 'amplifyconfiguration.dart';
import 'bloc/category_bloc.dart';
import 'bloc/listing_bloc.dart';
import 'models/user_model.dart';
import 'presentation/screens/login_page.dart';
import 'resources/repository.dart';

void main() {
  runApp(MaterialApp(
    home: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // gives our app awareness about whether we are succesfully connected to the cloud
  bool _amplifyConfigured = false;
  AuthRepository authRepository = AuthRepository();

  // Instantiate Amplify
  // final amplifyInstance = Amplify();

  // controllers for text input
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  bool isSignUpComplete = false;
  bool isSignedIn = false;

  @override
  void initState() {
    super.initState();

    // amplify is configured on startup
    _configureAmplify();
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is removed from the
    // widget tree.
    emailController.dispose();
    passwordController.dispose();

    super.dispose();
  }

  void _configureAmplify() async {
    if (!mounted) return;

    // add all of the plugins we are currently using
    // in our case... just one - Auth
    AmplifyAuthCognito authPlugin = AmplifyAuthCognito();
    Amplify.addPlugin(authPlugin);

    await Amplify.configure(amplifyconfig);
    try {
      setState(() {
        _amplifyConfigured = true;
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    final NewsRepository newsRepository = NewsRepository();
    return MultiBlocProvider(
      providers: [
        BlocProvider<ListingBloc>(
          create: (context) => ListingBloc(newsRepository: newsRepository),
        ),
        BlocProvider<CategoryBloc>(
          create: (context) => CategoryBloc(),
        ),
      ],
      
      child: MaterialApp(
       
        title: 'Flutter Times',
        theme: ThemeData(
          primaryColor: Colors.white,
        ),
        debugShowCheckedModeBanner: false,
        home: LoginPage(authRepository:authRepository),
        // home:BlogTile(title: 'my name is vidit', desc: 'aaadmvfkvifovunfnvufdvnfduvfdnvn', imageurl: 'https://smeloans.co.uk/assets/media-library/images/hero-test-3-1000.jpg'),
      ),
    );
  }
}
