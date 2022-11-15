import 'package:flutter/services.dart';
import 'dart:convert';


class Nameday {

  String name;
  String country;

  Nameday({this.country});

  Future<void> getNameday() async {
    try{
      String response = await rootBundle.loadString('assets/namedays.json');
      Map data = jsonDecode(response);
      DateTime now = new DateTime.now();
      this.name = data['${now.month}']['${now.day}']['namedays'][this.country];
    }
    catch (e) {
      print(e);
      this.name = 'Could not get nameday';
    }
  }
}
