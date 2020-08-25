import 'package:fz.facemash/pages/about/about.dart';
import 'package:fz.facemash/pages/wallpapers/walls.dart';
import 'package:fz.facemash/constants/facemash.dart';
import 'package:fz.facemash/providers/fetchcat.dart';
import 'package:provider/provider.dart';
import '../../services/response.dart';

import 'package:flutter/material.dart';
import 'package:fz.facemash/widget/widget.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  void choiceAction(String choice) {
    if (choice == Facemash.info) {
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return AppInfo();
      }));
    }
  }

  // fetchData() async {
  //   setState(() {
  //     isLoading = true;
  //   });
  //   var res = await http.get(Facemash.url);
  //   var decodedRes = jsonDecode(res.body);
  //   // print(decodedRes.toString());
  //   usersapi = FacemashAPI.fromJson(decodedRes);
  //   setState(() {
  //     isLoading = false;
  //   });
  // }

  @override
  void initState() {
    Provider.of<Fetchcat>(context, listen: false).fetchData();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final categories = Provider.of<Fetchcat>(context);
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
      body: categories.isfetching
          ? Center(
              child: CircularProgressIndicator(),
            )
          : ListView.separated(
              itemBuilder: (context, index) => ListTile(
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        Walls(categories.getWalls()[index].category),
                  ),
                ),
                title: Text(
                  categories.getWalls()[index].category,
                  style: TextStyle(
                    color: Color(0xFF660000),
                  ),
                ),
              ),
              separatorBuilder: (context, index) => Divider(
                color: Color(0xFF660000),
              ),
              itemCount: categories.getWalls().length,
            ),
    );
  }
}
