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
            ),
            trailing: IconButton(
                icon: const Icon(Icons.info_outline),
                color: Colors.lightBlue[400],
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return BsInfoPopupWidget(
                          infoTitle: 'Deck Quantity',
                          playerAdvantage: '0.0% - 0.48%',
                          description:
                              'Fewer decks allow a greater player advantage. 8 decks offer 0.0% player advantage. 6 deck games offer a 0.02% advantage. 4 deck games offer a 0.06% advantage. Double-deck and single-decks provide a 0.19% and 0.48% advantage to the player, respectively. Note that the number of decks in play can dramatically affect correct Basic Strategy rules as well.');
                    },
                  );
                }),
          );
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
                        description:
                            'Allows doubling down on any hands that have been created by splitting pairs. This advantageous player rule is generally widespread through most casinos.');
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
                        description:
                            'Allows doubling down on any first two cards. This is advantageous for the player and is quite common. Variations are "Reno Rules," which allow doubling on hard 9-11 only, or "Europen Rules," which only allow doubling on hard 10 & 11. Although rare, avoid games with no doubling on 11 at all costs since it gives the house a 0.50% advantage. If this option is not enabled, the Basic Strategy rules and charts will default to Reno Rules.');
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
                        playerAdvantage: '0.18% - 0.37%',
                        description:
                            'Allows splitting a pair of aces. This is a benefit to the player because it increases the odds of the number of hands with 21. This is a fairly standard rule to find in casinos. The trade-off with this rule is that generally, you are only dealt one card after splitting aces and are not permitted to hit or double down after the split. If you can find a game where hit after splitting aces is allowed (usually riverboat casinos), this brings the player advantage from 0.18% up to 0.37%.');
                  },
                );
              }),
        ),
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
          title: const Text("Dealer Stands Soft 17"),
          leading: BlocBuilder<BasicStrategySettingsCubit,
              BasicStrategySettingsState>(builder: (context, state) {
            return Switch(
              value: state.dealerStandsSoft17,
              onChanged: (value) {
                context
                    .read<BasicStrategySettingsCubit>()
                    .toggleDealerStandsSoft17(value);
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
                        infoTitle: 'Stand Soft 17 - aka S17',
                        playerAdvantage: '0.22%',
                        description:
                            'If the dealer has a soft 17 they will stand rather than hit. This is advantageous for the player because it decrases the odds the dealer will get closer to 21.');
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
          }),
          trailing: IconButton(
              icon: const Icon(Icons.info_outline),
              color: Colors.lightBlue[400],
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return BsInfoPopupWidget(
                        infoTitle: 'Surrender Allowed',
                        playerAdvantage: '0% - 0.39%',
                        description:
                            "Surrender comes in 2 variations - Early Surrender or Late Surrender. Early Surrender is far more favorable to the player, and the advantages change depending on the dealer's face-up card. Early surrender vs Ace = 0.39% player advantage. Early surrender vs 10 = 0.24% player advantage. Late surrender vs Ace = 0% player advantage. Late surrender vs 10 = 0.07% player advantage.");
                  },
                );
              }),
        ),
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
                  if(value == true){ //* Prevents turning off all play types accidentelly
                    context
                        .read<BasicStrategySettingsCubit>()
                        .togglePracticeBsAllHands(value);
                  }
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
