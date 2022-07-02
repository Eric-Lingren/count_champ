import 'package:count_champ/constants/deviation_charts/hilo_deviation_charts.dart';
import 'package:count_champ/constants/deviation_charts/reko_deviation_charts.dart';
import 'package:count_champ/logic/cubits/deviations_cubit/deviations_cubit.dart';
import 'package:count_champ/widgets/deviations_widgets/flashcard_view.dart';
import 'package:count_champ/widgets/deviations_widgets/deviations_settings_sidebar.dart';
import 'package:count_champ/logic/cubits/deviations_stats_cubit/session/deviations_session_stats_cubit.dart';
import 'package:count_champ/widgets/global_widgets/help_chart_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flip_card/flip_card.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class DeviationsTrainer extends StatelessWidget {
  const DeviationsTrainer({Key? key}) : super(key: key);

//   void openEndDrawer() {
//   if (_drawerKey.currentState != null && _drawerOpened.value)
//     _drawerKey.currentState!.close();
//   _endDrawerKey.currentState?.open();
// }
  // final GlobalKey<ScaffoldState> _key = GlobalKey();

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
      //       Builder(builder: (context) {
      //   return FloatingActionButton(
      //     onPressed: () => Scaffold.of(context).openEndDrawer(), // <-- Opens drawer.
      //   );
      // }),
      return Scaffold(
          backgroundColor: backgroundColor,
          appBar: AppBar(
            foregroundColor: Colors.white,
            backgroundColor: Colors.transparent,
            elevation: 0,
            leading: Builder(
              builder: (BuildContext pageContext) {
                return IconButton(
                  icon: const Icon(Icons.arrow_back),
                  onPressed: () {
                    Navigator.pop(pageContext);
                  },
                );
              },
            ),
            title: Row(
              children: [
                Container(
                    margin: const EdgeInsets.only(left: 10.0),
                    child: BlocBuilder<DeviationsSessionStatsCubit,
                            DeviationsSessionStatsState>(
                        builder: (deviationsSessionStatsContext,
                            deviationsSessionStatsState) {
                      return Text(
                          'Streak : ${deviationsSessionStatsState.streak.toString()}',
                          style: const TextStyle(
                            fontSize: 20.0,
                            color: Colors.white,
                          ));
                    })),
                const Spacer(),
                Container(
                    margin: const EdgeInsets.only(right: 10),
                    child: GestureDetector(
                        onTap: () {
                          showDialog(
                              context: context,
                              builder: (context) {
                                return HelpChartWidget(
                                    title: deviationsState.deviationsChartTitle,
                                    chartMatrix:
                                        deviationsState.deviationsChartMatrix
                                    );
                              });
                        },
                        child: const FaIcon(
                          FontAwesomeIcons.circleQuestion,
                          color: Colors.white,
                          size: 24.0,
                        ))),
                IconButton(
                  icon: const FaIcon(FontAwesomeIcons.chartLine,
                      color: Colors.white, size: 24.0),
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
                    // HelpChartWidget(),
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
