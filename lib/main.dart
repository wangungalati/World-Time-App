import 'dart:js';
import 'package:word_time/pages/home.dart';
import 'package:word_time/pages/location.dart';
import 'package:word_time/pages/loading.dart';
import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
    initialRoute: '/',
    routes: {

      '/': (context) => Loading(),
      '/home': (context) => Home(),
      '/location': (context) => ChooseLocation(),

    }));
