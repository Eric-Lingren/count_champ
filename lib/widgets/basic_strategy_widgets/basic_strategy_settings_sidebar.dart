import 'package:count_champ/logic/cubits/settings/basic_strategy_settings_cubit/basic_strategy_settings_cubit.dart';
import 'package:count_champ/widgets/basic_strategy_widgets/bs_info_popup_widget.dart';
import 'package:count_champ/widgets/global_widgets/achievement_unlocked_alert_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BasicStrategySettingsSidebar extends StatefulWidget {
  const BasicStrategySettingsSidebar({Key? key}) : super(key: key);

  @override
  _BasicStrategySettingsSidebarState createState() =>
      _BasicStrategySettingsSidebarState();
}

class _BasicStrategySettingsSidebarState
    extends State<BasicStrategySettingsSidebar> {
  @override
  Widget build(BuildContext context) {
    return (Scaffold(
        body: SingleChildScrollView(
            child: Column(
      children: <Widget>[
        BlocBuilder<BasicStrategySettingsCubit, BasicStrategySettingsState>(
            builder: (context, state) {
          return ListTile(
              title: Text('Deck Quantity: ${state.deckQuantity.round()}'),
              isThreeLine: true,
              subtitle: Slider(
                min: 1.0,
                max: 8.0,
                value: state.deckQuantity,
                divisions: 7,
                label: '${state.deckQuantity.round()}',
                onChanged: (value) {
                  context
                      .read<BasicStrategySettingsCubit>()
                      .setDeckQuantity(value);
                },
              ));
        }),
        Divider(color: Colors.blue[300], thickness: 2),
        ListTile(
            title: const Text("Double After Split"),
            leading: BlocBuilder<BasicStrategySettingsCubit,
                BasicStrategySettingsState>(builder: (context, state) {
              return Switch(
                value: state.canDas,
                onChanged: (value) {
                  context.read<BasicStrategySettingsCubit>().toggleDas(value);
                },
                activeTrackColor: Colors.lightGreenAccent[700],
                activeColor: Colors.green,
              );
            }),
            trailing: IconButton(
              icon: const Icon(Icons.info_outline),
              color: Colors.lightBlue[400],
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return BsInfoPopupWidget(
                      infoTitle: 'Double After Split - DAS', 
                      playerAdvantage: '0.12% - 0.14%', 
                      description: 'Allows doubling down on any hands that have been created by splitting pairs. This is advantageous for the player and is fairly common to find a game with this rule. If option is not selected the Basic Strategey rules and charts will be adjusted according.'
                    );
                  },
                );
              }),
            ),
        ListTile(
            // TODO Off is Reno rules
            title: const Text("Double Any Two Cards"),
            leading: BlocBuilder<BasicStrategySettingsCubit,
                BasicStrategySettingsState>(builder: (context, state) {
              return Switch(
                value: state.canDoubleAny2,
                onChanged: (value) {
                  context
                      .read<BasicStrategySettingsCubit>()
                      .toggleCanDoubleAny2(value);
                },
                activeTrackColor: Colors.lightGreenAccent[700],
                activeColor: Colors.green,
              );
            }),
            trailing: IconButton(
              icon: const Icon(Icons.info_outline),
              color: Colors.lightBlue[400],
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return BsInfoPopupWidget(
                      infoTitle: 'Double Any 2 Cards', 
                      playerAdvantage: '0.09%', 
                      description: 'Allows doubling down on any first 2 cards. This is advantageous for the player and is fairly common. Variations are "Reno Rules" which allow doubling on hard 9-11 only or "Europen Rules" which only allow doubling on hard 10 or 11. Although rare, avoid a game with no doubling on 11 at all costs since it gives the house an additional 0.50% advantage. If option is not selected the Basic Strategey rules and charts will be defaulted to Reno Rules.'
                    );
                  },
                );
              }),
              ),
        // ListTile( // TODO - Only for GamePlay, not BS
        //     title: const Text("Can Resplit Pairs"),
        //     leading: BlocBuilder<BasicStrategySettingsCubit, BasicStrategySettingsState>(
        //         builder: (context, state) {
        //       return Switch(
        //         value: state.canResplitPairs,
        //         onChanged: (value) {
        //           context
        //               .read<BasicStrategySettingsCubit>()
        //               .toggleCanResplitPairs(value);
        //         },
        //         activeTrackColor: Colors.lightGreenAccent[700],
        //         activeColor: Colors.green,
        //       );
        //     })),
        ListTile(
            title: const Text("Splitting Aces"),
            leading: BlocBuilder<BasicStrategySettingsCubit,
                BasicStrategySettingsState>(builder: (context, state) {
              return Switch(
                value: state.canSplitAces,
                onChanged: (value) {
                  context
                      .read<BasicStrategySettingsCubit>()
                      .toggleCanSplitAces(value);
                },
                activeTrackColor: Colors.lightGreenAccent[700],
                activeColor: Colors.green,
              );
            }),
            trailing: IconButton(
              icon: const Icon(Icons.info_outline),
              color: Colors.lightBlue[400],
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return BsInfoPopupWidget(
                      infoTitle: 'Splitting Aces', 
                      playerAdvantage: '0.18%', 
                      description: 'Allows splitting a pair of aces. This is advantageous for the player because it increases the odds of the number of hands with 21 and is fairly common to find games with this rule. Generally the trade-off with this game is that you are only dealt one card after splitting aces and can not hit or double down after the split.'
                    );
                  },
                );
              }),),
        // ListTile( // TODO - Only for GamePlay, not BS
        //     title: const Text("Can Hit After Splitting Aces"),
        //     leading: BlocBuilder<BasicStrategySettingsCubit, BasicStrategySettingsState>(
        //         builder: (context, state) {
        //       return Switch(
        //         value: state.canHitAfterSplittingAces,
        //         onChanged: (value) {
        //           context
        //               .read<BasicStrategySettingsCubit>()
        //               .toggleCanHitAfterSplitingAces(value);
        //         },
        //         activeTrackColor: Colors.lightGreenAccent[700],
        //         activeColor: Colors.green,
        //       );
        //     })),
        ListTile(
            title: const Text("Dealer Hits Soft 17"),
            leading: BlocBuilder<BasicStrategySettingsCubit,
                BasicStrategySettingsState>(builder: (context, state) {
              return Switch(
                value: state.dealerHitsSoft17,
                onChanged: (value) {
                  context
                      .read<BasicStrategySettingsCubit>()
                      .toggleDealerHitsSoft17(value);
                },
                activeTrackColor: Colors.lightGreenAccent[700],
                activeColor: Colors.green,
              );
            }),
            trailing: IconButton(
              icon: const Icon(Icons.info_outline),
              color: Colors.lightBlue[400],
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return BsInfoPopupWidget(
                      infoTitle: 'H17', 
                      playerAdvantage: '0.22%', 
                      description: 'Allows splitting a pair of aces. This is advantageous for the player because it increases the odds of the number of hands with 21 and is fairly common to find games with this rule. Generally the trade-off with this game is that you are only dealt one card after splitting aces and can not hit or double down after the split.'
                    );
                  },
                );
              }),
            ),
        ListTile(
            title: const Text("Surrender Allowed"),
            leading: BlocBuilder<BasicStrategySettingsCubit,
                BasicStrategySettingsState>(builder: (context, state) {
              return Switch(
                value: state.canSurrender,
                onChanged: (value) {
                  context
                      .read<BasicStrategySettingsCubit>()
                      .toggleCanSurrender(value);
                },
                activeTrackColor: Colors.lightGreenAccent[700],
                activeColor: Colors.green,
              );
            })),
        // ListTile( // TODO - Only for GamePlay, not BS
        //     title: const Text("Early Surrender Allowed"),
        //     leading: BlocBuilder<BasicStrategySettingsCubit, BasicStrategySettingsState>(
        //         builder: (context, state) {
        //       return Switch(
        //         value: state.canEarlySurrender,
        //         onChanged: (value) {
        //           context
        //               .read<BasicStrategySettingsCubit>()
        //               .toggleCanEarlySurrender(value);
        //         },
        //         activeTrackColor: Colors.lightGreenAccent[700],
        //         activeColor: Colors.green,
        //       );
        //     })),
        // ListTile( // TODO - Only for GamePlay, not BS
        //     title: const Text("Late Surrender Allowed"),
        //     leading: BlocBuilder<BasicStrategySettingsCubit, BasicStrategySettingsState>(
        //         builder: (context, state) {
        //       return Switch(
        //         value: state.canLateSurrender,
        //         onChanged: (value) {
        //           context
        //               .read<BasicStrategySettingsCubit>()
        //               .toggleCanLateSurrender(value);
        //         },
        //         activeTrackColor: Colors.lightGreenAccent[700],
        //         activeColor: Colors.green,
        //       );
        //     })),
        // ListTile( // TODO - Only for GamePlay, not BS
        //     title: const Text("Dealer Peeks for 21"),
        //     leading: BlocBuilder<BasicStrategySettingsCubit, BasicStrategySettingsState>(
        //         builder: (context, state) {
        //       return Switch(
        //         value: state.dealerPeeks,
        //         onChanged: (value) {
        //           context.read<BasicStrategySettingsCubit>().toggleDealerPeeks(value);
        //         },
        //         activeTrackColor: Colors.lightGreenAccent[700],
        //         activeColor: Colors.green,
        //       );
        //     })),
        // BlocBuilder<BasicStrategySettingsCubit, BasicStrategySettingsState>(
        //     builder: (context, state) {
        //   return ListTile( // TODO - Only for GamePlay and Counting, not BS
        //       title: Text('Deck Penetration:${state.deckPenetration.round()}%'),
        //       isThreeLine: true,
        //       subtitle: Slider(
        //         min: 0.0,
        //         max: 100.0,
        //         value: state.deckPenetration,
        //         divisions: 20,
        //         label: '${state.deckPenetration.round()}',
        //         onChanged: (value) {
        //           context.read<BasicStrategySettingsCubit>().setDeckPenetration(value);
        //         },
        //       ));
        // }),
        Divider(color: Colors.blue[300], thickness: 2),
        ListTile(
            // TODO BS Settings Only
            title: const Text("Practice All Hands"),
            leading: BlocBuilder<BasicStrategySettingsCubit,
                BasicStrategySettingsState>(builder: (context, state) {
              return Switch(
                value: state.practiceBsAllHands,
                onChanged: (value) {
                  context
                      .read<BasicStrategySettingsCubit>()
                      .togglePracticeBsAllHands(value);
                },
                activeTrackColor: Colors.lightGreenAccent[700],
                activeColor: Colors.green,
              );
            })),
        ListTile(
            // TODO BS Settings Only
            title: const Text("Practice Hard Hands"),
            leading: BlocBuilder<BasicStrategySettingsCubit,
                BasicStrategySettingsState>(builder: (context, state) {
              return Switch(
                value: state.practiceBsHardHands,
                onChanged: (value) {
                  context
                      .read<BasicStrategySettingsCubit>()
                      .togglePracticeBsHardHands(value);
                },
                activeTrackColor: Colors.lightGreenAccent[700],
                activeColor: Colors.green,
              );
            })),
        ListTile(
            // TODO BS Settings Only
            title: const Text("Practice Soft Hands"),
            leading: BlocBuilder<BasicStrategySettingsCubit,
                BasicStrategySettingsState>(builder: (context, state) {
              return Switch(
                value: state.practiceBsSoftHands,
                onChanged: (value) {
                  context
                      .read<BasicStrategySettingsCubit>()
                      .togglePracticeBsSoftHands(value);
                },
                activeTrackColor: Colors.lightGreenAccent[700],
                activeColor: Colors.green,
              );
            })),
        ListTile(
          // TODO BS Settings Only
          title: const Text("Practice Split Hands"),
          leading: BlocBuilder<BasicStrategySettingsCubit,
              BasicStrategySettingsState>(builder: (context, state) {
            return Switch(
              value: state.practiceBsSplitHands,
              onChanged: (value) {
                context
                    .read<BasicStrategySettingsCubit>()
                    .togglePracticeBsSplitHands(value);
              },
              activeTrackColor: Colors.lightGreenAccent[700],
              activeColor: Colors.green,
            );
          }),
          // trailing: IconButton(
          //   icon: const Icon(Icons.info_outline),
          //   color: Colors.lightBlue[400],
          //   onPressed: () {
          //     showDialog(
          //       context: context,
          //       builder: (context) {
          //         return BsInfoPopupWidget(infoTitle: 'Split Hands', playerAdvantage: '');
          //       },
          //     );
          //   },
          // ),
        ),
        Divider(color: Colors.blue[300], thickness: 2),
        ListTile(
          // TODO BS and Game Settings Only
          title: const Text("Illustrious 18 Deviations"),
          leading: BlocBuilder<BasicStrategySettingsCubit,
              BasicStrategySettingsState>(builder: (context, state) {
            return Switch(
              value: state.practiceIllustrious18,
              onChanged: (value) {
                context
                    .read<BasicStrategySettingsCubit>()
                    .toggleIllustrious18(value);
              },
              activeTrackColor: Colors.lightGreenAccent[700],
              activeColor: Colors.green,
            );
          }),
          // trailing: IconButton(
          //     icon: const Icon(Icons.info_outline),
          //     color: Colors.lightBlue[400],
          //     onPressed: () {
          //       showDialog(
          //         context: context,
          //         builder: (context) {
          //           return BsInfoPopupWidget(infoTitle: 'Illustrious 18');
          //         },
          //       );
          //     }),
        ),
        ListTile(
            // TODO BS and Game Settings Only
            title: const Text("Fab 4 Deviations"),
            leading: BlocBuilder<BasicStrategySettingsCubit,
                BasicStrategySettingsState>(builder: (context, state) {
              return Switch(
                value: state.practiceFab4,
                onChanged: (value) {
                  context.read<BasicStrategySettingsCubit>().toggleFab4(value);
                },
                activeTrackColor: Colors.lightGreenAccent[700],
                activeColor: Colors.green,
              );
            })),
        ListTile(
            // TODO BS and Game Settings Only
            title: const Text("Insurance Deviations"),
            leading: BlocBuilder<BasicStrategySettingsCubit,
                BasicStrategySettingsState>(builder: (context, state) {
              return Switch(
                value: state.practiceInsurance,
                onChanged: (value) {
                  context
                      .read<BasicStrategySettingsCubit>()
                      .toggleInsurance(value);
                },
                activeTrackColor: Colors.lightGreenAccent[700],
                activeColor: Colors.green,
              );
            })),
      ],
    ))));
  }
}

