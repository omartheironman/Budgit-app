import 'package:flutter/material.dart';
import 'budgets.dart';
import 'AddBudget.dart';
import 'NewBudget.dart';
import 'login.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:myapp/db/DBController.dart';
class Home extends StatefulWidget {
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {


  Cash cashInHand;
  String userId;

  double TotalSpent = 0.0;
  //Fetch all the budgets from the database ...
  List<Budgets> budgets = [
//        Budgets(text:'Shopping',value:'500'),
//        Budgets(text:'Car',value:'200'),
//        Budgets(text:'Dog',value:'300'),
  ];


  //Cash  cashInHand = mapdata['cash'];

  @override
  Widget build(BuildContext context) {


    Map mapdata = ModalRoute
        .of(context)
        .settings
        .arguments;


    this.cashInHand = mapdata['cash'];
    this.budgets = mapdata['budgets'];
    this.userId = mapdata['userId'];

    print("USER IDDDD");
    //Fetch totalSpent0
    print(userId);

    var LeftOver = double.parse(cashInHand.cashValue);
    //if(this.budgets!=null) {
    this.TotalSpent = Budgets().GetTotalSpent(this.budgets);
    print("Total spent");
    print(TotalSpent);
    // }

    var percent = 0.0;
    if (this.TotalSpent != null) {
      percent = TotalSpent / (LeftOver + TotalSpent);
      print("spent percent");
      print(percent);
    }

    setState(() {
      this.cashInHand = mapdata['cash'];
      this.userId = mapdata['userId'];
    });


    return Scaffold(
      backgroundColor: Color.fromRGBO(243, 53, 53, 1.0),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      appBar: AppBar(
        title: Text("Budgit",
            style: TextStyle(
              //color: Colors.white,
              fontFamily: 'Sairafont',)
        ),


        backgroundColor: Color.fromRGBO(243, 53, 53, 1.0),
        centerTitle: true,
        elevation: 0.0,
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(30.0, 40.0, 30.0, 0.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text('NAME',
                style: TextStyle(
                  color: Colors.white70,
                  letterSpacing: 2.0,
                  fontFamily: 'Sairafont',
                  //fontSize: 20.0,
                )),

            SizedBox(height: 10.0),
            Text('Omar Moharrem',
                style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'Sairafont',
                    letterSpacing: 2.0,
                    //letterSpacing: 2.0,
                    fontSize: 30.0,
                    fontWeight: FontWeight.bold)
            ),

            SizedBox(height: 10.0),
            Text('Left to Spend',
                style: TextStyle(
                  color: Colors.white70,
                  letterSpacing: 2.0,
                  fontFamily: 'Sairafont',
                  //fontSize: 20.0,
                )),
            SizedBox(height: 10.0),

            Text("\$$LeftOver",
                style: TextStyle(
                    color: Colors.white,
                    letterSpacing: 2.0,
                    fontFamily: 'Sairafont',
                    fontSize: 30.0,
                    fontWeight: FontWeight.bold)),

            SizedBox(height: 40.0),

            Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
              //Padding(
              // padding: EdgeInsets.fromLTRB(60, 0, 50, 0),

              new CircularPercentIndicator(
                  radius: 200.0,
                  lineWidth: 10.0,
                  percent: percent,
                  center: new Icon(
                    Icons.account_balance,
                    size: 100.0,
                    color: Colors.white,
                  ),
                  backgroundColor: Colors.grey[850],
                  progressColor: Colors.white),
              // ),
              //children:

//              budgets.map((budgets) => BudgetsWidgets(
//
//                  bdg: budgets,
//                  delete: (){
//                    setState(() {
//                      this.budgets.remove(budgets);
//                    });
//                  }
//
//              )).toList(),
            ])

            //############Function end#################

            //############SECOND ENTRY#################

            //SizedBox(height: 10.0), //Sized Box

//            Column (
//                mainAxisAlignment: MainAxisAlignment.end,
//               // crossAxisAlignment: CrossAxisAlignment.end,
//
//                children: <Widget>[
//                 // SizedBox(width: 290.0),
//
//                  Text(
//                      "\$100",
//                      style: TextStyle(
//                          color: Colors.greenAccent,
//                          letterSpacing: 2.0,
//                          fontSize: 20.0,
//                          fontWeight: FontWeight.bold
//                      )
//                  ),
//
//
//                ]
//            ),
            //SizedBox(height: 10.0), //Sized Box
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.white,
        child: const Icon(
          Icons.edit,
          color: Colors.blueGrey,
        ),
        onPressed: () {
          // Navigator.popAndPushNamed(context, routeName)
          print("sending user");
          print(this.userId);
          Navigator.pushNamed(context, '/budgeter',
              arguments: {
                "budgets": this.budgets,
                "cash": this.cashInHand,
                "userId": this.userId
              });
        },
      ),
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        child: new Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.menu),
              color: Colors.white,
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(Icons.search),
              color: Colors.white,
              onPressed: () {},
            ),
          ],
        ),
        color: Colors.grey,
      ),
    );
  }
}

class BudgetsWidgets extends StatefulWidget {
  final Budgets bdg;
  final Function delete;

  BudgetsWidgets({this.bdg, this.delete});

  @override
  _BudgetsWidgetsState createState() => _BudgetsWidgetsState();
}

class _BudgetsWidgetsState extends State<BudgetsWidgets> {
  @override
  Widget build(BuildContext context) {
    return Row(children: <Widget>[
      Expanded(
          flex: 2,
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Icon(
                  Icons.account_balance,
                  color: Colors.grey[400],
                )
              ])),
      Expanded(
          flex: 6,
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(widget.bdg.text,
                    style: TextStyle(
                      color: Colors.grey,
                      letterSpacing: 2.0,
                      fontSize: 12.5,
                    )),
              ])),
      Expanded(
          flex: 7,
          child: Column(children: <Widget>[
            Text("",
                style: TextStyle(
                  color: Colors.grey,
                  letterSpacing: 2.0,
                  fontSize: 12.5,
                )),
          ])),
      Expanded(
        flex: 11,
        child: Row(mainAxisAlignment: MainAxisAlignment.end, children: <Widget>[
          Text(widget.bdg.value,
              style: TextStyle(
                  color: Colors.greenAccent,
                  letterSpacing: 2.0,
                  fontSize: 15.0,
                  fontWeight: FontWeight.bold)),
          FlatButton.icon(
              onPressed: widget.delete,
              icon: Icon(Icons.money_off, color: Colors.red, size: 20.0),
              //color: Colors.greenAccent,
              label: Text(''))
        ]),
      ),
    ]);
  }
}
