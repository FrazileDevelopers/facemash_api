import 'dart:convert';
import 'package:facemash_api/pages/about.dart';
import 'package:facemash_api/pages/walls.dart';
import 'package:facemash_api/constanse/facemash.dart';
import '../services/response.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:facemash_api/widget/widget.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  FacemashAPI usersapi;
  bool isLoading = false;

  void choiceAction(String choice) {
    if (choice == Facemash.info) {
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return AppInfo();
      }));
    }
  }

  fetchData() async {
    setState(() {
      isLoading = true;
    });
    var res = await http.get(Facemash.url);
    var decodedRes = jsonDecode(res.body);
    // print(decodedRes.toString());
    usersapi = FacemashAPI.fromJson(decodedRes);
    setState(() {
      isLoading = false;
    });
  }

  @override
  void initState() {
    fetchData();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Color(0xFF660000),
      appBar: AppBar(
        backgroundColor: Color(0xFF660000),
        title: brandName(),
        actions: <Widget>[
          PopupMenuButton<String>(
            onSelected: choiceAction,
            itemBuilder: (BuildContext context) {
              return Facemash.choices.map((String choice) {
                return PopupMenuItem<String>(
                  value: choice,
                  child: Text(
                    choice,
                  ),
                );
              }).toList();
            },
          ),
        ],
      ),
      body: isLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : ListView.separated(
              itemBuilder: (context, index) => ListTile(
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        Walls(usersapi.categories[index].category),
                  ),
                ),
                title: Text(
                  usersapi.categories[index].category,
                  style: TextStyle(
                    color: Color(0xFF660000),
                  ),
                ),
              ),
              separatorBuilder: (context, index) => Divider(
                color: Color(0xFF660000),
              ),
              itemCount: usersapi.categories.length,
            ),
    );
  }
}
