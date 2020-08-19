import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ShowImage extends StatefulWidget {
  String imgpath;
  ShowImage(this.imgpath);

  @override
  _ShowImageState createState() => _ShowImageState();
}

class _ShowImageState extends State<ShowImage> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays([]);
    return Scaffold(
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: ClipRRect(
          child: Stack(
            children: <Widget>[
              CachedNetworkImage(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                imageUrl: widget.imgpath,
                fit: BoxFit.cover,
                alignment: Alignment.center,
                fadeInCurve: Curves.bounceIn,
                fadeInDuration: Duration(milliseconds: 1000),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
