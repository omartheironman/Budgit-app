
import 'package:flutter/material.dart';
import 'Pages/budgets.dart';
import 'Pages/AddBudget.dart';
import 'Pages/NewBudget.dart';
import 'Pages/login.dart';
import 'Pages/home.dart';
import 'package:percent_indicator/percent_indicator.dart';

void main() => runApp(MaterialApp(
  //open up Material widget

  initialRoute: '/',
  routes: {
    '/': (context) => SignIn(),
    '/home': (context) => Home(),
    '/budgeter' : (context) => Budgeter(),
    '/AddNew'  : (context) => AddNewBudget()

  },

));




