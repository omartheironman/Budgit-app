
import 'package:flutter/material.dart';
import 'budgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:myapp/db/DBController.dart';

class AddNewBudget extends StatefulWidget {
  @override
  NewBudget createState() => NewBudget();
}



class NewBudget extends State<AddNewBudget> {

  int _currentSelected = 0;

  void _onItemTapped(int index) {
    setState(() {
      _currentSelected = index;
    });
  }

  final Dbcontroller controller = new Dbcontroller();
  bool _value1 = false;

  void _value1Changed(bool value) => setState(() => _value1 = value);
  String userId;
  List<Budgets> budgets;
  Cash cash;


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

                          '\$fdfefr'+Budget.value,
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
    this.userId = mapdata['userId'];

    print("USER IDDDDDDD");
    print(this.userId);
    cash = mapdata['cash'];
    print("CASHHH");
    print(cash.cashValue);
    final _formKey = GlobalKey<FormState>();
    final _cash = GlobalKey<FormState>();

    final BudgetName = TextEditingController();
    final BudgetValue = TextEditingController();
    final BudgetCash =  TextEditingController();
    //final CheckBox =   CheckboxInputElement();


    // show the dialog


    return Scaffold(


      backgroundColor: Color.fromRGBO(243, 53, 53, 1.0),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      appBar: AppBar(

        title: Text("Budgit", style: TextStyle(
          //color: Colors.white,
          fontFamily: 'Sairafont',)),
        backgroundColor: Color.fromRGBO(243, 53, 53, 1.0),
        centerTitle: true,
        elevation: 0.0,
      ),


      body: SingleChildScrollView(
        child: Padding(

          padding: const EdgeInsets.fromLTRB(30.0, 40.0, 30.0, 0.0),

          child: Column(


            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[


              Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  //  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[

                    TextFormField(
                      style: TextStyle(
                        color: Colors.white70,
                        fontFamily: 'Sairafont',
                      ),
                      controller: BudgetName,

                      decoration: const InputDecoration(

                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.greenAccent),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.greenAccent),
                        ),
                        fillColor: Colors.white,
                        icon: Icon(Icons.text_fields, color: Colors.white),
                        hintText: 'Enter Budget Name',
                        hintStyle: TextStyle(
                            letterSpacing: 2.0, fontFamily: 'Sairafont',
                            fontSize: 10.0,
                            color: Colors.white),
                        labelText: 'Add Budget Name',
                        labelStyle: TextStyle(
                            letterSpacing: 2.0, fontFamily: 'Sairafont',
                            fontSize: 10.0,
                            color: Colors.white),

                      ),
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Please enter some text';
                        }
                        return null;
                      },
                    ),

