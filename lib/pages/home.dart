import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map data = {};

  @override
  Widget build(BuildContext context) {
    data = data.isNotEmpty?data:ModalRoute.of(context).settings.arguments;
    print("your time is ${data['time']}");
    print("your flag is ${data['flag']}");
    print("your location is ${data['location']}");
    print("your location is ${data['isDaytime']}");
    String bgImage = data['isDaytime'] ? 'day.jpg' : 'night.jpg';
    Color bgcolor = data['isDaytime'] ? Colors.blue : Colors.indigo[700];

    return Scaffold(
      backgroundColor: bgcolor,
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/$bgImage'), fit: BoxFit.cover)),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0.0, 120.0, 0, 0),
            child: Column(
              children: <Widget>[
                FlatButton.icon(
                    onPressed: () async {
                      dynamic result =
                          await Navigator.pushNamed(context, '/location');
                    setState(() {
                      data={
                        'location':result['location'],
                        'flag':result['flag'],
                        'time':result['time'],
                        'isDaytime':result['isDaytime'],
                      };
                    });
                    },
                    icon: Icon(
                      Icons.edit_location,
                      color: Colors.grey[300],
                    ),
                    label: Text(
                      'Edit Location',
                      style: TextStyle(color: Colors.grey[300], fontSize: 20),
                    )),
                SizedBox(
                  height: 20.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      data['location'],
                      style: TextStyle(
                          fontSize: 28,
                          letterSpacing: 2.0,
                          color: Colors.white),
                    ),

                  ],
                ),
                SizedBox(
                  height: 20.0,
                ),
                Text(
                  data['time'],
                  style: TextStyle(fontSize: 66, color: Colors.white),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
