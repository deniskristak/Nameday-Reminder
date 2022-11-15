import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  Map data = {};

  @override
  Widget build(BuildContext context) {

    data = data.isNotEmpty ? data : ModalRoute.of(context).settings.arguments;

    // set background image
    String bgImage = 'moon.jpg';
    Color bgColor = Colors.grey[900];

    return Scaffold(
      backgroundColor: bgColor,
      body: SafeArea(
        child: Container(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 120.0, 20, 0),
            child: Column(
              children: <Widget>[
                Center(
                  child: Text(
                      "Namedays in ${data['country']}:",
                      style: TextStyle(
                        fontSize: 30.0,
                        color: Colors.white,
                      )
                  ),
                ),
                SizedBox(height: 50),
                Center(
                  child: Text(
                      data['name'] ?? '',
                      style: TextStyle(
                        fontSize: 50.0,
                        color: Colors.white,
                      )
                  ),
                ),
                Spacer(),
                Container(
                  margin: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                  child: ElevatedButton(
                      style: ButtonStyle(backgroundColor: MaterialStateProperty.all<Color>(Colors.grey[800])),
                      onPressed: () async {
                        dynamic result = await Navigator.pushNamed(context, '/countries');
                        if(result != null){
                          setState(() {
                            data = {
                              'name': result['name'],
                              'country': result['country'],
                            };
                          });
                        }
                      },
                      child: Text(
                          "Change country",
                          style: TextStyle(
                            fontSize: 35.0,
                            color: Colors.white,
                            )),
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
