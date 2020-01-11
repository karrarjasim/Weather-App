import 'package:flutter/material.dart';
import 'dart:ui' as ui;

Widget buildInfo(String title, String data, String unit) {
  return Container(
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        Text(
          title,
          style: TextStyle(color: Colors.white, fontSize: 17.0),
        ),
        Text(
          data + ' ' + unit,
          style: TextStyle(
            color: Colors.white,
            fontSize: 17.0,
          ),
        ),
      ],
    ),
  );
}

Widget generateBluredImage() {
  return new Container(
    decoration: new BoxDecoration(
      image: new DecorationImage(
        image: new NetworkImage(
            'https://i.pinimg.com/564x/b7/82/88/b782889ff778520fb6d66d51226dd526.jpg'),
        fit: BoxFit.cover,
      ),
    ),
    //I blured the parent container to blur background image, you can get rid of this part
    child: new BackdropFilter(
      filter: new ui.ImageFilter.blur(sigmaX: 1.0, sigmaY: 1.0),
      child: new Container(
        //you can change opacity with color here(I used black) for background.
        decoration: new BoxDecoration(color: Colors.black.withOpacity(0.1)),
      ),
    ),
  );
}

Widget infoWidget(String img, String title, String data) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceAround,
    children: <Widget>[
      Image.asset(
        'assets/images/$img',
        height: 40,
      ),
      Text(title),
      Text(data),
    ],
  );
}
