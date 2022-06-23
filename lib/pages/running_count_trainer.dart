import 'package:count_champ/data/models/card_template.dart';
import 'package:count_champ/logic/cubits/count_cubit/count_cubit.dart';
import 'package:count_champ/logic/cubits/deck_cubit/deck_cubit.dart';
import 'package:count_champ/logic/cubits/running_count_stats_cubit/session/running_count_session_stats_cubit.dart';
import 'package:count_champ/logic/cubits/running_count_stats_cubit/alltime/running_count_alltime_stats_cubit.dart';
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
        backgroundColor: const Color(0xff28734D),
        appBar: AppBar(
          elevation: 0,
          leading: Builder(
            builder: (BuildContext pageContext) {
              return IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: () {
                  context.read<CountCubit>().stopSpeedCount();
                  context.read<DeckCubit>().shuffleDeck();
                  context.read<CountSettingsCubit>().exitCountTrainer();
                  Navigator.pop(pageContext);
                },
              );
            },
          ),
          title: Row(
            children: [
              BlocBuilder<RunningCountSessionStatsCubit,
                  RunningCountSessionStatsState>(builder: (context, runningCountSessionStatsState) {
                return BlocBuilder<RunningCountAlltimeStatsCubit,
                        RunningCountAlltimeStatsState>(
                    builder: (context, runningCountAlltimeStatsState) {
                  return Container (
                    margin: const EdgeInsets.only(left: 20.0),
                    child: Text(
                      'Streak : ' + runningCountSessionStatsState.streak.toString(),
                      style: const TextStyle(
                        fontSize: 20.0,
                        color: Colors.white,
                    ))
                  );
                });
              }),
              const Spacer(),
              IconButton(
                icon: const Icon(Icons.show_chart_outlined,
                    color: Colors.white, size: 36.0),
                onPressed: () {
                  Navigator.pushNamed(context, '/running_count_stats');
                },
              ),
            ],
          ),
          foregroundColor: Colors.white,
          backgroundColor: const Color(0xff28734D),
        ),
        endDrawer: const Drawer(
            elevation: 16.0,
            child: SafeArea(
              child: CountSettingsSidebar(),
            )),
        bottomNavigationBar: BottomAppBar(
            color: Colors.transparent,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
              Container(
                // padding: EdgeInsets.only(left: 75, right: 75, bottom: 75),
                margin: const EdgeInsets.only(bottom: 75),

                  child: BlocBuilder<CountSettingsCubit, CountSettingsState>(
                      builder: (context, countSettingsState) {
                        return BlocBuilder<DeckCubit, DeckState>(
                          builder: (context, deckState) {
                          
                      // if (deckState.cutCardIndex <= deckState.dealtCards.length &&
                      //   countSettingsState.speedCountEnabled == true &&

                      if (countSettingsState.speedCountEnabled == false  && (deckState.cutCardIndex > deckState.dealtCards.length)) {
                        return ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                primary: Colors.white,
                                minimumSize: const Size(200, 40)),
                            onPressed: () {
                              context.read<CountCubit>().initNextCard();
                              // context.read<RunningCountSessionStatsCubit>().monitorCountSettingsCubit();
                            },
                            child: const Text(
                              'Deal',
                              style: TextStyle(
                                fontSize: 20.0,
                                color: Colors.black,
                              ),
                            ));
                      } 
                      else if(countSettingsState.isSpeedCountRunning == true  && 
                        (deckState.cutCardIndex > deckState.dealtCards.length)) {
                        return Row(children: [
                            Container(
                              margin: const EdgeInsets.only(right: 5.0),
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  primary: Colors.white,
                                  maximumSize: const Size(150, 40)
                                ),
                                  onPressed: () {
                                    context.read<CountCubit>().stopSpeedCount();
                                  },
                                  child: const Text(
                                    'Pause',
                                    style: TextStyle(
                                      fontSize: 20.0,
                                      color: Colors.black,
                                    ),
                              )),
                            ),
                            Container(
                              margin: const EdgeInsets.only(left: 5.0, right: 5.0),
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  primary: Colors.white,
                                  maximumSize: const Size(150, 40)
                                ),
                                  onPressed: () {
                                    context
                                        .read<CountCubit>()
                                        .beginSpeedCount(_cardsPerSecond);
                                  },
                                  child: const Text(
                                    'Resume',
                                    style: TextStyle(
                                      fontSize: 20.0,
                                      color: Colors.black,
                                    ),
                                  )),
                            ),
                            Container(
                              margin: const EdgeInsets.only(left: 5.0),
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  primary: Colors.white,
                                  maximumSize: const Size(150, 40)
                                ),
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
                                  child: const Text(
                                    'Restart',
                                    style: TextStyle(
                                      fontSize: 20.0,
                                      color: Colors.black,
                                    ),
                                  ))
                            )
                          ]);
                      }
                      return const SizedBox.shrink();

                    });

                  },
                    )),
            ],
        ),
        ),
            


        body: SafeArea(
            child: Column(
          children: <Widget>[
            // RunningCountHeaderWidget(),

            //* Renders the running count

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
                    // Row(
                    //   mainAxisAlignment: MainAxisAlignment.center,
                    //   children: const [
                    //     Text(
                    //       'Running Count:',
                    //       style: TextStyle(
                    //         fontSize: 20.0,
                    //         color: Colors.white,
                    //       ),
                    //     ),
                    //   ],
                    // ),
                    // const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        BlocBuilder<DeckCubit, DeckState>(
                            builder: (context, state) {
                          formattedCount = FormatRunningCount(
                                  state.runningCount, isPlayingHalves)
                              .format();
                          return Text(
                            'Running Count:  $formattedCount' ,
                            style: const TextStyle(
                                fontSize: 20.0,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          );
                        }),
                      ],
                    ),
                    const SizedBox(height: 20),
                  ],
                );
              }
              //* Default return:
              return const SizedBox.shrink();
            }),

            //* Renders the Cards Dealt
            BlocBuilder<DeckCubit, DeckState>(builder: (context, state) {
              if (state.dealerHand.isNotEmpty) {
                return Row(
                    mainAxisAlignment: MainAxisAlignment.center,
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
            //* Renders the Cards Dealt
            BlocBuilder<DeckCubit, DeckState>(builder: (context, state) {
              if (state.playerHand.isNotEmpty) {
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
            const SizedBox(height: 20),

            Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
              BlocBuilder<CountSettingsCubit, CountSettingsState>(
                  builder: (context, countSettingsState) {
                if (countSettingsState.speedCountEnabled == true &&
                    countSettingsState.isSpeedCountRunning == false) {
                  _cardsPerSecond = countSettingsState.cardsPerSecond;
                  return ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.white,
                      minimumSize: const Size(150, 40)),
                      onPressed: () {
                        context
                            .read<CountCubit>()
                            .beginSpeedCount(_cardsPerSecond);
                        context
                            .read<CountSettingsCubit>()
                            .startingSpeedCount(true);
                      },
                      child: const Text(
                        'Start',
                        style: TextStyle(
                          fontSize: 20.0,
                          color: Colors.black,
                        ),
                      ));
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
                            correctPlayText = 'Incorrect. The count was $formattedCount';
                          }
                          return Column(
                            children: [
                              Text(
                                correctPlayText,
                                style: const TextStyle(
                                    fontSize: 18.0, color: Colors.white),
                              ),
                              const SizedBox(height: 15),
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  primary: Colors.white,
                                  maximumSize: const Size(150, 40)),
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
                                  child: const Text(
                                    'Play Again',
                                    style: TextStyle(
                                      fontSize: 20.0,
                                      color: Colors.black,
                                    ),
                                  )),
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
                                    fontSize: 18.0, color: Colors.white),
                              ),
                              const SizedBox(height: 20),
                              ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    primary: Colors.white,
                                  ),
                                  onPressed: () {
                                    context.read<DeckCubit>().shuffleDeck();
                                    context
                                        .read<CountCubit>()
                                        .resetCheckRunningCount();
                                  },
                                  child: const Text(
                                    'Play Again',
                                    style: TextStyle(
                                        fontSize: 20.0, color: Colors.black),
                                  )),
                            ],
                          );
                        }
                      });
                    } else {
                      return const SizedBox.shrink();
                    }
                  });
                }
              }),
            ]),
            //   //* Default return:
            //   return const SizedBox.shrink();
          ],
        ))));
  }
}
