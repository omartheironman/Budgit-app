import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'budgets.dart';
import 'package:myapp/db/DBController.dart';

class SignIn extends StatefulWidget {
  @override
  loginpagestate createState() => new loginpagestate();
}

class loginpagestate extends State<SignIn> with SingleTickerProviderStateMixin {
  AnimationController _iconAnimationController;
  Animation<double> _iconAnimation;
  final Dbcontroller controller = new Dbcontroller();

  @override
  void initState() {
    super.initState();

    _iconAnimationController = new AnimationController(
        vsync: this, duration: new Duration(milliseconds: 500));

    _iconAnimation = new CurvedAnimation(
        parent: _iconAnimationController, curve: Curves.bounceOut);

    _iconAnimation.addListener(() => this.setState(() {}));
    _iconAnimationController.forward();
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

                          //keyboardType: TextInputType.emailAddress,
                          style: TextStyle(
                            fontSize: 14.0,
                            color: Colors.black,
                          )),
                      new TextFormField(
                          decoration: const InputDecoration(
                            labelText: 'Enter Name',
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                            ),
                            labelStyle: TextStyle(
                                letterSpacing: 2.0,
                                fontSize: 18.0,
                                color: Colors.white),
                          ),
                          //keyboardType: TextInputType.text,
                          obscureText: false,
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
                              child: new Text("LogIn"),
                              color: Colors.white,
                              onPressed: () async {
                                //Query the budgets from online and pass it to the next context

                                //var results = await controller.GetBudgets("omarmoharrem");
                                await controller.GetBudgets("omarmoharrem")
                                    .then((result) {
                                  // print(result["Budgets"]);
                                  List<Budgets> budgets = result["Budgets"];
                                  Cash cashInHand = result["Allocation"];
                                  print(cashInHand.cashValue);

                                  Navigator.pushNamed(context, '/home',
                                      arguments: {
                                        "budgets": budgets,
                                        "cash": cashInHand.cashValue
                                      });

                                  //setState(() {
                                    // print(result);
                                  //});
                                });

                                //Cash cashInHand = new Cash(cashValue: "0");
                                //Navigator.pushNamed(context, '/home', arguments: {"budgets": budgets, "cash": cashInHand});
                                // arguments: {"budgets": this.budgets, "cash": this.cashInHand});
                              }),
                          new RaisedButton(
                            child: new Text("SignUp"),
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
                        onPressed: () {
                          //We should fetch
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
