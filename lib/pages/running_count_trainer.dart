import 'package:count_champ/data/models/card_template.dart';
import 'package:count_champ/logic/cubits/count_cubit/count_cubit.dart';
import 'package:count_champ/logic/cubits/deck_cubit/deck_cubit.dart';
import 'package:count_champ/logic/cubits/running_count_stats_cubit/session/running_count_session_stats_cubit.dart';
import 'package:count_champ/logic/cubits/settings/count_settings_cubit/count_settings_cubit.dart';
import 'package:count_champ/utils/helpers/format_running_count.dart';
import 'package:count_champ/widgets/count_widgets/check_count_form.dart';
import 'package:count_champ/widgets/count_widgets/running_count_header_widget.dart';
import 'package:count_champ/widgets/count_widgets/running_count_settings_sidebar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

class RunningCountTrainer extends StatefulWidget {
  const RunningCountTrainer({Key? key}) : super(key: key);

  @override
  _RunningCountTrainerState createState() => _RunningCountTrainerState();
}

class _RunningCountTrainerState extends State<RunningCountTrainer> {
  String correctPlayText = '';
  String formattedCount = '';
  bool isPlayingHalves = false;
  double _cardsPerSecond = 1.0;
  // int _cutCardIndex = 0;
  // int _dealtCardsQuantity = 0;
  // double _runningCount = 0;

  @override
  Widget build(BuildContext context) {
    return (Scaffold(
        appBar: AppBar(
          leading: Builder(
            builder: (BuildContext pageContext) {
              // TODO Stop speed count if page navigated away from
              // return BlocBuilder<CountCubit, CountState>(
              //     builder: (countContext, countState) {
              //       return IconButton(
              //   icon: const Icon(Icons.arrow_back),
              //   onPressed: () {
              //     countContext.read<CountCubit>().stopSpeedCount();
              //     // countContext.read<CountCubit>().resetCheckRunningCount();
              //     context.read<DeckCubit>().shuffleDeck();
              //     Navigator.pop(pageContext);
              //     // TODO Stop speed count if page navigated away from
              //   },
              // );
              // });

              return IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: () {
                  context.read<CountCubit>().stopSpeedCount();
                  context.read<DeckCubit>().shuffleDeck();
                  Navigator.pop(pageContext);
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
            RunningCountHeaderWidget(),

            //* Renders the Cards Dealt
            BlocBuilder<DeckCubit, DeckState>(builder: (context, state) {
              if (state.playerHand.isNotEmpty) {
                // _cutCardIndex = state.cutCardIndex;
                // _dealtCardsQuantity = state.playerHand.length;
                // _runningCount = state.runningCount;
                return Row(
                    mainAxisAlignment: MainAxisAlignment.center,
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
                  builder: (context, countSettingsState) {
                if (countSettingsState.speedCountEnabled == true &&
                    countSettingsState.isSpeedCountRunning == false) {
                  _cardsPerSecond = countSettingsState.cardsPerSecond;
                  return ElevatedButton(
                      onPressed: () {
                        context
                            .read<CountCubit>()
                            .beginSpeedCount(_cardsPerSecond);
                        context
                            .read<CountSettingsCubit>()
                            .startingSpeedCount(true);
                      },
                      child: const Text('Start'));
                } else if (countSettingsState.speedCountEnabled == true &&
                    countSettingsState.isSpeedCountRunning == true) {
                  return BlocBuilder<DeckCubit, DeckState>(
                      builder: (context, deckState) {
                    if (deckState.cutCardIndex <= deckState.dealtCards.length) {
                      context.read<CountCubit>().stopSpeedCount();
                      return BlocBuilder<CountCubit, CountState>(
                          builder: (context, state) {
                        if (state.didCheckResult == false) {
                          return CheckCountForm(
                              runningCount: deckState.runningCount);
                        } else {
                          formattedCount = FormatRunningCount(
                                  deckState.runningCount, isPlayingHalves)
                              .format();
                          if (state.wasPlayerCountCorrect) {
                            correctPlayText = 'Congratulations!';
                          } else {
                            correctPlayText = 'The count was $formattedCount';
                          }
                          return Column(
                            children: [
                              Text(
                                correctPlayText,
                                style: const TextStyle(
                                    fontSize: 18.0, color: Colors.black),
                              ),
                              ElevatedButton(
                                  onPressed: () {
                                    context.read<DeckCubit>().shuffleDeck();
                                    context
                                        .read<CountCubit>()
                                        .resetCheckRunningCount();
                                    context
                                        .read<CountCubit>()
                                        .beginSpeedCount(_cardsPerSecond);
                                    context
                                        .read<CountSettingsCubit>()
                                        .startingSpeedCount(true);
                                  },
                                  child: const Text('Play Again')),
                            ],
                          );
                        }
                      });
                    }
                    return const SizedBox.shrink();
                  });
                } else {
                  return BlocBuilder<DeckCubit, DeckState>(
                      builder: (context, deckState) {
                    if (deckState.cutCardIndex <= deckState.dealtCards.length) {
                      return BlocBuilder<CountCubit, CountState>(
                          builder: (context, state) {
                        if (state.didCheckResult == false) {
                          return CheckCountForm(
                              runningCount: deckState.runningCount);
                        } else {
                          formattedCount = FormatRunningCount(
                                  deckState.runningCount, isPlayingHalves)
                              .format();
                          if (state.wasPlayerCountCorrect) {
                            correctPlayText = 'Congratulations!';
                          } else {
                            correctPlayText = 'The count was $formattedCount';
                          }
                          return Column(
                            children: [
                              Text(
                                correctPlayText,
                                style: const TextStyle(
                                    fontSize: 18.0, color: Colors.black),
                              ),
                              ElevatedButton(
                                  onPressed: () {
                                    context.read<DeckCubit>().shuffleDeck();
                                    context
                                        .read<CountCubit>()
                                        .resetCheckRunningCount();
                                  },
                                  child: const Text('Play Again')),
                            ],
                          );
                        }
                      });
                    } else {
                      return ElevatedButton(
                          onPressed: () {
                            context.read<CountCubit>().initNextCard();
                            // context.read<RunningCountSessionStatsCubit>().monitorCountSettingsCubit();
                          },
                          child: const Text('Deal'));
                    }
                  });
                }
              }),
            ]),
            const SizedBox(),
            BlocBuilder<CountSettingsCubit, CountSettingsState>(
                builder: (context, state) {
              if (state.showCount == true) {
                if (state.halvesEnabled == true) {
                  isPlayingHalves = true;
                } else {
                  isPlayingHalves = false;
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
                          formattedCount = FormatRunningCount(
                                  state.runningCount, isPlayingHalves)
                              .format();
                          return Text(
                            formattedCount,
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
          ],
        ))));
  }
}
