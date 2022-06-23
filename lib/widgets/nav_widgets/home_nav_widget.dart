import 'dart:ffi';

import 'package:flutter/material.dart';

class HomeNavWidget extends StatelessWidget {
  final String navLink;
  final String navTitle;
  final String navSubtitle;
  final double rightPosition;

  const HomeNavWidget(
      {Key? key, required this.navLink, required this.navTitle, required this.navSubtitle, required this.rightPosition})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250,
      height: 400,
      child: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, navLink);
            },
            child: Container(
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(
                  Radius.circular(10.0),
                ),
                color: Colors.black,
                image: DecorationImage(
                  fit: BoxFit.cover,
                  colorFilter: ColorFilter.mode(
                      Colors.black.withOpacity(0.7), BlendMode.dstATop),
                  image: const AssetImage(
                      'assets/images/backgrounds/home_nav_card.jpeg'),
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 20,
            // right: rightPosition,
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(right:20), //apply padding to some sides only
                  child: Text(
                  navTitle,
                  // textAlign: TextAlign.left,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    decoration: TextDecoration.none,
                  ),
                ),),
                SizedBox(height: 5),

                Padding(
                  padding: const EdgeInsets.only(left:10), //apply padding to some sides only
                  child: Text(
                  navSubtitle,
                  textAlign: TextAlign.right,
                  style: const TextStyle(
                      fontSize: 8,
                      color: Colors.white,
                      decoration: TextDecoration.none,
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.w100),
                ),
                ),
                
              ],
            ),
          ),
        ],
      ),
    );
  }
}
