//import 'package:fintech/screens/register_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_login/flutter_login.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:news_app/models/user_model.dart';
import 'package:news_app/resources/authenticate_provider.dart';
import 'package:news_app/resources/repository.dart';

import 'home_page.dart';
import 'login_page.dart';

class RegisterPage extends StatefulWidget {
  RegisterPage({Key? key,required this.authRepository}) : super(key: key);
 
  final AuthRepository authRepository;
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {

    // AuthRepository authRepository=widget.authRepository;
  String? username, email;
  UserModel user = UserModel();
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  TextEditingController password = TextEditingController();
  TextEditingController confirmpassword = TextEditingController();

  //get authRepository => null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('RegisterPage'),
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
                  'Welcome',
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
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Email ID',
                      hintText: 'abc@xyz.com'),
                  validator: (String? value) {
                    if (value!.isEmpty) {
                      return 'Please Enter';
                    }

                    if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
                        .hasMatch(value)) {
                      return 'Please Enter valid Email ID';
                    }
                  },
                  onSaved: (String? value) {
                    email = value;
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
              Padding(
                padding: EdgeInsets.all(10),
                child: TextFormField(
                  obscureText: true,
                  controller: confirmpassword,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Confirm Password',
                    hintText: '******',
                  ),
                  validator: (String? value) {
                    if (value!.isEmpty)
                      return 'Please retype password';
                    else if (password.text != confirmpassword.text)
                      return 'Password didnt match';
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
                          user.email = email;
                          user.password = password.text;
                          user.username = username;
                          print(user.email);
                          print(user.password);
                          print(user.username);
                          assert(user.email != null &&
                              user.password != null &&
                              user.username != null);

                         widget.authRepository.register(user);

                          /////////////////////
                           widget.authRepository.signout(); //EXp
                          // if
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => HomePage()));
                        }
                      },
                      child: Text(
                        'Register',
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
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) =>
                                  LoginPage(authRepository:widget.authRepository),
                            ));
                      },
                      child: Text(
                        'Login',
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
