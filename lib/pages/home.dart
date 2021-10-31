import 'package:flutter/material.dart';
import 'package:count_champ/utils/services/json_storage_service.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();

  void initDataFetch() async {
    var cardsData = await readJson();
    print(cardsData[0].image);
  }
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    widget.initDataFetch();

    return (Scaffold(
        body: SafeArea(
            child: Column(
      children: <Widget>[
        TextButton(
            onPressed: () {
              Navigator.pushNamed(context, '/basic_strat_trainer');
            },
            child: Text('Basic Strategy'))
      ],
    ))));
  }
}
