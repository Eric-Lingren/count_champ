import 'package:count_champ/data/models/card_template.dart';
import 'package:count_champ/logic/cubits/basic_strategey_cubit.dart/basic_strategey_cubit.dart';
import 'package:count_champ/logic/cubits/deck_cubit/deck_cubit.dart';
import 'package:count_champ/widgets/game_settings_sidebar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

class BasicStrategeyTrainer extends StatefulWidget {
  const BasicStrategeyTrainer({Key? key}) : super(key: key);

  @override
  _BasicStrategeyTrainerState createState() => _BasicStrategeyTrainerState();
}

class _BasicStrategeyTrainerState extends State<BasicStrategeyTrainer> {
  bool isSwitched = false;



  bool canDAS = true;
  bool canDoubleAny2 = true; // False = reno rules - double only on 9-11 hard
  bool canResplit = true;
  bool canSplitAces = true;
  bool canHitAfterSplitAces = true;
  bool dealerHitsSoft17 = false;
  bool canEarlySurrender = false;
  bool canLateSurrender = true;
  bool isNoPeek = false;
  int deckQuantity = 1;
  double deckPenetration = 1.00;


  @override
  Widget build(BuildContext context) {
    return (Scaffold(
        appBar: AppBar(
          leading: Builder(
            builder: (BuildContext context) {
              return IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: () { Navigator.pop(context); },
              );
            },
          ),
          title: const Text('Basic Strategey Trainer'),
          foregroundColor: Colors.white,
        ),
        endDrawer: const Drawer(
          elevation: 16.0,
          child: SafeArea(
            child: GameSettingsSidebar(),
          )
        ),
        body: SafeArea(
            child: Column(
          children: <Widget>[
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
            // BlocBuilder<DeckCubit, DeckState>(builder: (context, state) {
            //   if (state.dealerHand.isNotEmpty) {
            //     print('dealer Hand');
            //     print(state.dealerHand[0].code);
            //     print(state.dealerHand[1].code);
            //   }
            //   if (state.playerHand.isNotEmpty) {
            //     print('Player Hand');
            //     print(state.playerHand[0].code);
            //     print(state.playerHand[1].code);
            //   }
            //   return const SizedBox.shrink();
            // }),
            Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
              ElevatedButton(
                  onPressed: () {
                    context.read<BasicStrategeyCubit>().choosePlay('hit');
                  },
                  child: const Text('Hit')),
              ElevatedButton(
                  onPressed: () {
                    context.read<BasicStrategeyCubit>().choosePlay('stand');
                  },
                  child: const Text('Stand')),
              ElevatedButton(
                  onPressed: () {
                    context.read<BasicStrategeyCubit>().choosePlay('double');
                  },
                  child: const Text('Double')),
              ElevatedButton(
                  onPressed: () {
                    context.read<BasicStrategeyCubit>().choosePlay('split');
                  },
                  child: const Text('Split')),
            ]),
          ],
        ))));
  }
}
