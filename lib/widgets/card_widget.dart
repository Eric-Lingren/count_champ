import 'package:flutter/material.dart';

class CardWidget extends StatelessWidget {
  final String cardCode;
  final String initImagePath = 'assets/images/cards/card_faces/';
  final isHoleCard;

  const CardWidget({Key? key, required this.cardCode, required this.isHoleCard})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    String imagePath;
    if (isHoleCard) {
      imagePath = 'assets/images/cards/card_backs/card_back_red_1.png';
    } else {
      imagePath = 'assets/images/cards/card_faces/' + cardCode + '.png';
    }

    return Image(
      image: AssetImage(imagePath),
      width: 175, // TODO - Make card image dimensions dynamic based on screen size
    );
  }
}