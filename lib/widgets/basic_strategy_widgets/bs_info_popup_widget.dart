import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BsInfoPopupWidget extends StatelessWidget {
  String infoTitle = '';
  String playerAdvantage;
  String description;
  BsInfoPopupWidget({Key? key, required this.infoTitle, required this.playerAdvantage, required this.description}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
        backgroundColor: Colors.transparent,
        insetPadding: const EdgeInsets.all(10),
        child: Container(
            width: double.infinity,
            height: 400,
            padding: const EdgeInsets.fromLTRB(20, 20, 20, 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Colors.lightBlue,
            ),
            child: Column(
              children: [
                Text(
                  infoTitle,
                  // context._infoPopupTitle,
                  style: TextStyle(fontSize: 24, color: Colors.white),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 10),
                Text(
                  'Player Advantage: $playerAdvantage',
                  style: const TextStyle(fontSize: 14, color: Colors.white),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 20),
                Text(
                  description,
                  style: const TextStyle(fontSize: 18, color: Colors.white),
                  textAlign: TextAlign.center,
                ),
                
              ],
            )));
  }
}
