import 'dart:html';
import 'dart:io';
import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Covid 19',
      theme: ThemeData(
        scaffoldBackgroundColor: kBackgroundColor,
        fontFamily: "poppins",
        textTheme: TextTheme(
          body1: TextStyle(color: kBodyTextColor),
        )),
        home: HomeScreen(),
      );
  }
}

class HomeScreen extends StatelessWidget {
    @override
      Widget build(BuildContext context) {
            return Scaffold(
              body: Column(
                children: <Widget>[
                  ClipPath(
                  clipper: MyClipper,
                  child: Container(
                    padding: EdgeInsets.only(left: 40, top: 50, right: 20),
                    height: 350,
                    width: double.infinity,
                    decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topRight,
                      end: Alignment.bottomLeft,
                      colors: [
                        Color(0xFF3383CD),
                        Color(0xFF11249F),
                      ],
                    ),
                    image: DecorationImage(
                      image: AssetImage("assets/image/virus.png"),
                    ),
                   ),
                   child: Column(
                     crossAxisAlignment: CrossAxisAlignment.start,
                     children: <Widget>[
                     Align(
                       alignment: Alignment.topRight,
                      child: SvgPicture.asset("assets/icons/menu.svg"),
                     ),
                     SizedBox(height: 20),
                     Expanded(
                        child: Stack(
                          children: <Widget>[SvgPicture.asset("assetName")],),
                        ),
                     ],
                     ),
                  ),
                 ),
                ],
              ),
            );
      }
}

class MyClipper extends CustomClipper<Path> {
  @Override
  Path getClip(Size size){
    var path = Path();
    path.lineTo(0, size.height - 80);
    path.quadraticBezierTo(
      size.width / 2, size.height, size.width, size.height - 80);
      path.lineTo(size.width, 0);
      path.close();
      return path;
  }
}