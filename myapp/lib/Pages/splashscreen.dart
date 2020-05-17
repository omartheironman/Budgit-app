import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'budgets.dart';
import 'package:myapp/db/DBController.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:io';

class SplashScreen extends StatefulWidget {
  @override
  loginpagestate createState() => new loginpagestate();
}

class loginpagestate extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
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
        vsync: this, duration: new Duration(milliseconds: 900));

    _iconAnimation = new CurvedAnimation(
        parent: _iconAnimationController, curve: Curves.easeInQuad);

    _iconAnimation.addListener(() => this.setState(() {}));
    _iconAnimationController.forward();
    autoLogIn();
  }

  void autoLogIn() async {
    await new Future.delayed(const Duration(seconds: 5));
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
    } else {
      //redirect to login page

    }
  }

  void fetchData(String userID) async {
    //Query the budgets from online and pass it to the next context
    List<Budgets> budgets = new List<Budgets>();
    //var results = await controller.GetBudgets("omarmoharrem");
    await controller.GetBudgets(userID).then((result) {
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

      Navigator.popAndPushNamed(context, '/home', arguments: {
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
                  )
            ],
          ))
        ],
      ),
    );
  }
}
