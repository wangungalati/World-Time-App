import 'dart:js';
import 'package:word_time/pages/home.dart';
import 'package:word_time/pages/location.dart';
import 'package:word_time/pages/loading.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'dart:convert';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../services/world_time.dart';

class Loading extends StatefulWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {


  void getWorldTime() async{
    WorldTime instance=WorldTime(location: 'Berlin', flag: 'germany.png', url: 'Europe/Berlin');
    await instance.getData();

    Navigator.pushReplacementNamed(this.context, '/home',arguments: {
      'location': instance.location,
      'flag': instance.flag,
      'time': instance.time,
      'isDateTime': instance.isDateTime
    });

  }

  void initState() {
   getWorldTime();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SpinKitDualRing(
          color: Colors.white,
          size: 80.0,
        ),
      ),
    );
  }
}
