import 'package:flutter/material.dart';
import 'budgets.dart';

class Budgeter extends StatefulWidget {
  @override
  _BudgeterState createState() => _BudgeterState();
}



class _BudgeterState extends State<Budgeter> {




  List<Budgets> budgets;

  TextEditingController _textFieldController = TextEditingController();

  _displayDialog(BuildContext context) async {
    return showDialog(
        context: context,

        builder: (context) {

          return AlertDialog(

            title: Text('Would you like to add a new budget?'),



            actions: <Widget>[
              new FlatButton(
                child: new Text('Cancel'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              new FlatButton(
                child: new Text('Add'),
                onPressed: () {
                  Navigator.of(context).pop();
                  Navigator.pushNamed(context, '/AddNew', arguments: {"budgets": this.budgets});

                },
              )
            ],
          );
        });
  }


  Widget budgetToCard(Budget){
  return Card(
    color: Colors.grey[800],
    margin: EdgeInsets.fromLTRB(16, 16, 16, 0),
    child: Padding(
      padding: const EdgeInsets.all(12.0),
      child: Column(
        children: <Widget>[
          Row(
              mainAxisAlignment: MainAxisAlignment.center,

              children: <Widget>[

          Expanded(
            flex: 2,
            child: Text(

                Budget.text,
                style: TextStyle(
                  fontSize: 12.0,
                  color: Colors.greenAccent,
                )
            ),
          ),
          SizedBox(height:6.0),

          Expanded(
            flex: 0,
            child: Text(

                '\$'+Budget.value,
                style: TextStyle(
                  fontSize: 12.0,
                  color: Colors.greenAccent,
                )
            ),
          ),
            ]
          )
        ],

      ),
    )
  );
  }

  @override
  Widget build(BuildContext context) {

    Map mapdata =ModalRoute.of(context).settings.arguments;
    budgets= mapdata['budgets'];


    // set up the button
    Widget okButton = FlatButton(
      child: Text("OK"),
      onPressed: () { },
    );
    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("My title"),
      content: Text("This is my message."),
      actions: [
        okButton,
      ],
    );
    // show the dialog


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

            Column(
              crossAxisAlignment: CrossAxisAlignment.start,

              children:  budgets.map((bdgts)=> budgetToCard(bdgts)).toList(),
            ),

            SizedBox(height: 10.0),




//            Column(
//
//
//              children:
//
//
//              budgets.map((budgets) => BudgetsWidgets(
//
//                  bdg: budgets,
//                  delete: (){
//                    setState(() {
//
//                      this.budgets.remove(budgets);
//
//
//                    });
//                  }
//
//              )).toList(),
//
//            )


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
          Icons.add,
          //on click have a pop up to add a budget to the list
          color: Colors.blueGrey,
        ),
          onPressed: () => _displayDialog(context),
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


