import 'package:count_champ/logic/cubits/achievements_cubit/achievements_cubit.dart';
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
        Container(
          height: 200,
          child: AchievementUnlockedWidget(),
          // AlertDialog(
          //   title: const Text('AlertDialog Title'),
          //   content: const Text('this is a demo alert diolog'),
          //   actions: <Widget>[
          //     TextButton(
          //       child: const Text('Approve'),
          //       onPressed: () {
          //       	Navigator.of(context).pop();
          //       },
          //     ),
          //   ],
          // ),
        ),
      ],
    ))));
  }
}

class AchievementUnlockedWidget extends StatefulWidget {
  @override
  _AchievementUnlockedWidgetState createState() =>
      _AchievementUnlockedWidgetState();
}

class _AchievementUnlockedWidgetState extends State<AchievementUnlockedWidget> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          ElevatedButton(
            onPressed: () {
              _showMaterialDialog();
            },
            child: Text('Show Material Dialog'),
          ),
        ],
      ),
    )));
  }

  void _showMaterialDialog() {
//     showDialog(Dialog(
//   backgroundColor: Colors.transparent,
//   insetPadding: EdgeInsets.all(10),
//   child: Stack(
//     overflow: Overflow.visible,
//     alignment: Alignment.center,
//     children: <Widget>[
//       Container(
//         width: double.infinity,
//         height: 200,
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(15),
//           color: Colors.lightBlue
//         ),
//         padding: EdgeInsets.fromLTRB(20, 50, 20, 20),
//         child: Text("You can make cool stuff!",
//           style: TextStyle(fontSize: 24),
//           textAlign: TextAlign.center
//         ),
//       ),
//       Positioned(
//         top: -100,
//         child: Image.network("https://i.imgur.com/2yaf2wb.png", width: 150, height: 150)
//       )
//     ],
//   )
// ));
    showDialog(
        context: context,
        builder: (context) {
          return Dialog(
              backgroundColor: Colors.transparent,
              insetPadding: const EdgeInsets.all(10),
              child: Stack(
                clipBehavior: Clip.none, alignment: Alignment.center,
                children: <Widget>[
                  Container(
                    width: double.infinity,
                    height: 200,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.lightBlue),
                    padding: EdgeInsets.fromLTRB(20, 50, 20, 20),
                    child: Column(
                      children: const [
                        // SizedBox(height: 10,),
                        Text("Achievement Unlocked!",
                            style: TextStyle(fontSize: 24),
                            textAlign: TextAlign.center,
                        ),
                        Text('Somehting here'),
                      ],
                    ),
                  ),
                  Positioned(
                      top: -110,
                      child: Image.network("https://cdn3.volusion.com/ghvuq.vvbmn/v/vspfiles/photos/HD-CC-LV-5.jpg?v-cache=1438083632",
                      // child: Image.network("https://i.imgur.com/2yaf2wb.png",
                          width: 150, height: 150))
                ],
              ));
          // Container(
          //   // height: 400,
          //   child: AlertDialog(
          //     title: Text('Achievement Unlocked!'),
          //     content: Column(
          //       children: const [
          //         Text('Hey! I am Text!'),
          //         Text('Hey! I am Text!'),
          //         Text('Hey! I am Text!'),
          //         // Text('Hey! I am Text!'),
          //         // Text('Hey! I am Text!'),
          //         // Text('Hey! I am Text!'),
          //         // Text('Hey! I am Text!'),
          //         // Text('Hey! I am Text!'),
          //         // Text('Hey! I am Text!'),
          //       ],
          //     ),
          //     actions: <Widget>[
          //       TextButton(
          //           onPressed: () {
          //             _dismissDialog();
          //           },
          //           child: const Text('Awesome')),
          //     ],
          //   ),
          // );
        });
  }

  _dismissDialog() {
    Navigator.pop(context);
  }
}
