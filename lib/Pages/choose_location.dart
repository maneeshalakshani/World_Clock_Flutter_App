import 'package:flutter/material.dart';

class ChooseLocation extends StatefulWidget {
  @override
  _ChooseLocationState createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {

  int counter = 0;
  
  // void getData() async {
  //   //Simulate Network request for a username
  //   String username = await Future.delayed(Duration(seconds: 3), (){
  //     return 'Maniya';
  //   });
  //
  //   //Simulate network request to get bio of the username
  //   String bio = await Future.delayed(Duration(seconds: 2), (){
  //     return "Vegan musician and egg collector";
  //   });
  //
  //   print('username: $username, bio: $bio');
  // }
  //
  // @override
  // void initState() {
  //   super.initState();
  //   getData();
  //   print('Hey there, Inside initState method');
  // }

  @override
  Widget build(BuildContext context) {
    print('function runs inside build');
    return Scaffold(
      backgroundColor: Colors.blueGrey[800],
      appBar: AppBar(
        backgroundColor: Colors.blueGrey[900],
        title: Text('Choose a Location'),
        centerTitle: true,
        elevation: 0.0,
      ),
      body: RaisedButton(
        onPressed: (){
          setState(() {
            counter++;
          });
        },
        child: Text('Counter : $counter'),
      ),
    );
  }
}
