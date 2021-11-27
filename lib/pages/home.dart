import 'package:audioplayers/audioplayers.dart';
import 'package:count_champ/logic/cubits/achievements_cubit/achievements_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/scheduler.dart';

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
        BlocBuilder<AchievementsCubit, AchievementsState>(
            builder: (context, achievementsState) {
          return Text('Welcome to Count Champ!');
        }),
        ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context, '/basic_strategy_trainer');
            },
            child: const Text('Basic Strategy')),
        ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context, '/running_count_trainer');
            },
            child: const Text('Count Trainer')),
        ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context, '/achievements');
            },
            child: const Text('Achievements')),
        BlocBuilder<AchievementsCubit, AchievementsState>(
          builder: (context, state) {
            if (state.achievementReached == true) {
              return const SizedBox(
                height: 200,
                child: AchievementUnlockedAlertWidget(),
              );
            }
            return const SizedBox.shrink();
          },
        ),
      ],
    ))));
  }
}

class AchievementUnlockedAlertWidget extends StatefulWidget {
  const AchievementUnlockedAlertWidget({Key? key}) : super(key: key);

  @override
  _AchievementUnlockedAlertWidgetState createState() =>
      _AchievementUnlockedAlertWidgetState();
}

class _AchievementUnlockedAlertWidgetState
    extends State<AchievementUnlockedAlertWidget> {
  @override
  void initState() {
    super.initState();

    SchedulerBinding.instance?.addPostFrameCallback((_) {
      _ifLoaded();
    });
  }

  _ifLoaded() async {
    _showMaterialDialog(context);
    _playSoundEffect();
  }

  @override
  Widget build(BuildContext context) {
    return const SizedBox.shrink();
  }

  _playSoundEffect() async {
    AudioCache player = AudioCache();
    const soundPath  = 'audio/shuffling_chips.mp3';
    // const soundPath  = 'audio/slot_payoff.wav';
    player.play(soundPath, volume: 1.0);

  }

  _showMaterialDialog(context) {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) {
          return Dialog(
              backgroundColor: Colors.transparent,
              insetPadding: const EdgeInsets.all(10),
              child: Stack(
                clipBehavior: Clip.none,
                alignment: Alignment.center,
                children: <Widget>[
                  Container(
                    width: double.infinity,
                    height: 200,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.lightBlue),
                    padding: const EdgeInsets.fromLTRB(20, 50, 20, 10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        const Text(
                          "Achievement Unlocked!",
                          style: TextStyle(fontSize: 24),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        BlocBuilder<AchievementsCubit, AchievementsState>(
                            builder: (context, state) {
                          return Text(
                            state.achievementText,
                            style: const TextStyle(fontSize: 16),
                          );
                        }),
                        const SizedBox(
                          height: 20,
                        ),
                        ElevatedButton(
                            onPressed: () {
                              BlocProvider.of<AchievementsCubit>(context)
                                  .clearAchievementReached();
                              Navigator.pop(context);
                            },
                            style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all(Colors.amber[400]),
                            ),
                            child: const Text(
                              'Awesome!',
                              style: TextStyle(color: Colors.black),
                            ))
                      ],
                    ),
                  ),
                  Positioned(
                      top: -50,
                      child: BlocBuilder<AchievementsCubit, AchievementsState>(
                        builder: (context, state) {
                          if (state.achievementImagePath.isNotEmpty) {
                            return Image(
                                image: AssetImage(state.achievementImagePath),
                                width: 100,
                                height: 100);
                          }
                          return const SizedBox.shrink();
                        },
                      ))
                ],
              ));
        });
  }
}
