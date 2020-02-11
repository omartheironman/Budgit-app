
import 'package:flutter/material.dart';
import 'budgets.dart';

class AddNewBudget extends StatefulWidget {
  @override
  NewBudget createState() => NewBudget();
}



class NewBudget extends State<AddNewBudget> {



  bool _value1 = false;
  void _value1Changed(bool value) => setState(() => _value1 = value);

  List<Budgets> budgets;



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
    final _formKey = GlobalKey<FormState>();
    final _cash = GlobalKey<FormState>();

    final BudgetName = TextEditingController();
    final BudgetValue = TextEditingController();
    final BudgetCash =  TextEditingController();
    //final CheckBox =   CheckboxInputElement();





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


                Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                  //  crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[

                      TextFormField(
                        style: TextStyle(
                          color: Colors.white70,
                        ),
                        controller: BudgetName,

                  decoration: const InputDecoration(

                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.greenAccent),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.greenAccent),
                    ),
                    fillColor: Colors.green,
                          icon: Icon(Icons.text_fields, color:Colors.green),
                          hintText: 'Enter Budget Name',
                          hintStyle:  TextStyle(letterSpacing: 2.0,fontSize: 10.0, color: Colors.greenAccent),
                          labelText: 'Add Budget Name',
                           labelStyle: TextStyle(letterSpacing: 2.0,fontSize: 10.0, color: Colors.green),

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
                        ),
                        controller: BudgetValue,
                           decoration: const InputDecoration(
                            enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.greenAccent),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.greenAccent),
                          ),
                          fillColor: Colors.green,

                          icon: Icon(Icons.attach_money,color: Colors.green,),
                          hintText: 'Enter Budget Value',
                             hintStyle:  TextStyle(letterSpacing: 2.0,fontSize: 10.0, color: Colors.greenAccent),

                             labelText: 'Budget Value',
                          labelStyle: TextStyle(fontSize: 10.0, color: Colors.green),

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
                          splashColor: Colors.greenAccent,

                          onPressed: () {
                            // Validate returns true if the form is valid, or false
                            // otherwise.
                            if (_formKey.currentState.validate()) {
                              // If the form is valid, display a Snackbar.
                                print(BudgetName.text);
                               this.budgets.add(Budgets(text:BudgetName.text,value:BudgetValue.text));
                               //pass the context back budgets
                                Navigator.pop(context, '/budgeter');
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



            Checkbox(value: _value1,
                onChanged: (bool newValue) {
                  setState(() {

                    _value1 = newValue;


                    //print(_cash.currentContext.describeWidget('Form').);

                  });
                }
            ),






            _value1==true ? Form(

              key: _cash,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                //  crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[


                  TextFormField(

                    keyboardType: TextInputType.number,

                    style: TextStyle(
                      color: Colors.white70,
                    ),
                    controller: BudgetCash,
                    decoration: const InputDecoration(
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.greenAccent),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.greenAccent),
                      ),
                      fillColor: Colors.green,

                      icon: Icon(Icons.attach_money,color: Colors.green,),
                      hintText: 'Adjust Cash',
                      hintStyle:  TextStyle(letterSpacing: 2.0,fontSize: 10.0, color: Colors.greenAccent),

                      labelText: 'Cash in hand',
                      labelStyle: TextStyle(fontSize: 10.0, color: Colors.green),

                    ),

//                    validator: (value) {
//                      if (value.isEmpty) {
//                        return 'Please enter some text';
//                      }
//                      return null;
//                    },
                  ),


                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16.0),

                    child: RaisedButton(
                      splashColor: Colors.greenAccent,

                      onPressed: () {
                        // Validate returns true if the form is valid, or false
                        // otherwise.
                        if (_cash.currentState.validate()) {
                          // If the form is valid, display a Snackbar.
                          print(BudgetName.text);
                          this.budgets.add(Budgets(text:BudgetName.text,value:BudgetValue.text));
                          //pass the context back budgets
                          Navigator.pop(context, '/budgeter');
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


      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.greenAccent,
        child: const Icon(
          Icons.add,
          //on click have a pop up to add a budget to the list
          color: Colors.blueGrey,
        ),
        onPressed: (){},
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


