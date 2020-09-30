import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:http/http.dart';
import 'package:world_time_app/services/world_time.dart';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  void setupworldtime() async {
    WorldTime instanse =
        WorldTime(location: 'Berlin', flag: 'bfb', url: 'Africa/Cairo');
    await instanse.getTime();
    Navigator.pushNamed(context, '/home', arguments: {
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
    setupworldtime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[900],
      body: Center(
        // child: Column(
        //   children: <Widget>[
        //    ,
        //     SizedBox(height: 10,),
        //     Text("loading...",
        //         style: TextStyle(color: Colors.white, fontSize: 50))
        //   ],
        // ),
        child:  SpinKitHourGlass(
          color: Colors.white,
          size: 100.0,
        ),
      ),

    );
  }
}
