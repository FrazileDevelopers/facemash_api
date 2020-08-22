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
                fadeInDuration: Duration(milliseconds: 500),
              ),
              Positioned(
                bottom: MediaQuery.of(context).size.height * .07,
                left: MediaQuery.of(context).size.width * .08,
                right: MediaQuery.of(context).size.width * .27,
                child: MaterialButton(
                  splashColor: Colors.grey[100],
                  color: Colors.white.withOpacity(.47),
                  textColor: Colors.white,
                  elevation: 5.0,
                  height: 40.0,
                  // focusColor: Colors.orange,
                  // minWidth: 50.0,
                  child: Text("Download"),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(40.0),
                  ),
                  onPressed: () {},
                ),
              ),
              Positioned(
                bottom: MediaQuery.of(context).size.height * .07,
                // right: MediaQuery.of(context).size.width * .2,
                left: MediaQuery.of(context).size.width * .72,
                child: IconButton(
                  icon: Icon(Icons.share),
                  onPressed: () {},
                  color: Colors.white,
                ),
              ),
              Positioned(
                bottom: MediaQuery.of(context).size.height * .07,
                // right: MediaQuery.of(context).size.width * .2,
                left: MediaQuery.of(context).size.width * .84,
                child: IconButton(
                  icon: Icon(Icons.wallpaper),
                  onPressed: () {},
                  color: Colors.white,
                ),
              ),
              Align(
                alignment: Alignment.topCenter,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    AppBar(elevation: 0.0, backgroundColor: Colors.transparent),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
