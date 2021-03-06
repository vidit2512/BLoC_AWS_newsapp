//import 'package:fintech/screens/register_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_login/flutter_login.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:news_app/bloc/category_bloc.dart';
import 'package:news_app/bloc/listing_bloc.dart';
import 'package:news_app/bloc/listing_states.dart';
import 'package:news_app/models/user_model.dart';
import 'package:news_app/presentation/widgets/verify_sign_up.dart';
import 'package:news_app/resources/authenticate_provider.dart';
import 'package:news_app/resources/repository.dart';

import 'home_page.dart';
import 'login_page.dart';

class RegisterPage extends StatefulWidget {
  RegisterPage({Key? key, required this.authRepository}) : super(key: key);

  final AuthRepository authRepository;
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  // AuthRepository authRepository=widget.authRepository;
  String? username, email;
  UserModel user = UserModel();
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  final GlobalKey<FormState> _formkey2 = GlobalKey<FormState>();

  TextEditingController password = TextEditingController();
  TextEditingController confirmpassword = TextEditingController();
  TextEditingController oTPassword = TextEditingController();

  //get authRepository => null;
  @override
  void dispose() {
    // Clean up the controller when the widget is removed from the
    // widget tree.
    password.dispose();
    confirmpassword.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var category__bloc = BlocProvider.of<CategoryBloc>(context);
    var listing__bloc = BlocProvider.of<ListingBloc>(context);

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
              //#############
              // BlocListener<ListingBloc,ListingStates>(
              //   listener:(context,state)
              //   {
              //     if(state is showAlertState)

              //   }

              // ),

              //###################
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
                      onPressed: () async {
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

                          String asss = await widget.authRepository
                              .register(user); //EXp...........
                          print(asss);
                          print('gggggggggggggg');
 NewsRepository
                                                            newsRepository =
                                                            NewsRepository();
                          //#######################

                          // MultiBlocListener
                          showDialog(
                              context: context,
                              builder: (BuildContext context2) {
                                return BlocProvider(
                                  create: (context) => ListingBloc(
                                      newsRepository: newsRepository),
                                  child: BlocProvider(
                                    create: (context) => CategoryBloc(),
                                    child: AlertDialog(
                                      content: Stack(
                                        clipBehavior: Clip.none,
                                        children: <Widget>[
                                          Positioned(
                                            right: -40.0,
                                            top: -40.0,
                                            child: InkResponse(
                                              onTap: () {
                                                Navigator.of(context2).pop();
                                              },
                                              child: CircleAvatar(
                                                child: Icon(Icons.close),
                                                backgroundColor:
                                                    Colors.grey[350],
                                              ),
                                            ),
                                          ),
                                          Form(
                                            key: _formkey2,
                                            child: Column(
                                              mainAxisSize: MainAxisSize.min,
                                              children: <Widget>[
                                                Padding(
                                                  padding: EdgeInsets.all(8.0),
                                                  child: TextFormField(
                                                    keyboardType:
                                                        TextInputType.number,
                                                    obscureText: true,
                                                    controller: oTPassword,
                                                    decoration: InputDecoration(
                                                      border:
                                                          OutlineInputBorder(),
                                                      labelText:
                                                          'One Time Password',
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
                                                // Padding(
                                                //   padding: EdgeInsets.all(8.0),
                                                //   child: TextFormField(),
                                                // ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  child: TextButton(
                                                    child: Text("Submit"),
                                                    onPressed: () {
                                                      if (_formkey2
                                                          .currentState!
                                                          .validate()) {
                                                        _formkey2.currentState!
                                                            .save();

                                                        widget.authRepository
                                                            .verify(
                                                                username!,
                                                                oTPassword
                                                                    .text);

                                                        /////////////////////
                                                        widget.authRepository
                                                            .signout(); //EXp
                                                       

                                                        Navigator.push(
                                                            context2,
                                                            //(
                                                            //     context, 'homepage');
                                                            MaterialPageRoute(
                                                              builder: (_) =>
                                                                  // BlocBuilder(builder: builder)
                                                                  BlocProvider<
                                                                      ListingBloc>(
                                                                create: (context) =>
                                                                    ListingBloc(
                                                                        newsRepository:
                                                                            newsRepository),
                                                                //category__bloc,
                                                                child: BlocProvider<
                                                                    CategoryBloc>(
                                                                  create: (context) =>
                                                                      CategoryBloc(),

                                                                  child:
                                                                      HomePage(),

                                                                  //     builder: (context)=> HomePage(),
                                                                ),
                                                              ),
                                                            ));

                                                        // (
                                                        //     context,
                                                        //     MaterialPageRoute(
                                                        //         builder: (context) => HomePage()));
                                                      }
                                                    },
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              });

                          //   /////////////////////
                          //    widget.authRepository.signout(); //EXp
                          //   // if
                          //   Navigator.push(
                          //       context,
                          //       MaterialPageRoute(
                          //           builder: (context) => HomePage()));
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
                              builder: (_) => LoginPage(
                                  authRepository: widget.authRepository),
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
