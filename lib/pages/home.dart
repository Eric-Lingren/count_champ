import 'package:count_champ/data/models/card_template.dart';
import 'package:count_champ/logic/cubits/deck_cubit/deck_cubit.dart';
import 'package:flutter/material.dart';
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
          if (state.dealerHand.isNotEmpty) {
            return Row(
                children: state.dealerHand
                    .map<Widget>((card) => CardTemplate(
                            cardCode: card.code,
                            value: card.value,
                            isHoleCard: card.isHoleCard)
                        .getWidget())
                    .toList());
          }
          return const SizedBox.shrink();
        }),
        BlocBuilder<DeckCubit, DeckState>(builder: (context, state) {
          if (state.playerHand.isNotEmpty) {
            return Row(
                children: state.playerHand
                    .map<Widget>((card) => CardTemplate(
                            cardCode: card.code,
                            value: card.value,
                            isHoleCard: card.isHoleCard)
                        .getWidget())
                    .toList());
          }
          return const SizedBox.shrink();
        }),
        BlocBuilder<DeckCubit, DeckState>(builder: (context, state) {
          if (state.dealerHand.isNotEmpty) {
            print('dealer Hand');
            print(state.dealerHand[0].code);
            print(state.dealerHand[1].code);
          }
          if (state.playerHand.isNotEmpty) {
            print('Player Hand');
            print(state.playerHand[0].code);
            print(state.playerHand[1].code);
          }
          // if (state.dealtCards.isNotEmpty) {
          //   print('Dealt Cards');
          //   print(state.dealtCards.length);
          //   print('Dealt Cards First ${state.dealtCards[0].code}');
          //   print('Dealt Cards Last ${state.dealtCards.last.code}');
          // }
          return const SizedBox.shrink();
        }),
        ElevatedButton(
            onPressed: () {
              context.read<DeckCubit>().testFunc();
            },
            child: Text('Deal Cards'))
      ],
    ))));
  }
}
