//import 'package:fintech/screens/register_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_login/flutter_login.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:news_app/models/user_model.dart';
import 'package:news_app/resources/authenticate_provider.dart';
import 'package:news_app/resources/repository.dart';

import 'home_page.dart';
import 'register_page.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key? key, required this.authRepository}) : super(key: key);
 final AuthRepository authRepository;
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String? username;
  UserModel user = UserModel();
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  TextEditingController password = TextEditingController();
  // TextEditingController confirmpassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login Page'),
      ),
      backgroundColor: Colors.white,
      body: Form(
        key: _formkey,
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 30,
              ),
              Center(
                child: Text(
                  'Welcome, Please Login',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Padding(
                padding: EdgeInsets.all(10),
                child: TextFormField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'User Name',
                      hintText: 'handle'),
                  validator: (String? value) {
                    if (value!.isEmpty) {
                      return 'Please Enter user name';
                    }
                    return null;
                  },
                  onSaved: (String? value) {
                    username = value;
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.all(10),
                child: TextFormField(
                  obscureText: true,
                  controller: password,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Password',
                    hintText: '******',
                  ),
                  validator: (String? value) {
                    if (value!.isEmpty) {
                      return 'Please Enter a Password';
                    }
                    return null;
                  },
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Align(
                alignment: Alignment.centerRight,
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Container(
                    height: 40,
                    width: 190,
                    decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(5)),
                    child: TextButton(
                      onPressed: () {
                        _formkey.currentState!.save();
                        if (_formkey.currentState!.validate()) {
                          print('successful');
                          // user.email = email;
                          user.password = password.text;
                          user.username = username;
                          print(user.email);
                          print(user.password);
                          print(user.username);
                          assert(
                              //user.email != null &&
                              user.password != null && user.username != null);
                          widget.authRepository.login(user);

                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => HomePage()));
                        }
                      },
                      child: Text(
                        'Login',
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              SignInButton(
                Buttons.Google,
                onPressed: () {},
              ),
              SizedBox(
                height: 10,
              ),
              SignInButton(
                Buttons.Facebook,
                onPressed: () {},
              ),
              SizedBox(
                height: 10,
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.all(5),
                  child: Container(
                    height: 35,
                    width: 220,
                    decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(1)),
                    child: TextButton(
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (_) => RegisterPage( authRepository:widget.authRepository,),));
                      },
                      child: Text(
                        'Register',
                        style: TextStyle(color: Colors.white, fontSize: 17),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
