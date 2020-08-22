import 'dart:convert';
import 'package:facemash_api/pages/walls.dart';
import 'package:facemash_api/constanse/facemash.dart';
import '../services/response.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  FacemashAPI usersapi;
  bool isLoading = false;

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
      appBar: AppBar(
        title: Text("Facemash API"),
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
                title: Text(usersapi.categories[index].category),
              ),
              separatorBuilder: (context, index) => Divider(
                color: Colors.black,
              ),
              itemCount: usersapi.categories.length,
            ),
    );
  }
}
