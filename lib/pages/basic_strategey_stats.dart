import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BasicStrategeyStats extends StatelessWidget {
  const BasicStrategeyStats({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: Builder(
            builder: (BuildContext context) {
              return IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: () {
                  Navigator.pop(context);
                },
              );
            },
          ),
          title: const Text('Basic Strategey Stats'),
          foregroundColor: Colors.white,
        ),
        body: SafeArea(child: Column(children: <Widget>[Text('STATS PAGE')])));
  }
}
