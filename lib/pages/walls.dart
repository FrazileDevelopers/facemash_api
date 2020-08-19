import 'dart:convert';

import 'package:facemash_api/pages/show_image.dart';
import 'package:facemash_api/services/girls.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Walls extends StatefulWidget {
  String cat;
  Walls(this.cat);
  @override
  _WallsState createState() => _WallsState();
}

class _WallsState extends State<Walls> {
  String url = 'https://facemash.co.in/api.php?cat=';
  Girls usersapi;
  bool isLoading = false;
  String imageurl = 'http://facemash.co.in/images/';
  fetchData() async {
    setState(() {
      isLoading = true;
    });
    var res = await http.get(url + widget.cat);
    var decodedRes = jsonDecode(res.body);
    // print(decodedRes.toString());
    usersapi = Girls.fromJson(decodedRes);
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
        title: Text('Wallpaper'),
      ),
      body: isLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : GridView.count(
              childAspectRatio: .64,
              crossAxisCount: 2,
              children: List.generate(
                usersapi.girls.length,
                (index) => Container(
                  child: InkWell(
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ShowImage(imageurl +
                            usersapi.girls[index].dirname +
                            '/' +
                            usersapi.girls[index].filename),
                      ),
                    ),
                    child: Hero(
                      child: FadeInImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(imageurl +
                            usersapi.girls[index].dirname +
                            '/' +
                            usersapi.girls[index].filename),
                        placeholder: AssetImage('assets/girl.webp'),
                      ),
                      tag: usersapi.girls[index].imageId,
                    ),
                  ),
                ),
              ),
            ),
    );
  }
}
