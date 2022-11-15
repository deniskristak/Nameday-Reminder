import 'package:flutter/material.dart';
import 'package:world_time_app/services/namedays.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  void setupNameday() async {
    Nameday instance = Nameday();
    await instance.getNameday();
    Navigator.pushReplacementNamed(context, '/home', arguments: {
      'name': instance.name,
    });
  }

  @override
  void initState() {
    super.initState();
    setupNameday();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      body: Center(
        child: SpinKitFadingCube(
          color: Colors.red,
          size: 50.0,
        )
      )
    );
  }
}

