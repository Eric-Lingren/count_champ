import 'package:count_champ/data/models/card_template.dart';
import 'package:count_champ/logic/cubits/basic_strategy_cubit/basic_strategy_cubit.dart';
import 'package:count_champ/logic/cubits/basic_strategy_stats_cubit/session/basic_strategy_session_stats_cubit.dart';
import 'package:count_champ/logic/cubits/correct_plays_cubit/correct_plays_cubit.dart';
import 'package:count_champ/logic/cubits/deck_cubit/deck_cubit.dart';
import 'package:count_champ/logic/cubits/settings/basic_strategy_settings_cubit/basic_strategy_settings_cubit.dart';
import 'package:count_champ/widgets/basic_strategy_widgets/basic_strategy_settings_sidebar.dart';
import 'package:count_champ/widgets/correct_play_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

class BasicStrategyTrainer extends StatefulWidget {
  const BasicStrategyTrainer({Key? key}) : super(key: key);

  @override
  _BasicStrategyTrainerState createState() => _BasicStrategyTrainerState();
}

class _BasicStrategyTrainerState extends State<BasicStrategyTrainer> {
  @override
  Widget build(BuildContext context) {
    // return BlocBuilder<DeviationsCubit, DeviationsState>(
    //     builder: (deviationsContext, deviationsState) {});



    return BlocBuilder<CorrectPlaysCubit, CorrectPlaysState>(
      builder: (context, correctPlaysState) {

      var backgroundColor;
      if (correctPlaysState.playWasCorrect) {
        backgroundColor = Color(0xff28734D);
      } else {
        backgroundColor = Color(0xffA51D19);
      }

      return Scaffold(
          backgroundColor: backgroundColor,
          appBar: AppBar(
            elevation: 0,
            leading: Builder(
              builder: (BuildContext pageContext) {
                return IconButton(
                  icon: const Icon(Icons.arrow_back),
                  onPressed: () {
                    context.read<DeckCubit>().shuffleDeck();
                    Navigator.pop(context);
                  },
                );
              },
            ),
            title: Row(
              children: [
                BlocBuilder<BasicStrategySessionStatsCubit,
                        BasicStrategySessionStatsState>(
                    builder: (context, basicStrategySessionStatsState) {
                  return Container(
                      margin: const EdgeInsets.only(left: 20.0),
                      child: Text(
                          'Streak : ' +
                              basicStrategySessionStatsState.currentStreak
                                  .toString(),
                          style: const TextStyle(
                            fontSize: 20.0,
                            color: Colors.white,
                          )));
                }),
                const Spacer(),
                IconButton(
                  icon: const Icon(Icons.show_chart_outlined,
                      color: Colors.white, size: 36.0),
                  onPressed: () {
                    Navigator.pushNamed(context, '/basic_strategy_stats');
                  },
                ),
              ],
            ),
            foregroundColor: Colors.white,
            backgroundColor: Colors.transparent,
          ),
          endDrawer: const Drawer(
              elevation: 16.0,
              child: SafeArea(
                child: BasicStrategySettingsSidebar(),
              )),
          bottomNavigationBar: BottomAppBar(
            color: Colors.transparent,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                    // padding: EdgeInsets.only(left: 75, right: 75, bottom: 75),
                    margin: const EdgeInsets.only(bottom: 75),
                    child: BlocBuilder<BasicStrategySettingsCubit,
                        BasicStrategySettingsState>(
                      builder: (context, basicStrategySettingsState) {
                        return BlocBuilder<DeckCubit, DeckState>(
                            builder: (context, deckState) {
                          if (deckState.playerHand.isEmpty) {
                            return ElevatedButton(
                                onPressed: () {
                                  context
                                      .read<BasicStrategyCubit>()
                                      .initNextHand();
                                },
                                child: const Text('Start'));
                          } else {
                            return
                                //   // Column(
                                //   //   crossAxisAlignment: CrossAxisAlignment.center,
                                //   //   mainAxisSize: MainAxisSize.max,
                                //   //   mainAxisAlignment: MainAxisAlignment.end,
                                //   //   // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                //   //   children: [
                                Row(children: [
                              ElevatedButton(
                                  onPressed: () {
                                    context
                                        .read<CorrectPlaysCubit>()
                                        .checkPlay('hit');
                                    context
                                        .read<BasicStrategyCubit>()
                                        .initNextHand();
                                  },
                                  child: const Text('Hit')),
                              ElevatedButton(
                                  onPressed: () {
                                    context
                                        .read<CorrectPlaysCubit>()
                                        .checkPlay('stand');
                                    context
                                        .read<BasicStrategyCubit>()
                                        .initNextHand();
                                  },
                                  child: const Text('Stand')),
                              ElevatedButton(
                                  onPressed: () {
                                    context
                                        .read<CorrectPlaysCubit>()
                                        .checkPlay('double');
                                    context
                                        .read<BasicStrategyCubit>()
                                        .initNextHand();
                                  },
                                  child: const Text('Double')),
                              ElevatedButton(
                                  onPressed: () {
                                    context
                                        .read<CorrectPlaysCubit>()
                                        .checkPlay('split');
                                    context
                                        .read<BasicStrategyCubit>()
                                        .initNextHand();
                                  },
                                  child: const Text('Split')),
                            ]);
                          }
                          //     //           Row(
                          //     //             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          //     //             children: [
                          //     //               BlocBuilder<BasicStrategySettingsCubit,
                          //     //                       BasicStrategySettingsState>(
                          //     //                   builder: (context, state) {
                          //     //                 if (state.practiceInsurance == true) {
                          //     //                   return ElevatedButton(
                          //     //                       onPressed: () {
                          //     //                         context
                          //     //                             .read<CorrectPlaysCubit>()
                          //     //                             .checkPlay('insurance');
                          //     //                         context
                          //     //                             .read<BasicStrategyCubit>()
                          //     //                             .initNextHand();
                          //     //                       },
                          //     //                       child: const Text('Insurance'));
                          //     //                 }
                          //     //                 return const SizedBox.shrink();
                          //     //             }),
                          //     //             BlocBuilder<BasicStrategySettingsCubit,
                          //     //                     BasicStrategySettingsState>(
                          //     //                 builder: (context, state) {
                          //     //               if (state.practiceFab4 == true ||
                          //     //                   state.practiceIllustrious18 == true ||
                          //     //                   state.practiceInsurance == true) {
                          //     //                 return Column(
                          //     //                   children: [
                          //     //                     const Text('True Count:'),
                          //     //                     BlocBuilder<DeckCubit, DeckState>(
                          //     //                         builder: (context, state) {
                          //     //                       return Text(state.trueCount.toString());
                          //     //                     }),
                          //     //                   ],
                          //     //                 );
                          //     //               }
                          //     //               return const SizedBox.shrink();
                          //     //             }),
                          //     //   BlocBuilder<BasicStrategySettingsCubit,
                          //     //           BasicStrategySettingsState>(
                          //     //       builder: (context, state) {
                          //     //     if (state.canSurrender == true) {
                          //     //       return ElevatedButton(
                          //     //           onPressed: () {
                          //     //             context
                          //     //                 .read<CorrectPlaysCubit>()
                          //     //                 .checkPlay('surrender');
                          //     //             context
                          //     //                 .read<BasicStrategyCubit>()
                          //     //                 .initNextHand();
                          //     //           },
                          //     //           child: const Text('Surrender'));
                          //     //     }
                          //     //     return const SizedBox.shrink();
                          //     //   }),
                          //     // ]),
                          //   ]);
                          // }

                          // return const SizedBox.shrink();
                        });
                      },
                    )),
              ],
            ),
          ),
          body: SafeArea(
              child: Column(children: <Widget>[
            BlocBuilder<DeckCubit, DeckState>(builder: (context, state) {
              if (state.dealerHand.isNotEmpty) {
                bool isHoleCard = false;
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
            // BlocBuilder<DeckCubit, DeckState>(builder: (context, state) {
            // return Column(children: [
            //   Row(
            //       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            //       children: [
            //         ElevatedButton(
            //             onPressed: () {
            //               context.read<CorrectPlaysCubit>().checkPlay('hit');
            //               context.read<BasicStrategyCubit>().initNextHand();
            //             },
            //             child: const Text('Hit')),
            //         ElevatedButton(
            //             onPressed: () {
            //               context
            //                   .read<CorrectPlaysCubit>()
            //                   .checkPlay('stand');
            //               context.read<BasicStrategyCubit>().initNextHand();
            //             },
            //             child: const Text('Stand')),
            //         ElevatedButton(
            //             onPressed: () {
            //               context
            //                   .read<CorrectPlaysCubit>()
            //                   .checkPlay('double');
            //               context.read<BasicStrategyCubit>().initNextHand();
            //             },
            //             child: const Text('Double')),
            //         ElevatedButton(
            //             onPressed: () {
            //               context
            //                   .read<CorrectPlaysCubit>()
            //                   .checkPlay('split');
            //               context.read<BasicStrategyCubit>().initNextHand();
            //             },
            //             child: const Text('Split')),
            //       ]),
            //     Row(
            //       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            //       children: [
            //         BlocBuilder<BasicStrategySettingsCubit,
            //                 BasicStrategySettingsState>(
            //             builder: (context, state) {
            //           if (state.practiceInsurance == true) {
            //             return ElevatedButton(
            //                 onPressed: () {
            //                   context
            //                       .read<CorrectPlaysCubit>()
            //                       .checkPlay('insurance');
            //                   context
            //                       .read<BasicStrategyCubit>()
            //                       .initNextHand();
            //                 },
            //                 child: const Text('Insurance'));
            //           }
            //           return const SizedBox.shrink();
            //         }),
            //         BlocBuilder<BasicStrategySettingsCubit,
            //                 BasicStrategySettingsState>(
            //             builder: (context, state) {
            //           if (state.practiceFab4 == true ||
            //               state.practiceIllustrious18 == true ||
            //               state.practiceInsurance == true) {
            //             return Column(
            //               children: [
            //                 const Text('True Count:'),
            //                 BlocBuilder<DeckCubit, DeckState>(
            //                     builder: (context, state) {
            //                   return Text(state.trueCount.toString());
            //                 }),
            //               ],
            //             );
            //           }
            //           return const SizedBox.shrink();
            //         }),
            //         BlocBuilder<BasicStrategySettingsCubit,
            //                 BasicStrategySettingsState>(
            //             builder: (context, state) {
            //           if (state.canSurrender == true) {
            //             return ElevatedButton(
            //                 onPressed: () {
            //                   context
            //                       .read<CorrectPlaysCubit>()
            //                       .checkPlay('surrender');
            //                   context
            //                       .read<BasicStrategyCubit>()
            //                       .initNextHand();
            //                 },
            //                 child: const Text('Surrender'));
            //           }
            //           return const SizedBox.shrink();
            //         }),
            //       ]),
            // ]);
            // })
          ])));
    });
  }
}
