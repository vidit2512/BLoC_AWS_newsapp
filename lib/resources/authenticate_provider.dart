import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_flutter/amplify.dart';
//import 'package:flutter/material.dart';
//import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
//import 'package:amplify_flutter/amplify.dart';
import 'package:news_app/models/user_model.dart';

import '../amplifyconfiguration.dart';

class AuthencticateProvider {
  bool isSignUpComplete = false;
  bool isSignedIn = false;
  //  bool _amplifyConfigured = false;

  Future<String> registerUser(UserModel data) async {
    try {
      Map<String, String> userAttributes = {
        "email": data.email!,
      };
      SignUpResult res = await Amplify.Auth.signUp(
          username: data.username,
          password: data.password,
          options: CognitoSignUpOptions(userAttributes: userAttributes));

      //  setState(() {
      isSignUpComplete = res.isSignUpComplete;
      //     if(isSignUpComplete)
      //     {
      // res = await Amplify.Auth.confirmSignUp(
      //   username: 'myusername',
      //   confirmationCode: '123456'
      // );
      // isSignUpComplete = res.isSignUpComplete;
      //     }
      print("Sign up: " + (isSignUpComplete ? "Complete" : "Not Complete"));
      return isSignUpComplete.toString(); //expppp
      //});
    } on AuthException catch (e) {
      print(e);
      return "Register Error: " + e.toString();
    }
  }

  Future<String> signIn(UserModel data) async {
    try {
      SignInResult res = await Amplify.Auth.signIn(
        username: data.username,
        password: data.password,
      );
      // setState(() {
      isSignedIn = res.isSignedIn;
      //});

      // if (isSignedIn)

      //   Alert(context: context, type: AlertType.success, title: "Login Success")
      //       .show();
      return isSignedIn.toString();
    } on AuthException catch (e) {
      print(e);
      // Alert(context: context, type: AlertType.error, title: "Login Failed")
      //     .show();
      return 'Log In Error: ' + e.toString();
    }
  }

  void signout() async {
    try {
      Amplify.Auth.signOut();
    } on AuthException catch (e) {
      print(e.message);
    }
  }

  Future<String> confirmSignUp(String username, String otp) async {
    try {
     // isSignUpComplete = false;
      SignUpResult res = await Amplify.Auth.confirmSignUp(
          username: username, confirmationCode: otp);
      // setState(() {
      isSignUpComplete = res.isSignUpComplete;
      return isSignUpComplete.toString();
      // });
    } on AuthException catch (e) {
      print(e.message);
      return e.toString();
     // throw e;
    }
  }

  //  void configureAmplify() async {
  //   if (! _amplifyConfigured) return;

  //   // add all of the plugins we are currently using
  //   // in our case... just one - Auth
  //   AmplifyAuthCognito authPlugin = AmplifyAuthCognito();
  //   Amplify.addPlugin(authPlugin);

  //   await Amplify.configure(amplifyconfig);
  //   try {
  //  //   setState(() {
  //       _amplifyConfigured = true;
  //    // });
  //   } catch (e) {
  //     print(e);
  //   }
  // }
  
}
