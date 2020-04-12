import 'package:flutter/material.dart';
import 'budgets.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:myapp/db/DBController.dart';
class Budgeter extends StatefulWidget {
  @override
  _BudgeterState createState() => _BudgeterState();
}



class _BudgeterState extends State<Budgeter> {

  final Dbcontroller controller = new Dbcontroller();

  List<Budgets> budgets;
  Cash cash;
  final toSpend = TextEditingController();
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
                  Navigator.pushNamed(context, '/AddNew',
                      arguments: {"budgets": this.budgets, "cash": this.cash});
                },
              )
            ],
          );
        });
  }


  //Add listener to spend
  Widget budgetToCard(Budget) {
    var budget = double.parse(Budget.value);
    var spent = 0.0;
    if (Budget.spent == null) {
      spent = 0.0;
    } else {
      spent = double.parse(Budget.spent);
    }

    //var willSpend = double.parse(toSpend.text);
    return Card(
        color: Colors.grey[800],
        margin: EdgeInsets.fromLTRB(16, 16, 16, 0),
        child: new InkWell(
            onTap: () {
              _showDialog(Budget);
            },

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
                                fontSize: 14.0,
                                color: Colors.greenAccent,
                              )
                          ),
                        ),
                        SizedBox(height: 6.0),

                        Expanded(
                          flex: 0,
                          child: Text(

                              '\$' + Budget.value,
                              style: TextStyle(
                                fontSize: 12.0,
                                color: Colors.greenAccent,
                              )
                          ),
                        ),
                      ]
                  ),
                  SizedBox(height: 6.0),
                  LinearPercentIndicator(
                    progressColor: Colors.greenAccent,
                    percent: spent / budget,
                    animation: true,
                    lineHeight: 14.0,
                    backgroundColor: Colors.grey[850],
                    center: Text('$spent\$',
                        style:
                        new TextStyle(fontWeight: FontWeight.bold,
                            fontSize: 12.0,
                            color: Colors.green)),

                  )
                ],

              ),
            )
        )
    );
  }

  @override
  Widget build(BuildContext context) {
    Map mapdata = ModalRoute
        .of(context)
        .settings
        .arguments;
    budgets = mapdata['budgets'];
    cash = mapdata['cash'];

    print("CASH IN HAND");
    print(cash.cashValue);
    //controller.UpdateAllocation({'Allocations':cash.cashValue},'omarmoharrem');
    // set up the button
    Widget okButton = FlatButton(
      child: Text("OK"),
      onPressed: () {},
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

              children: budgets.map((bdgts) => budgetToCard(bdgts)).toList(),
            ),

            SizedBox(height: 10.0),

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

  _showDialog(Budgets itemsToSpend) async {
    await showDialog<String>(
      context: context,
      child: new AlertDialog(
        contentPadding: const EdgeInsets.all(16.0),
        content: new Row(
          children: <Widget>[
            new Expanded(
              child: new TextField(
                keyboardType: TextInputType.number,
                autofocus: true,
                controller: toSpend,
                decoration: const InputDecoration(

                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.greenAccent),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.greenAccent),
                  ),
                  fillColor: Colors.green,
                  icon: Icon(Icons.text_fields, color: Colors.green),
                  hintText: 'How much you will spend',
                  hintStyle: TextStyle(letterSpacing: 2.0,
                      fontSize: 10.0,
                      color: Colors.greenAccent),
                  labelText: 'Cost of purchased Item',
                  labelStyle: TextStyle(letterSpacing: 2.0,
                      fontSize: 10.0,
                      color: Colors.green),

                ),
              ),
            )
          ],
        ),
        actions: <Widget>[
          new FlatButton(
              child: const Text('Cancel'),
              onPressed: () {
                Navigator.pop(context);
                Navigator.popAndPushNamed(context, '/budgeter',
                    arguments: {"budgets": this.budgets, "cash": this.cash});
              }),
          new FlatButton(
              child: const Text('Spend'),
              onPressed: () {
                var budget = double.parse(itemsToSpend.value);
                var spentMoney;
                if (itemsToSpend.spent == null) {
                  itemsToSpend.spent = "0.0";
                }
                spentMoney = double.parse(itemsToSpend.spent);
                var willSpend = double.parse(toSpend.text);
                if (willSpend == null) {
                  willSpend = 0.0;
                }
                if (budget < willSpend + spentMoney) {
                  print("Not enough allowance left!");
                  return null;
                }

                //set the spent value of the item
                var totalSpent = spentMoney + willSpend;
                itemsToSpend.spent = totalSpent.toString();

                Navigator.pop(context);
                Navigator.popAndPushNamed(context, '/budgeter',
                    arguments: {"budgets": this.budgets, "cash": this.cash});
                controller.UpdateBudget(
                    itemsToSpend.text, itemsToSpend.spent, 'omarmoharrem');
              })
        ],
      ),
    );
  }
}



