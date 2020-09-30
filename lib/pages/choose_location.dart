import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:world_time_app/services/world_time.dart';

class ChooseLocation extends StatefulWidget {
  @override
  _ChooseLocationState createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {
  List<WorldTime> locations = [
    WorldTime(url: 'Europe/london', location: 'London', flag: "london.png"),
    WorldTime(url: 'Europe/Berlin', location: 'Athens', flag: "Berlin.jpg"),
    WorldTime(url: 'Africa/Cairo', location: 'Cairo', flag: "Cairo.png"),
    WorldTime(url: 'Africa/Nairobi', location: 'Nairobi', flag: "Nairobi.png"),
    WorldTime(url: 'America/Chicago', location: 'Chicago', flag: "Chicago.png"),
    WorldTime(
        url: 'America/New_York', location: 'New York', flag: "New_York.png"),
    WorldTime(url: 'Asia/Seoul', location: 'Seoul', flag: "Seoul.png"),
    WorldTime(url: 'Asia/Jakarta', location: 'Jakarta', flag: "Jakarta.png"),
  ];

  void updateTime(index) async {
    WorldTime instanse = locations[index];
    await instanse.getTime();
    Navigator.pop(context,{
      'location': instanse.location,
      'flag': instanse.flag,
      'time': instanse.time,
      'isDaytime': instanse.isDaytime,
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print('initstate can be run...');
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    print('dispose can be run...');
  }

  @override
  Widget build(BuildContext context) {
    print('Build can be run...');
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        elevation: 0,
        title: Text("Choose a location"),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemBuilder: (BuildContext context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 1.0, horizontal: 4.0),
            child: Card(
              child: ListTile(
                title: Text(locations[index].location),
                leading: CircleAvatar(
                  backgroundImage:
                      AssetImage('assets/${locations[index].flag}'),
                ),
                onTap: () {
                  updateTime(index);
                },
              ),
            ),
          );
        },
        itemCount: locations.length,
      ),
    );
  }
}
