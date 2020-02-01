import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
  //open up Material widget

  home: Home(),


));



class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
                "\$521",
                style: TextStyle(
                    color: Colors.greenAccent,
                    letterSpacing: 2.0,
                    fontSize: 30.0,
                    fontWeight: FontWeight.bold
                )
            ),

            SizedBox(height: 24.0),

            Row(
              children: <Widget>[
                Icon(
                  //Icons.email,
                  Icons.account_balance,
                  color: Colors.grey[400],
                ),
                SizedBox(width: 240.0),
                Text(
                    "Shopping",
                    style: TextStyle(
                        color: Colors.grey,
                        letterSpacing: 2.0,
                        fontSize: 15.0,
                    )
                ),
              ]
            ),
            //SizedBox(height: 10.0), //Sized Box
            Row(
                children: <Widget>[
                  SizedBox(width: 290.0),

                  Text(
                      "\$100",
                      style: TextStyle(
                          color: Colors.greenAccent,
                          letterSpacing: 2.0,
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold
                      )
                  ),
                ]
            ),
            SizedBox(height: 10.0), //Sized Box

            Row(
                children: <Widget>[
                  Icon(
                    //Icons.email,
                    Icons.account_balance,
                    color: Colors.grey[400],
                  ),
                  SizedBox(width: 260.0),
                  Text(
                      "Dinning",
                      style: TextStyle(
                        color: Colors.grey,
                        letterSpacing: 2.0,
                        fontSize: 15.0,
                      )
                  ),
                ]
            ),
            Row(
                children: <Widget>[
                  SizedBox(width: 300.0),

                  Text(
                      "\$80",
                      style: TextStyle(
                          color: Colors.greenAccent,
                          letterSpacing: 2.0,
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold
                      )
                  ),
                ]
            ),

            SizedBox(height: 10.0), //Sized Box
            Row(
                children: <Widget>[
                  Icon(
                    //Icons.email,
                    Icons.account_balance,
                    color: Colors.grey[400],
                  ),
                  SizedBox(width: 290.0),
                  Text(
                      "Fun",
                      style: TextStyle(
                        color: Colors.grey,
                        letterSpacing: 2.0,
                        fontSize: 15.0,
                      )
                  ),
                ]
            ),
            Row(
                children: <Widget>[
                  SizedBox(width: 300.0),

                  Text(
                      "\$40",
                      style: TextStyle(
                          color: Colors.greenAccent,
                          letterSpacing: 2.0,
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold
                      )
                  ),
                ]
            ),
            SizedBox(height: 10.0), //Sized Box
            Row(
                children: <Widget>[
                  Icon(
                    //Icons.email,
                    Icons.account_balance,
                    color: Colors.grey[400],
                  ),
                  SizedBox(width: 270.0),
                  Text(
                      "Sports",
                      style: TextStyle(
                        color: Colors.grey,
                        letterSpacing: 2.0,
                        fontSize: 15.0,
                      )
                  ),
                ]
            ),
            Row(
                children: <Widget>[
                  SizedBox(width: 300.0),

                  Text(
                      "\$69",
                      style: TextStyle(
                          color: Colors.greenAccent,
                          letterSpacing: 2.0,
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold
                      )
                  ),
                ]
            ),

            SizedBox(height: 10.0), //Sized Box
            Row(
                children: <Widget>[
                  Icon(
                    //Icons.email,
                    Icons.account_balance,
                    color: Colors.grey[400],
                  ),
                  SizedBox(width: 270.0),
                  Text(
                      "Phone",
                      style: TextStyle(
                        color: Colors.grey,
                        letterSpacing: 2.0,
                        fontSize: 15.0,
                      )
                  ),
                ]
            ),
            Row(
                children: <Widget>[
                  SizedBox(width: 300.0),

                  Text(
                      "\$21",
                      style: TextStyle(
                          color: Colors.greenAccent,
                          letterSpacing: 2.0,
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold
                      )
                  ),
                ]
            ),
            SizedBox(height: 10.0), //Sized Box
            Row(
                children: <Widget>[
                  Icon(
                    //Icons.email,
                    Icons.account_balance,
                    color: Colors.grey[400],
                  ),
                  SizedBox(width: 290.0),
                  Text(
                      "Car",
                      style: TextStyle(
                        color: Colors.grey,
                        letterSpacing: 2.0,
                        fontSize: 15.0,
                      )
                  ),
                ]
            ),
            Row(
                children: <Widget>[
                  SizedBox(width: 300.0),

                  Text(
                      "\$11",
                      style: TextStyle(
                          color: Colors.greenAccent,
                          letterSpacing: 2.0,
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold
                      )
                  ),
                ]
            ),


          ],

        ),
      ),

//      body: Center(
//        child: Image.asset('Assets/background.jpg'),
//        ),

    //),
//        child: Text(
//          'Take control of your finances!',
//          style: TextStyle(
//            fontSize: 20.0,
//            fontWeight: FontWeight.bold,
//            letterSpacing: 2.0,
//            color: Colors.green,
//            fontFamily: 'Customfont',
//          ),
        //),

     // ),

//
//      bottomNavigationBar: BottomAppBar(
//        shape: const CircularNotchedRectangle(),
//        child: Container(
//          height: 50.0,
//          color: Colors.grey,
//        ),
//      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.greenAccent,
        child: const Icon(
          Icons.edit,
          color: Colors.blueGrey,
        ),
        onPressed: () {},
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


