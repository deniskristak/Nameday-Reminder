import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:world_time_app/services/namedays.dart';

class ChooseCountry extends StatefulWidget {
  @override
  _ChooseCountryState createState() => _ChooseCountryState();
}

class _ChooseCountryState extends State<ChooseCountry> {

  List<Nameday> locations_namedays = [];
  List<String> locations = ["at","bg","cz", "de", "dk", "ee", "es", "fi", "fr","gr","hr","hu","it","lt","lv","pl","ru","se","sk","us"];




  void updateNameday(index) async {
    Nameday instance = Nameday(country:locations[index]);
    await instance.getNameday();
    Navigator.pop(context, {
      'name': instance.name,
      'country': instance.country,
    });
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.grey[900],
        title: Text('Choose a country'),
        centerTitle: true,
        elevation: 0,
      ),
      body: ListView.builder(
          itemCount: this.locations.length,
          itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 1.0, horizontal: 4.0),
            child: Card(
              child: ListTile(
                onTap: () {
                  updateNameday(index);
                },
                title: Text(this.locations[index]),
                leading: CircleAvatar(
                ),
              ),
            ),
          );
        }
      ),
    );
  }
}
