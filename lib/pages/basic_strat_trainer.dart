import 'package:count_champ/common/playing_card.dart';
import 'package:flutter/material.dart';

class BasicStratTrainer extends StatefulWidget {
  const BasicStratTrainer({Key? key}) : super(key: key);

  @override
  _BasicStratTrainerState createState() => _BasicStratTrainerState();
}

class _BasicStratTrainerState extends State<BasicStratTrainer> {
  int counter = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[300],
      appBar: AppBar(
        backgroundColor: Colors.grey[850],
        title: Text('Basic Stragey'),
        centerTitle: true,
        elevation: 0,
        actions: [],
      ),
      // body: ElevatedButton(
      //   onPressed: () {
      //     setState(() {
      //       counter += 1;
      //     });
      //   },
      //   child: Text('counter is $counter'),
      body: Row(
        children: <Widget>[
          PlayingCard(),
          PlayingCard(),
        ] 
      )
    );
  }
}
