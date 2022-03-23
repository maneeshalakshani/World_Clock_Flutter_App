import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime{

  late String location; //location name for the UI
  late String time; //the time in that location
  late String flag; //url to an asset flag icon
  late String url; //location url or api endpoint
  late bool isDayTime;

  WorldTime({required this.location, required this.flag, required this.url});

  Future<void> getTime() async {

    try{
      Response response = await get(Uri.parse('http://worldtimeapi.org/api/timezone/$url'));
      Map data = jsonDecode(response.body);

      String dateTime = data['datetime'];
      String utc_offset_hours = data['utc_offset'].substring(1,3);
      String utc_offset_minutes = data['utc_offset'].substring(4,6);
      int utc_offset = int.parse(utc_offset_hours)*60 + int.parse(utc_offset_minutes);

      DateTime now = DateTime.parse(dateTime);
      now = now.add(Duration(minutes: utc_offset));

      //Check whether day or night
      isDayTime = ((now.hour >= 6) && (now.hour < 20)) ? true : false;

      //time = now.toString();
      time = DateFormat.jm().format(now);
    }
    catch (e){
      print('Caught error : $e');
      time = 'Could not get time data';
    }

  }

}