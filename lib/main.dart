//import 'dart:js';

import 'package:flutter/material.dart';
import 'package:word_clock_flutter_project/Pages/choose_location.dart';
import 'package:word_clock_flutter_project/Pages/home.dart';
import 'package:word_clock_flutter_project/Pages/loading.dart';

void main() => runApp(MaterialApp(
  debugShowCheckedModeBanner: false,

  //overriding '/' in routes: Map
  initialRoute: '/',

  routes: {
    '/': (context) => Loading(), //Base route - context - where in the widget tree we are
    '/home' : (context) => Home(),
    '/choose_location': (context) => ChooseLocation(),
  },
));



