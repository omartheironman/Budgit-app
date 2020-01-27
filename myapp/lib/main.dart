import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
  //open up Material widget

  home: Home(),


));



class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Infinit Wallet"),
        backgroundColor: Colors.green,
      ),


      body: Column(
      //  mainAxisAlignment: MainAxisAlignment.centes,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
      Container(

        padding: EdgeInsets.all(20.0),
        alignment: Alignment.center,
            child: Text(
              'Take control of your finances!',
                style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
                letterSpacing: 2.0,
                    color: Colors.green,
                fontFamily: 'Customfont'
              ),
            ),
      ),

        Container(

            alignment: Alignment.center,

            //padding: EdgeInsets.all(50.0),
           child:  FlatButton(
            onPressed: (){},
            color: Colors.green,
            child: Text('Add'),
          )
    ),
        ],

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




      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Text("Add"),
        backgroundColor: Colors.green,
      ),

      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        child: Container(
          height: 50.0,
        ),
      ),


    );
  }
}


