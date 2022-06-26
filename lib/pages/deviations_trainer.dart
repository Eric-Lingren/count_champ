import 'package:count_champ/logic/cubits/deviations_cubit/deviations_cubit.dart';
import 'package:count_champ/widgets/deviations_widgets/flashcard_view.dart';
import 'package:count_champ/widgets/deviations_widgets/deviations_settings_sidebar.dart';
import 'package:count_champ/logic/cubits/deviations_stats_cubit/session/deviations_session_stats_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flip_card/flip_card.dart';

class DeviationsTrainer extends StatelessWidget {
  const DeviationsTrainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DeviationsCubit, DeviationsState>(
        builder: (deviationsContext, deviationsState) {
      var backgroundColor;
      if (deviationsState.wasPlayerCorrect) {
        backgroundColor = Color(0xff28734D);
      } else {
        backgroundColor = Color(0xffA51D19);
      }
      // backgroundColor
      return Scaffold(
          backgroundColor: backgroundColor,
          // backgroundColor: return BlocBuilder<DeviationsCubit, DeviationsState>(
          //             builder: (deviationsContext, deviationsState) {

          //             }),
          appBar: AppBar(
            foregroundColor: Colors.white,
            backgroundColor: Colors.transparent,
            elevation: 0,
            leading: Builder(
              builder: (BuildContext pageContext) {
                return IconButton(
                  icon: const Icon(Icons.arrow_back),
                  onPressed: () {
                    // context.read<CountCubit>().stopSpeedCount();
                    // context.read<DeckCubit>().shuffleDeck();
                    // context.read<CountSettingsCubit>().exitCountTrainer();
                    Navigator.pop(pageContext);
                  },
                );
              },
            ),
            title: Row(
              children: [
                // BlocBuilder<RunningCountSessionStatsCubit,
                //     RunningCountSessionStatsState>(builder: (context, runningCountSessionStatsState) {
                //   return BlocBuilder<RunningCountAlltimeStatsCubit,
                //           RunningCountAlltimeStatsState>(
                //       builder: (context, runningCountAlltimeStatsState) {
                // return Container (
                Container(
                    margin: const EdgeInsets.only(left: 20.0),
                    child: BlocBuilder<DeviationsSessionStatsCubit,
                            DeviationsSessionStatsState>(
                        builder: (deviationsSessionStatsContext,
                            deviationsSessionStatsState) {
                      return Text(
                          'Streak : ${deviationsSessionStatsState.streak.toString()}',
                          style: TextStyle(
                            fontSize: 20.0,
                            color: Colors.white,
                          ));
                    })),

                // child: const Text('Streak : ',
                //     style: TextStyle(
                //       fontSize: 20.0,
                //       color: Colors.white,
                //     ))),
                //   });
                // }),
                const Spacer(),
                IconButton(
                  icon: const Icon(Icons.show_chart_outlined,
                      color: Colors.white, size: 36.0),
                  onPressed: () {
                    Navigator.pushNamed(context, '/deviations_stats');
                  },
                ),
              ],
            ),
          ),
          endDrawer: const Drawer(
              elevation: 16.0,
              child: SafeArea(
                child: DeviationsSettingsSidebar(),
              )),
          bottomNavigationBar: BottomAppBar(
            color: Colors.transparent,
            child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              Container(
                  margin: const EdgeInsets.only(bottom: 75),
                  child: BlocBuilder<DeviationsCubit, DeviationsState>(
                      builder: (deviationsContext, deviationsState) {
                    if (deviationsState.buttonAnswerOptions.length > 0) {
                      return Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: deviationsState.buttonAnswerOptions
                              .map<Widget>((option) => Container(
                                  margin: const EdgeInsets.all(10.0),
                                  child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                          primary: Colors.white,
                                          minimumSize: const Size(60, 50)),
                                      onPressed: () {
                                        deviationsContext
                                            .read<DeviationsCubit>()
                                            .checkAnswer(option);
                                        // deviationsContext
                                        //     .read<DeviationsCubit>()
                                        //     .drawFlashcard();
                                      },
                                      child: Text('$option',
                                          style: const TextStyle(
                                            fontSize: 26.0,
                                            color: Colors.black,
                                          )))))
                              .toList());
                    } else {
                      return const Text(
                            'Some Button',
                            style: TextStyle(
                              fontSize: 20.0,
                              color: Colors.black,
                            ),
                          );
                    }
                  })
                  // return const SizedBox.shrink();
                  )
            ]),
            // )),
          ),
          body: SafeArea(
              child: Container(
            margin: const EdgeInsets.only(top: 10.0),
            child: Center(
              child: BlocBuilder<DeviationsCubit, DeviationsState>(
                  builder: (context, deviationsState) {
                String dealer = deviationsState.currentFlashcard['dealer'];
                String player = deviationsState.currentFlashcard['player'];
                String answer = deviationsState.currentFlashcard['answer'];
                String question = '';
                if (dealer == 'Insurance') {
                  question = 'Insurance';
                } else if (dealer.isNotEmpty) {
                  question = 'D:  $dealer \n\nvs \n\nP:  $player';
                }
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                        width: 250,
                        height: 250,
                        child: FlipCard(
                            front: FlashcardView(
                              text: question,
                            ),
                            back: FlashcardView(
                              text: answer,
                            )))
                  ],
                );
                // return const SizedBox.shrink();
              }),
            ),
          )));
    });
  }
}
