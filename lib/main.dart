import 'package:flutter/material.dart';
import 'package:listviewbuilder/page/choose_location.dart';
import 'package:listviewbuilder/page/home.dart';
import 'package:listviewbuilder/page/loading.dart';

void main() => runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: '/',
    routes: {
      '/': (context) => Loading(),
      '/home': (context) => Home(),
      '/location': (context) => ChooseLocation(),
    }
));

