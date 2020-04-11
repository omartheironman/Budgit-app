
import 'package:flutter/material.dart';
import 'Pages/budgets.dart';
import 'Pages/AddBudget.dart';
import 'Pages/NewBudget.dart';
import 'package:percent_indicator/percent_indicator.dart';

void main() => runApp(MaterialApp(
  //open up Material widget

  initialRoute: '/',
  routes: {
    '/': (context) => Home(),
    '/budgeter' : (context) => Budgeter(),
    '/AddNew'  : (context) => AddNewBudget()

  },

));



class Home extends StatefulWidget {

  _HomeState createState() => _HomeState();

}

class _HomeState extends State<Home> {

  Cash cashInHand = new Cash(cashValue: "0");


  List<Budgets> budgets = [
        Budgets(text:'Shopping',value:'500'),
        Budgets(text:'Car',value:'200'),
        Budgets(text:'Dog',value:'300'),

      ];






  @override
  Widget build(BuildContext context) {
    String currentCash = this.cashInHand.cashValue;


    return Scaffold(


      backgroundColor: Colors.grey[900],
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      appBar: AppBar(
        title: Text("MyWallet"),
        backgroundColor: Colors.grey[850],
        centerTitle: true,
        elevation: 0.0,
      ),


      body: Padding(

        padding: const EdgeInsets.fromLTRB(30.0, 40.0, 30.0, 0.0),

        child: Column(

          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[

            Text(
                'NAME',
                style: TextStyle(
                  color: Colors.grey,
                  letterSpacing: 2.0,
                  //fontSize: 20.0,
                )
            ),

            SizedBox(height: 10.0),
            Text(
                'Omar Moharrem',
                style: TextStyle(
                    color: Colors.greenAccent,
                    letterSpacing: 2.0,
                    fontSize: 30.0,
                    fontWeight: FontWeight.bold
                )
            ),

            SizedBox(height: 10.0),
            Text(
                'Left to Spend',
                style: TextStyle(
                  color: Colors.grey,
                  letterSpacing: 2.0,
                  //fontSize: 20.0,
                )
            ),
            SizedBox(height: 10.0),

            Text(
                "\$$currentCash",
                style: TextStyle(
                    color: Colors.greenAccent,
                    letterSpacing: 2.0,
                    fontSize: 30.0,
                    fontWeight: FontWeight.bold
                )
            ),

            SizedBox(height: 40.0),

            Column(
              // mainAxisAlignment: MainAxisAlignment.center,

                children: <Widget>[

                  Padding(
                    padding: EdgeInsets.fromLTRB(80, 20, 20, 60),

                    child: new CircularPercentIndicator(
                      radius: 200.0,
                      lineWidth: 10.0,
                      percent: 0.8,
                      center: new Icon(
                        Icons.account_balance,
                        size: 100.0,
                        color: Colors.greenAccent,
                      ),
                      backgroundColor: Colors.grey[850],
                      progressColor: Colors.greenAccent,
                    ),
                  ),
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
        backgroundColor: Colors.greenAccent,
        child: const Icon(
          Icons.edit,
          color: Colors.blueGrey,
        ),
        onPressed: () {
          Navigator.pushNamed(context, '/budgeter',
              arguments: {"budgets": this.budgets, "cash": this.cashInHand});
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
    return Row(

        children: <Widget>[
          Expanded(
              flex: 2,
              child:
              Column (
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Icon(Icons.account_balance,
                      color: Colors.grey[400],
                    )
                  ]
              )
          ),

          Expanded(
              flex: 6,
              child:
              Column (
                  crossAxisAlignment: CrossAxisAlignment.start,


                  children: <Widget>[

                    Text(
                        widget.bdg.text,
                        style: TextStyle(
                          color: Colors.grey,
                          letterSpacing: 2.0,
                          fontSize: 12.5,
                        )
                    ),

                  ]
              )
          ),
          Expanded(
              flex: 7,
              child:
              Column (

                  children: <Widget>[

                    Text(
                        "",
                        style: TextStyle(
                          color: Colors.grey,
                          letterSpacing: 2.0,
                          fontSize: 12.5,
                        )
                    ),

                  ]
              )
          ),
          Expanded (
            flex: 11,
            child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[

                  Text(
                      widget.bdg.value,
                      style: TextStyle(
                          color: Colors.greenAccent,
                          letterSpacing: 2.0,
                          fontSize: 15.0,
                          fontWeight: FontWeight.bold
                      )
                  ),
                  FlatButton.icon(
                      onPressed: widget.delete,
                      icon: Icon(Icons.money_off, color:Colors.red, size: 20.0),
                      //color: Colors.greenAccent,
                      label: Text('')
                  )

                ]
            ),
          ),




        ]


    );
  }
}


