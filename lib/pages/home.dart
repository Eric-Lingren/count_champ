import 'package:count_champ/logic/cubits/achievements_cubit/achievements_cubit.dart';
import 'package:count_champ/widgets/global_widgets/achievement_unlocked_alert_widget.dart';
import 'package:count_champ/widgets/nav_widgets/home_nav_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return (
        // Scaffold(
        //   body:
        //     SafeArea(
        //       child: Column(

        // children: <Widget>[
        //   BlocBuilder<AchievementsCubit, AchievementsState>(
        //       builder: (context, achievementsState) {
        //     return const Text('Welcome to Count Champ!');
        //   }),
        //   ElevatedButton(
        //       onPressed: () {
        //         Navigator.pushNamed(context, '/basic_strategy_trainer');
        //       },
        //       child: const Text('Basic Strategy')),
        //   ElevatedButton(
        //       onPressed: () {
        //         Navigator.pushNamed(context, '/running_count_trainer');
        //         },
        //         child: const Text('Count Trainer')),
        //     ElevatedButton(
        //         onPressed: () {
        //           Navigator.pushNamed(context, '/achievements');
        //         },
        //         child: const Text('Achievements')),
        //     BlocBuilder<AchievementsCubit, AchievementsState>(
        //       builder: (context, state) {
        //         if (state.achievementReached == true) {
        //           return const SizedBox(
        //             height: 200,
        //             child: AchievementUnlockedAlertWidget(),
        //           );
        //         }
        //         return const SizedBox.shrink();
        //       },
        //     ),
        //   ],
        // ))));

        Container(
          constraints: BoxConstraints.expand(),
          decoration: BoxDecoration(
            image: DecorationImage(
              colorFilter: ColorFilter.mode(
                  Colors.black.withOpacity(0.3), BlendMode.dstATop),
              image: AssetImage(
                  "assets/images/backgrounds/cardsBackground.jpeg"),
              fit: BoxFit.cover),
          ),
          child: SafeArea(
            child: Column(children: <Widget>[
              // const SizedBox(height: 30),
              BlocBuilder<AchievementsCubit, AchievementsState>(
                builder: (context, achievementsState) {
                return Container(
                  margin: const EdgeInsets.all(40.0),
                  child: const Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      'Welcome to Count Champ',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontSize: 18.0,
                        color: Colors.white,
                        decoration: TextDecoration.none,
                      ),
                    )));
              }),

              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: <Widget>[
                    const SizedBox(width: 50),
                    // Container(
                    //   width: 250,
                    //   height: 400,
                    //   child: Stack(
                    //     fit: StackFit.expand,
                    //     children: <Widget>[
                    //       GestureDetector(
                    //         onTap: () { 
                    //           Navigator.pushNamed(context, '/basic_strategy_trainer');
                    //         },
                    //       child: Container(
                    //         decoration: BoxDecoration(
                    //           borderRadius: const BorderRadius.all(
                    //             Radius.circular(10.0),
                    //           ),
                    //           color: Colors.black,
                    //           image: DecorationImage(
                    //             fit: BoxFit.cover,
                    //             colorFilter: 
                    //               ColorFilter.mode(Colors.black.withOpacity(0.7), 
                    //               BlendMode.dstATop),
                          //       image: const AssetImage('assets/images/backgrounds/home_nav_card.jpeg'),
                          //     ),
                          //   ),
                          // ),
                          // ),
                          // Positioned(
                          //   bottom: 20,
                          //   right: 10,
                          //   child: Column(
                          //     children: const <Widget>[
                          //       Text(
                          //         "Basic Strategy",
                          //         textAlign: TextAlign.left,
                          //         style: TextStyle(
                          //           fontSize: 20,
                          //           fontWeight: FontWeight.bold,
                          //           color: Colors.white,
      //                               decoration: TextDecoration.none,
      //                             ),
      //                         ),
      //                         SizedBox(height: 5),
      //                         Text(
      //                           '''       Practice the correct play for  
      //  any situation''',
      //                           textAlign: TextAlign.left,
      //                           style: TextStyle(
      //                             fontSize: 12,
      //                             color: Colors.white,
      //                             decoration: TextDecoration.none,
      //                             fontStyle: FontStyle.italic,
      //                             fontWeight: FontWeight.w100
      //                           ),
      //                         ),
      //                       ],
      //                     ),
      //                   ),
      //                 ],
      //               ),
      //             ),
                  const HomeNavWidget(navLink: '/basic_strategy_trainer', navTitle: 'Basic Strategy', navSubtitle:'''                 Practice the correct play for  
                 any situation''', rightPosition: 10.0),

                  const SizedBox(width: 20),

                  const HomeNavWidget(navLink: '/running_count_trainer', navTitle: 'TESTING', navSubtitle:'assgdsfgdasfg', rightPosition: 50),




            



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
              ]),
            )));
  }
}
