import 'package:count_champ/data/models/card_template.dart';
import 'package:count_champ/logic/cubits/basic_strategey_cubit/basic_strategey_cubit.dart';
import 'package:count_champ/logic/cubits/correct_plays_cubit/correct_plays_cubit.dart';
import 'package:count_champ/logic/cubits/settings/basic_strategey_settings_cubit/basic_strategey_settings_cubit.dart';
import 'package:count_champ/logic/cubits/deck_cubit/deck_cubit.dart';
import 'package:count_champ/widgets/correct_play_widget.dart';
import 'package:count_champ/widgets/basic_strategey_widgets/basic_strategey_settings_sidebar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

class BasicStrategeyTrainer extends StatefulWidget {
  const BasicStrategeyTrainer({Key? key}) : super(key: key);

  @override
  _BasicStrategeyTrainerState createState() => _BasicStrategeyTrainerState();
}

class _BasicStrategeyTrainerState extends State<BasicStrategeyTrainer> {
  @override
  Widget build(BuildContext context) {
    return (Scaffold(
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
          title: const Text('Basic Strategey Trainer'),
          foregroundColor: Colors.white,
        ),
        endDrawer: const Drawer(
            elevation: 16.0,
            child: SafeArea(
              child: GameSettingsSidebar(),
            )),
        body: SafeArea(
            child: Column(
          children: <Widget>[
            BlocBuilder<CorrectPlaysCubit, CorrectPlaysState>(
                builder: (context, state) {
              return CorrectPlayWidget(
                  playWasCorrect: state.playWasCorrect,
                  correctPlay: state.correctPlay,
                  hand: state.hand);
            }),
            BlocBuilder<DeckCubit, DeckState>(builder: (context, state) {
              if (state.dealerHand.isNotEmpty) {
                bool isHoleCard = false;
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
            Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
              ElevatedButton(
                  onPressed: () {
                    context.read<CorrectPlaysCubit>().checkPlay('hit');
                    context.read<BasicStrategeyCubit>().initNextHand();
                  },
                  child: const Text('Hit')),
              ElevatedButton(
                  onPressed: () {
                    context.read<CorrectPlaysCubit>().checkPlay('stand');
                    context.read<BasicStrategeyCubit>().initNextHand();
                  },
                  child: const Text('Stand')),
              ElevatedButton(
                  onPressed: () {
                    context.read<CorrectPlaysCubit>().checkPlay('double');
                    context.read<BasicStrategeyCubit>().initNextHand();
                  },
                  child: const Text('Double')),
              ElevatedButton(
                  onPressed: () {
                    context.read<CorrectPlaysCubit>().checkPlay('split');
                    context.read<BasicStrategeyCubit>().initNextHand();
                  },
                  child: const Text('Split')),
            ]),
            Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
              BlocBuilder<BasicStrategeySettingsCubit,
                  BasicStrategeySettingsState>(builder: (context, state) {
                if (state.practiceInsurance == true) {
                  return ElevatedButton(
                      onPressed: () {
                        context
                            .read<CorrectPlaysCubit>()
                            .checkPlay('insurance');
                        context.read<BasicStrategeyCubit>().initNextHand();
                      },
                      child: const Text('Insurance'));
                }
                return const SizedBox.shrink();
              }),
              BlocBuilder<BasicStrategeySettingsCubit,
                  BasicStrategeySettingsState>(builder: (context, state) {
                if (state.practiceFab4 == true ||
                    state.practiceIllustrious18 == true ||
                    state.practiceInsurance == true) {
                  return Column(
                    children: [
                      const Text('True Count:'),
                      BlocBuilder<DeckCubit, DeckState>(
                          builder: (context, state) {
                        return Text(state.trueCount.toString());
                      }),
                    ],
                  );
                }
                return const SizedBox.shrink();
              }),
              BlocBuilder<BasicStrategeySettingsCubit,
                  BasicStrategeySettingsState>(builder: (context, state) {
                if (state.canSurrender == true) {
                  return ElevatedButton(
                      onPressed: () {
                        context
                            .read<CorrectPlaysCubit>()
                            .checkPlay('surrender');
                        context.read<BasicStrategeyCubit>().initNextHand();
                      },
                      child: const Text('Surrender'));
                }
                return const SizedBox.shrink();
              }),
            ]),
          ],
        ))));
  }
}