//* This route renders the info popup routing to work
// Route<Object?> _dialogBuilder(BuildContext context, Object? arguments) {
//   return DialogRoute<void>(
//     context: context,
//     builder: (BuildContext context) => Dialog(
//         backgroundColor: Colors.transparent,
//         insetPadding: const EdgeInsets.all(10),
//         child: Container(
//             width: double.infinity,
//             height: 400,
//             padding: const EdgeInsets.fromLTRB(20, 20, 20, 10),
//             decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(15),
//               color: Colors.lightBlue,
//             ),
//             child: Column(
//               children: const [
//                 Text(
//                   'TEST',
//                   // context._infoPopupTitle,
//                   style: TextStyle(fontSize: 24, color: Colors.white),
//                   textAlign: TextAlign.center,
//                 ),
//               ],
//             ))),
//   );
// }

// class BsInfoPopupWidget extends StatelessWidget {
//   String infoTitle = '';
//   BsInfoPopupWidget({Key? key, required this.infoTitle}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Dialog(
//         backgroundColor: Colors.transparent,
//         insetPadding: const EdgeInsets.all(10),
//         child: Container(
//             width: double.infinity,
//             height: 400,
//             padding: const EdgeInsets.fromLTRB(20, 20, 20, 10),
//             decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(15),
//               color: Colors.lightBlue,
//             ),
//             child: Column(
//               children: [
//                 Text(
//                   infoTitle,
//                   // context._infoPopupTitle,
//                   style: TextStyle(fontSize: 24, color: Colors.white),
//                   textAlign: TextAlign.center,
//                 ),
//               ],
//             )));
//   }
// }
