import 'dart:async';

import 'package:count_champ/data/models/card_template.dart';
import 'package:count_champ/logic/cubits/basic_strategy_cubit/basic_strategy_cubit.dart';
import 'package:count_champ/logic/cubits/correct_plays_cubit/correct_plays_cubit.dart';
import 'package:count_champ/logic/cubits/count_cubit/count_cubit.dart';
import 'package:count_champ/logic/cubits/deck_cubit/deck_cubit.dart';
import 'package:count_champ/logic/cubits/settings/basic_strategy_settings_cubit/basic_strategy_settings_cubit.dart';
import 'package:count_champ/logic/cubits/settings/count_settings_cubit/count_settings_cubit.dart';
import 'package:count_champ/widgets/basic_strategy_widgets/basic_strategy_settings_sidebar.dart';
import 'package:count_champ/widgets/correct_play_widget.dart';
import 'package:count_champ/widgets/count_widgets/count_settings_sidebar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

class RunningCountTrainer extends StatefulWidget {
  const RunningCountTrainer({Key? key}) : super(key: key);

  @override
  _RunningCountTrainerState createState() => _RunningCountTrainerState();
}

class _RunningCountTrainerState extends State<RunningCountTrainer> {
  @override
  Widget build(BuildContext context) {
    return (Scaffold(
        appBar: AppBar(
          leading: Builder(
            builder: (BuildContext context) {
              return IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: () {
                  context.read<DeckCubit>().shuffleDeck();
                  Navigator.pop(context);
                },
              );
            },
          ),
          title: const Text('Running Count Trainer'),
          foregroundColor: Colors.white,
        ),
        endDrawer: const Drawer(
            elevation: 16.0,
            child: SafeArea(
              child: CountSettingsSidebar(),
            )),
        body: SafeArea(
            child: Column(
          children: <Widget>[
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
              BlocBuilder<CountSettingsCubit, CountSettingsState>(
                  builder: (context, state) {
                if (state.speedCountEnabled == true &&
                    state.isSpeedCountRunning == false) {
                  return ElevatedButton(
                      onPressed: () {
                        context
                            .read<CountCubit>()
                            .beginSpeedCount(state.cardsPerSecond);
                        context
                            .read<CountSettingsCubit>()
                            .startingSpeedCount(true);
                      },
                      child: const Text('Start'));
                } else if (state.speedCountEnabled == true &&
                    state.isSpeedCountRunning == true) {
                  return BlocBuilder<CountCubit, CountState>(
                      builder: (context, state) {
                    return ElevatedButton(
                        onPressed: () {
                          context.read<CountCubit>().stopSpeedCount();
                          context
                              .read<CountSettingsCubit>()
                              .startingSpeedCount(false);
                        },
                        child: const Text('Stop'));
                  });
                }
                //* Default return:
                return ElevatedButton(
                    onPressed: () {
                      context.read<CountCubit>().initNextCard();
                    },
                    child: const Text('Deal'));
              }),
            ]),
            const SizedBox(height: 30),

            BlocBuilder<CountSettingsCubit, CountSettingsState>(
                builder: (context, state) {
              if (state.showCount == true) {
                String _runningCountType = 'int';
                if (state.halvesEnabled == true) {
                  //* Sets the type in int to display
                  _runningCountType = 'double';
                }
                return Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text(
                          'Running Count:',
                          style: TextStyle(
                            fontSize: 20.0,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        BlocBuilder<DeckCubit, DeckState>(
                            builder: (context, state) {
                          String leadingSymbol = '';
                          if (state.runningCount > 0) leadingSymbol = '+';
                          String _countValue = '';
                          if (_runningCountType == 'int') {
                            _countValue = state.runningCount.toInt().toString();
                          } else{
                            _countValue = state.runningCount.toString();
                          }
                          return Text(
                            leadingSymbol + _countValue,
                            style: const TextStyle(
                                fontSize: 28.0,
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          );
                        }),
                      ],
                    )
                  ],
                );
              }
              //* Default return:
              return const SizedBox.shrink();
            }),

            // Row(
            //   mainAxisAlignment: MainAxisAlignment.center,
            //   children: const [
            //     Text(
            //         'Running Count:',
            //             style: TextStyle(
            //             fontSize: 20.0,
            //           ),
            //         ),
            //   ],
            // ),
            // const SizedBox(height: 10),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.center,
            //   children: [
            //     BlocBuilder<DeckCubit, DeckState>(builder: (context, state) {
            //       return Text(
            //         state.runningCount.toString(),
            //           style: const TextStyle(
            //             fontSize: 28.0,
            //             color: Colors.black,
            //             fontWeight: FontWeight.bold
            //           ),
            //         );
            //     }),
            //   ],
            // )
          ],
        ))));
  }
}
