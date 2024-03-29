import 'dart:js';
import 'package:word_time/pages/home.dart';
import 'package:word_time/pages/location.dart';
import 'package:word_time/pages/loading.dart';
import 'package:flutter/material.dart';


import '../services/world_time.dart';

class ChooseLocation extends StatefulWidget {
  const ChooseLocation({Key? key}) : super(key: key);

  @override
  State<ChooseLocation> createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {
  List<WorldTime> locations = [
    WorldTime(url: 'Europe/London', location: 'London', flag: 'uk.png'),
    WorldTime(url: 'Europe/Berlin', location: 'Athens', flag: 'greece.png'),
    WorldTime(url: 'Africa/Cairo', location: 'Cairo', flag: 'egypt.png'),
    WorldTime(url: 'Africa/Nairobi', location: 'Nairobi', flag: 'kenya.png'),
    WorldTime(url: 'America/Chicago', location: 'Chicago', flag: 'usa.png'),
    WorldTime(url: 'America/New_York', location: 'New York', flag: 'usa.png'),
    WorldTime(url: 'Asia/Seoul', location: 'Seoul', flag: 'south_korea.png'),
    WorldTime(url: 'Asia/Jakarta', location: 'Jakarta', flag: 'indonesia.png'),
  ];

  void updateTime(index) async {
    WorldTime instance = locations[index];
    await instance.getData();
    Navigator.pop(this.context, {
      'location': instance.location,
      'time': instance.time,
      'flag': instance.flag,
      'isDaytime': instance.isDateTime,
    });
  }

  @override
  Widget build(BuildContext context) {
    print('build is running');
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: ListView.builder(
        itemCount: locations.length,
        itemBuilder: (context,index){
         return Padding(
           padding: const EdgeInsets.symmetric(vertical: 1.0,horizontal: 4.0),
           child: Card(
             child: ListTile(
               onTap: (){
                 updateTime(index);
               },
               title: Text(locations[index].location),
               leading: CircleAvatar(
                 backgroundImage: AssetImage('assets/${locations[index].flag}'),
               ),
             ),
           ),
         );
        },
      ),
    );
  }
}
