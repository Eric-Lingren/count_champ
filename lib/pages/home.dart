import 'package:count_champ/logic/cubits/deck_cubit/deck_cubit.dart';
import 'package:count_champ/models/deck/deck.dart';
import 'package:count_champ/utils/app_init.dart';
import 'package:flutter/material.dart';
import 'package:count_champ/utils/services/json_storage_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return (Scaffold(
        body: SafeArea(
            child: Column(
      children: <Widget>[
        ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context, '/basic_strat_trainer');
            },
            child: Text('Basic Strategy')),
        BlocBuilder<DeckCubit, DeckState>(builder: (context, state) {
          // print(state.deckRepository);
          if(state.remainingCards.length > 0){
            print('This is Shuffled Card:');
            print(state.remainingCards[0].code);
          }
          // print(state.testData);
          // if (state is DeckLoadedState) {
          //   print('loaded');
          // } else {
          //   print('not noaded');
          // }
          return const Text('HELLO ');
        }),
        ElevatedButton(
            onPressed: () {
              context.read<DeckCubit>().testFunc();
            },
            child: Text('Test Set State'))
      ],
    ))));
  }
}
