import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime{

  String location;
  String time="";
  String flag;
  String url;
  bool isDateTime=false;

  WorldTime({required this.location,required this.flag,required this.url});

  Future<void> getData() async {

    try{
      Response response = await get(Uri.parse("http://worldtimeapi.org/api/timezone/$url"));
      Map data=jsonDecode(response.body);

      String dateTime=data['datetime'];
      String offset=data['utc_offset'].substring(1,3);

      DateTime now = DateTime.parse(dateTime);
      now=now.add(Duration(hours: int.parse(offset)));

      isDateTime = now.hour>6 &&  now.hour<18 ? true:false;
      time=DateFormat.jm().format(now);
    }catch(e){
      print('Caught error: $e');
      time='A time error occurred';
    }

  }





}



