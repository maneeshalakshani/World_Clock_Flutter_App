import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'dart:convert';
import 'package:word_clock_flutter_project/Services/world_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  //String time = 'loading';

  void setUpWorldTime() async {
    WorldTime instance = WorldTime(location: 'Colombo', flag: 'Sri Lnka.jpg', url: 'Asia/Colombo');
    await instance.getTime();
    print('THIS IS INSIDE SETUPWORLD TIME : '+instance.time);
    // setState(() {
    //   time = instance.time;
    // });
    Navigator.pushReplacementNamed(context, '/home', arguments: {
      'location' : instance.location,
      'flag' : instance.flag,
      'time' : instance.time,
      'isDayTime' : instance.isDayTime,
    });
  }

  @override
  void initState() {
    super.initState();
    setUpWorldTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigo[900],
      body: Center(
        child: SpinKitWave(
          color: Colors.white,
          size: 50.0,
        ),
      ),
    );
  }
}
