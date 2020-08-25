import 'package:fz.facemash/constants/facemash.dart';
import 'package:fz.facemash/providers/providers.dart';
import 'package:provider/provider.dart';

import '../home/HomePage.dart';
import 'package:flutter/material.dart';

class Config extends StatefulWidget {
  @override
  _ConfigState createState() => _ConfigState();
}

class _ConfigState extends State<Config> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: Providers.providers(),
      child: MaterialApp(
        title: Facemash.appname,
        debugShowCheckedModeBanner: false,
        home: HomePage(),
      ),
    );
  }
}
