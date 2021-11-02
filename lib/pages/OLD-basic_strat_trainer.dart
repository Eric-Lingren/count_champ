
// working example of how to use a stateful widget to render data via another widget using a class



// import 'dart:ffi';

// import 'package:count_champ/models/card_template.dart';
// import 'package:count_champ/widgets/card_widget.dart';
// import 'package:flutter/material.dart';

// class BasicStratTrainer extends StatefulWidget {
//   const BasicStratTrainer({Key? key}) : super(key: key);

//   @override
//   _BasicStratTrainerState createState() => _BasicStratTrainerState();
// }

// class _BasicStratTrainerState extends State<BasicStratTrainer> {
//   List<String> dealtCards = [];

//   @override
//   void initState() {
//     super.initState();
//     dealCards();
//   }

//   void dealCards() {
//     int counter = 0;
//     List<String> availableValues = ['2', '3', '4', '5', '6'];
//     List<String> availableSuits = ['c', 'd', 'h', 's'];
//     List<String> tempCards = [];

//     while (counter < 4) {
//       String randomValue = (availableValues..shuffle()).first;
//       String randomSuit = (availableSuits..shuffle()).first;
//       String newCardCode = randomValue + randomSuit;
//       tempCards.add(newCardCode);
//       counter++;
//     }

//     setState(() {
//       dealtCards = tempCards;
//     });
//     // CardTemplate(cardCode: dealtCards[0]).getWidget();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         backgroundColor: Colors.green[300],
//         appBar: AppBar(
//           backgroundColor: Colors.grey[850],
//           title: Text('Basic Strategy'),
//           centerTitle: true,
//           elevation: 0,
//           actions: [],
//         ),
//         body: Column(children: <Widget>[
//           Row(children: <Widget>[
//             CardTemplate(cardCode: dealtCards[0]).getWidget(),
//             CardTemplate(cardCode: dealtCards[1]).getWidget(),
//           ]),
//           Row(children: <Widget>[
//             CardTemplate(cardCode: dealtCards[2]).getWidget(),
//             CardTemplate(cardCode: dealtCards[3]).getWidget(),
            
//           ]),
//           Row(children: <Widget>[
//             ElevatedButton(
//               onPressed: () {
//                 dealCards();
//               },
//               child: Text('Deal Cards'),
//             ),
//             ElevatedButton(
//               onPressed: () {
//                 dealCards();
//               },
//               child: Text('TEST ME'),
//             ),
//           ]),
//         ]));
//   }
// }