                    TextFormField(

                      keyboardType: TextInputType.number,

                      style: TextStyle(
                        color: Colors.white70,
                        fontFamily: 'Sairafont',
                      ),
                      controller: BudgetValue,
                      decoration: const InputDecoration(
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.greenAccent),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.greenAccent),
                        ),
                        fillColor: Colors.white,

                        icon: Icon(Icons.attach_money, color: Colors.white,),
                        hintText: 'Enter Budget Value',
                        hintStyle: TextStyle(letterSpacing: 2.0,
                            fontSize: 10.0, fontFamily: 'Sairafont',
                            color: Colors.white),

                        labelText: 'Budget Value',
                        labelStyle: TextStyle(fontFamily: 'Sairafont',
                            fontSize: 10.0, color: Colors.white),

                      ),

                      validator: (value) {
                        var cashInHand = double.parse(cash.cashValue);
                        var newBudgetValue = 0.0;
                        if (value != null) {
                          print("@@@@@@@@@@@ " + value);
                          newBudgetValue = double.parse(value);
                        }
                        var totalAllocated = Budgets().GetTotalValues(budgets);
                        if (value.isEmpty) {
                          return 'Please enter some text';
                        }

                        if (cashInHand < newBudgetValue) {
                          return 'Not enough cash left!';
                        }
                        cash.cashValue =
                            (cashInHand - newBudgetValue).toString();


                        return null;
                      },
                    ),

                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 16.0),

                      child: RaisedButton(
                        splashColor: Colors.greenAccent,

                        onPressed: () {
                          // Validate returns true if the form is valid, or false
                          // otherwise.
                          if (_formKey.currentState.validate()) {
                            // If the form is valid, display a Snackbar.
                            print(BudgetName.text);
                            setState(() {
                              this.budgets.add(Budgets(text: BudgetName.text,
                                  value: BudgetValue.text));
                            });


                            controller.AddBudget({
                              'budgetName': BudgetName.text,
                              'budgetValue': BudgetValue.text,
                              'spent': '0.0'
                            }, this.userId);
                            controller.UpdateAllocation(
                                {'Allocations': cash.cashValue},
                                this.userId);


//                                 setState(() {
//                                    budgets.add(Budgets(text:BudgetName.text,value:BudgetValue.text,spent:"0.0"));
//                                  });


                            // Navigator.popUntil(context, ModalRoute.withName('/home'));
                            Navigator.of(context).pop();
                            Navigator.popAndPushNamed(context, '/budgeter',
                                arguments: {
                                  "budgets": this.budgets,
                                  "cash": cash,
                                  "userId": this.userId
                                });


                            //pass the context back budgets
//                            Navigator.pop(context, '/budgeter');
//                            Navigator.pushNamed(context, '/home',
//                                arguments: {
//                                  "budgets": budgets,
//                                  "cash": cashInHand.cashValue
//                                });
                            // Navigator.popAndPushNamed(context, routeName)
                          }
                        },
                        child: Text('Submit'),
                      ),

                    ),

                  ],
                ),
              )
              //children:  budgets.map((bdgts)=> budgetToCard(bdgts)).toList(),
              ,

              SizedBox(height: 10.0),
              Divider(),

              Container(
                decoration: BoxDecoration(
                    border: Border.all(
                        color: Colors.white,
                        width: 1
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(3))
                ),
                //width: 24,
                // height: 24,
                child: CheckboxListTile(
                  title: Text("Adjust Budget",
                      style: TextStyle(color: Colors.white70,
                        fontFamily: 'Sairafont',)),
                  value: _value1,

                  onChanged: (bool newValue) {
                    setState(() {
                      _value1 = newValue;
                      //print(_cash.currentContext.describeWidget('Form').);
                    });
                  },
                ),
              ),


              _value1 == true ? Form(

                key: _cash,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  //  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[


                    TextFormField(

                      keyboardType: TextInputType.number,

                      style: TextStyle(
                        color: Colors.white70,
                        fontFamily: 'Sairafont',
                      ),
                      controller: BudgetCash,
                      decoration: const InputDecoration(
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                        ),
                        fillColor: Colors.white,

                        icon: Icon(Icons.attach_money, color: Colors.white),
                        hintText: 'Adjust Cash',
                        hintStyle: TextStyle(letterSpacing: 2.0,
                            fontSize: 10.0,
                            color: Colors.white),

                        labelText: 'Cash in hand',
                        labelStyle: TextStyle(
                            fontSize: 10.0,
                            fontFamily: 'Sairafont',
                            color: Colors.white),

                      ),

                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Please enter some text';
                        }
                        return null;
                      },
                    ),


                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 16.0),

                      child: RaisedButton(
                        splashColor: Colors.white,

                        onPressed: () {
                          // Validate returns true if the form is valid, or false
                          // otherwise.
                          if (_cash.currentState.validate()) {
                            // If the form is valid, display a Snackbar.
                            //print(BudgetName.text);
                            this.cash.cashValue = BudgetCash.text;
                            controller.UpdateAllocation(
                                {'Allocations': cash.cashValue},
                                this.userId);


                            //this.budgets.add(Budgets(text:BudgetName.text,value:BudgetValue.text));
                            //pass the context back budgets
                            //Navigator.pop(context, '/budgeter');
                            Navigator.pop(context, () {
                              setState(() {
                                this.cash.cashValue = BudgetCash.text;
                              });
                            });

                            //Navigator.pop(context, '/budgeter');
                            // Navigator.pop(context,  this.cash.cashValue );
                            // Navigator.popAndPushNamed(context, routeName)
                          }


                          if (_formKey.currentState.validate() &&
                              _cash.currentState.validate()) {
                            // If the form is valid, display a Snackbar.
                            this.budgets.add(Budgets(text: BudgetName.text,
                                value: BudgetValue.text));
                            //pass the context back budgets
                            //this.cash.cashValue =  BudgetCash.text;
                            Navigator.pop(context, '/budgeter');

                            //Navigator.pushNamed(context, '/', arguments: {"cash": BudgetCash.text});
                            // Navigator.popAndPushNamed(context, routeName)
                          }
                        },


                        child: Text('Adjust Budget'),
                      ),

                    ),

                  ],
                ),
              ) : Container()


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
      ),


      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.white,
        child: const Icon(
          Icons.add,
          //on click have a pop up to add a budget to the list
          color: Colors.blueGrey,
        ),
        onPressed: (){},
      ),


      bottomNavigationBar:
      BottomAppBar(
        shape: CircularNotchedRectangle(),

        child: new Row(

          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.menu),
              color: Colors.white,
              onPressed: _showModal,
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

  void _showModal() {
    showModalBottomSheet<void>(
        context: context,
        builder: (BuildContext context) {
          return new Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              new ListTile(
                leading: new Icon(Icons.airplanemode_active),
                title: new Text('Vacation Deals (5)'),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              new ListTile(
                leading: new Icon(Icons.local_grocery_store),
                title: new Text('Grocery sales (2)'),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              new ListTile(
                leading: new Icon(Icons.card_giftcard),
                title: new Text('Affordable gifts (1)'),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
            ],
          );
        }
    );
  }


}




