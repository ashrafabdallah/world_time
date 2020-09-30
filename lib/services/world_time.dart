import 'dart:convert';
import 'dart:ffi';

import 'package:http/http.dart';
import 'package:intl/intl.dart';

class WorldTime {
  String location; //location name for the url
  String time; //the time in that location
  String flag; //url to an asset flag icon
  String url;
  var isDaytime;

  WorldTime(
      {this.location, this.flag, this.url}); //location url for api endpoint

  // ignore: missing_return
  Future<Void> getTime() async {
    try {
      Response response =
          await get("http://worldtimeapi.org/api/timezone/$url");
      Map data = jsonDecode(response.body);
      String datetime = data['datetime'];
      String offset = data['utc_offset'].substring(1, 3);

      DateTime now = DateTime.parse(datetime);
      print(now);
      now = now.add(Duration(hours: int.parse(offset)));
      print(now);
      isDaytime = now.hour > 6 && now.hour < 20 ? true : false;
      time = DateFormat.jm().format(now);
    } catch (e) {
      print('error..............................................');
      time = "Could not get time data";
    }
  }
}
