import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map data = {};

  @override
  Widget build(BuildContext context) {
    data = data.isNotEmpty ? data : ModalRoute.of(context)!.settings.arguments as Map ;
    print(data);

    String bgImage = data['isDateTime'] ? 'day.png':'night.png';
    Color? bgColor = data['isDateTime'] ? Colors.blue : Colors.blue[700];




    return Scaffold(
      backgroundColor: bgColor,
      // appBar: AppBar(
      //   centerTitle: true,
      //   title: Text('Home'),
      //   backgroundColor: Colors.blue[600],
      //   elevation: 0,
      // ),

      body: SafeArea(
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/$bgImage'),
                fit: BoxFit.cover
              ),
            ),

            child: Padding(
              padding: const EdgeInsets.fromLTRB(0, 120, 0, 0),
              child: Column(
                children: [
                  FlatButton.icon(
                    onPressed: ()  async {
                      dynamic result = await Navigator.pushNamed(context, '/location');

                        setState(() {
                          data = {
                            'time': result['time'],
                            'location': result['location'],
                            'isDaytime': result['isDaytime'],
                            'flag': result['flag']
                          };
                        });

                    },
                    icon: Icon(Icons.location_on,
                    color: Colors.white),
                    label: Text('next location',
                    style: TextStyle(
                      color: Colors.white
                    ),),
                  ),
                  SizedBox(height: 20.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(data['location'],
                          style: TextStyle(fontSize: 28.0,
                              color: Colors.white,
                              letterSpacing: 2.0)),
                    ],

                  ),
                  SizedBox(height: 20.0),
                  Text(data['time'],
                    style: TextStyle(
                      color: Colors.white,
                    fontSize: 66.0,
                    letterSpacing: 2.0
                  ),)
                ],
              ),
            ),
          ),

        ),

    );
  }
}
