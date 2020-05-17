import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'budgets.dart';
import 'package:myapp/db/DBController.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignIn extends StatefulWidget {
  @override
  loginpagestate createState() => new loginpagestate();
}

class loginpagestate extends State<SignIn> with SingleTickerProviderStateMixin {
  AnimationController _iconAnimationController;
  Animation<double> _iconAnimation;
  final Dbcontroller controller = new Dbcontroller();


  FacebookLogin fbLogin = new FacebookLogin();
  bool isLoggedIn = false;
  String name = '';


  @override
  void initState() {
    super.initState();

    _iconAnimationController = new AnimationController(
        vsync: this, duration: new Duration(milliseconds: 300));

    _iconAnimation = new CurvedAnimation(
        parent: _iconAnimationController, curve: Curves.easeInQuad);

    _iconAnimation.addListener(() => this.setState(() {}));
    _iconAnimationController.forward();
    autoLogIn();
  }

  void autoLogIn() async {
    print("IN AUTO LOGIN");
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String userId = prefs.getString('user');

    if (userId != null) {
      setState(() {
        isLoggedIn = true;

        fetchData(userId);
        name = userId;

        print("Found username");
        print(name);
      });
      return;
    }
  }

  void fetchData(String userID) async {
    //Query the budgets from online and pass it to the next context
    List<Budgets> budgets = new List<
        Budgets>();
    //var results = await controller.GetBudgets("omarmoharrem");
    await controller.GetBudgets(userID)
        .then((result) {
      // print(result["Budgets"]);

      Cash cashInHand = new Cash();
      cashInHand.cashValue = "0.0";
      if (result["Budgets"] != null) {
        budgets = result["Budgets"];
      }
      if (result["Allocation"] != null) {
        cashInHand = result["Allocation"];
      }
      print("Cash From DB");
      print(cashInHand.cashValue);

      Navigator.popAndPushNamed(context, '/home',
          arguments: {
            "budgets": budgets,
            "cash": cashInHand,
            "userId": userID
          });

      //setState(() {
      // print(result);
      //});
    });

//    Cash cashInHand = new Cash();
//    cashInHand.cashValue = "0.0";
//    Navigator.popAndPushNamed(context, '/home',
//        arguments: {
//          "budgets": budgets,
//          "cash": cashInHand
//        });


    return;
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Color.fromRGBO(243, 53, 53, 1.0),
      body: new Stack(
        fit: StackFit.expand,
        children: <Widget>[
//            new Image(
//              image: new AssetImage("Assets/facebook_profile_image.png"),
//              fit: BoxFit.cover,
//              color: Colors.red,
//              colorBlendMode: BlendMode.lighten,
//            ),
          SingleChildScrollView(
              child: new Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                      padding: const EdgeInsets.fromLTRB(10, 50, 20, 80),
                      child: new Image(
                        image: new AssetImage("Assets/logo.png"),
                        width: _iconAnimation.value * 200,
                        height: _iconAnimation.value * 200,
                        color: null,
                        //fit: BoxFit.scaleDown,
                        alignment: Alignment.center,
                      )

//                child: new FlutterLogo(
//                  size: _iconAnimation.value * 100,
//
//                ),
                  ),
                  new Form(
                      child: Theme(
                        data: new ThemeData(
                            brightness: Brightness.light,
                            primarySwatch: Colors.teal,
                            inputDecorationTheme: new InputDecorationTheme(
                                labelStyle: new TextStyle(
                                  color: Colors.teal,
                                  fontSize: 12.0,
                                ))),
                        child: Container(
                          padding: const EdgeInsets.all(10),
                          child: new Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              new TextFormField(
                                  decoration: const InputDecoration(
                                    labelText: 'Enter Email',
                                    enabledBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(color: Colors.white),
                                    ),
                                    labelStyle: TextStyle(
                                        letterSpacing: 2.0,
                                        fontSize: 18.0,
                                        color: Colors.white),
                                  ),

                                  keyboardType: TextInputType.emailAddress,
                                  style: TextStyle(
                                    fontSize: 14.0,
                                    color: Colors.black,
                                  )),
                              new TextFormField(
                                  decoration: const InputDecoration(
                                    labelText: 'Enter Password',
                                    enabledBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(color: Colors.white),
                                    ),
                                    labelStyle: TextStyle(
                                        letterSpacing: 2.0,
                                        fontSize: 18.0,
                                        color: Colors.white),
                                  ),
                                  //keyboardType: TextInputType.text,
                                  obscureText: true,
                                  style: TextStyle(
                                    fontSize: 14.0,
                                    color: Colors.black,
                                  )),
                              new Padding(
                                padding: const EdgeInsets.only(bottom: 5.0, top: 10),
                              ),

                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: <Widget>[
                                  new RaisedButton(
                                      child: new Text("Sign In"),
                                      color: Colors.white,
                                      onPressed: () async {
                                        final SharedPreferences prefs = await SharedPreferences
                                            .getInstance();
                                        final String userId = prefs.getString(
                                            'user');

                                        if (userId != null) {
                                          setState(() {
                                            isLoggedIn = true;

                                            name = userId;

                                            print("Found username");
                                            print(name);
                                            fetchData(name);
                                          });
                                          return;
                                        }


                                      }),
                                  new RaisedButton(
                                    child: new Text("Sign Up"),
                                    color: Colors.white,
                                    onPressed: () {},
                                  ),
                                ],
                              ),
//                        RaisedButton(
//                          onPressed: () {},
//                          child: const Text(
//                              'Login',
//                              style: TextStyle(fontSize: 20)
//                          ),
//                        ),
                              Divider(),
                              SignInButton(
                                Buttons.Facebook,
                                mini: false,
                                onPressed: () async {
                                  SharedPreferences prefs = await SharedPreferences
                                      .getInstance();

                                  //Query local storage for the token


                                  final facebookLoginResult = await fbLogin
                                      .logInWithReadPermissions(
                                      ['email', 'public_profile']);
                                  FacebookAccessToken myToken = facebookLoginResult
                                      .accessToken;

                                  ///assuming sucess in FacebookLoginStatus.loggedIn
                                  /// we use FacebookAuthProvider class to get a credential from accessToken
                                  /// this will return an AuthCredential object that we will use to auth in firebase
                                  AuthCredential credential = FacebookAuthProvider
                                      .getCredential(
                                      accessToken: myToken.token);


                                  // this line do auth in firebase with your facebook credential.
                                  FirebaseUser firebaseUser = (
                                      await FirebaseAuth.instance
                                          .signInWithCredential(credential)
                                  ).user;
                                  print("TOKEEEN ########## " +
                                      myToken.token.toString());


                                  print(firebaseUser.uid);
                                  prefs.setString("user", firebaseUser.uid);
                                  fetchData(firebaseUser.uid);
                                  //Pass to next view the username;


                                },
                              ),
                              Divider(),
                              SignInButton(
                                Buttons.Google,
                                mini: false,
                                onPressed: () {},
                              )
                            ],
                          ),
                        ),
                      ))
                ],
              ))
        ],
      ),
    );
  }
}
