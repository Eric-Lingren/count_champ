import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BsPlaysDealerRow extends StatelessWidget {
  final List dealerList = ['2', '3', '4', '5', '6', '7', '8', '9', '10', '11'];
  final String dealerText = 'Dealer';

  BsPlaysDealerRow({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: dealerList
                .map<Widget>((dealerCard) => Container(
                    decoration: const BoxDecoration(
                      border: Border(
                        bottom: BorderSide(width: 1.0, color: Colors.black),
                      ),
                      color: Colors.white,
                    ),
                    width: 20,
                    padding: const EdgeInsets.fromLTRB(1, 0, 1, 0),
                    child: Text(
                      dealerCard,
                      textAlign: TextAlign.center,
                    )))
                .toList()),
      ],
    );
  }
}
