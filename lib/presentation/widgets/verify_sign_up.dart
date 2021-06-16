import 'package:flutter/material.dart';
import 'package:news_app/presentation/screens/home_page.dart';
import 'package:news_app/resources/repository.dart';

class VerifySignUp extends StatefulWidget {
  VerifySignUp({Key? key, required this.username, required this.authRepository})
      : super(key: key);

  final AuthRepository authRepository;
  final String username;
  @override
  _VerifySignUpState createState() => _VerifySignUpState();
}

class _VerifySignUpState extends State<VerifySignUp> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    TextEditingController oTPassword = TextEditingController();

    return Scaffold(
      // appBar: AppBar(
      //   title: Text("Flutter"),
      // ),
      body: TextButton(
        onPressed: () {
        
        },
        child: Text("Registerr"),
      ),
    );
  }
}
