import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  
  Map data = {};
  
  @override
  Widget build(BuildContext context) {
    
    data = ModalRoute.of(context)?.settings.arguments as Map;
    print(data);

    //set background
    String bgImage = data['isDayTime'] ? 'day.png' : 'night.jpg';
    Color? bgColor = (data['isDayTime']) ? Colors.yellow[100] : Colors.indigo[900];
    Color? textColor = data['isDayTime'] ? Colors.black : Colors.white;

    return Scaffold(
      backgroundColor: bgColor,
      body: SafeArea(
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/$bgImage'),
                fit: BoxFit.cover,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(0, 120, 0, 0),
              child: Column(
                children: <Widget>[
                  FlatButton.icon(
                    onPressed: (){
                      Navigator.pushNamed(context, '/choose_location');
                    },
                      icon: Icon(
                        Icons.location_on,
                        color: textColor,
                      ),
                      label: Text(
                        'Edit Location',
                        style: TextStyle(
                          color: textColor,
                        ),
                      ),
                  ),
                  SizedBox(height: 20.0,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        data['location'],
                        style: TextStyle(
                          fontSize: 28.0,
                          letterSpacing: 2.0,
                          color: textColor,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20.0,),
                  Text(
                    data['time'],
                    style: TextStyle(
                      fontSize: 66.0,
                      color: textColor,
                    ),
                  ),
                ],
              ),
            ),
          ),
      ),
    );
  }
}
