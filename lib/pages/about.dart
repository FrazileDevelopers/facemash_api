import 'package:facemash_api/constanse/facemash.dart';
import 'package:flutter/material.dart';

class AppInfo extends StatefulWidget {
  @override
  _AppInfoState createState() => _AppInfoState();
}

class _AppInfoState extends State<AppInfo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF660000),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icon(
            Icons.arrow_back,
          ),
        ),
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Text(
            Facemash.appname,
            style: TextStyle(
              color: Colors.white,
              fontSize: 24.0,
            ),
          ),
          Padding(padding: EdgeInsets.all(8)),
          Text(
            Facemash.appversion,
            style: TextStyle(
              color: Colors.white,
              fontSize: 24.0,
            ),
          ),
          Column(
            children: <Widget>[
              Padding(padding: EdgeInsets.all(8)),
              Text(
                "Devloped By",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24.0,
                ),
              ),
              Text(
                "Parth Aggarwal & Mohd. Sahil",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24.0,
                ),
              )
            ],
          ),
        ],
      )),
    );
  }
}
