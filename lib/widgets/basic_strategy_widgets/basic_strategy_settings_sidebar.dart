import 'package:count_champ/logic/cubits/settings/basic_strategy_settings_cubit/basic_strategy_settings_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GameSettingsSidebar extends StatefulWidget {
  const GameSettingsSidebar({Key? key}) : super(key: key);

  @override
  _GameSettingsSidebarState createState() => _GameSettingsSidebarState();
}

class _GameSettingsSidebarState extends State<GameSettingsSidebar> {
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
                divisions: 8,
                label: '${state.deckQuantity.round()}',
                onChanged: (value) {
                  context.read<BasicStrategySettingsCubit>().setDeckQuantity(value);
                },
              ));
        }),
        Divider( color: Colors.blue[300], thickness: 2 ),
        ListTile(
            title: const Text("Double After Split"),
            leading: BlocBuilder<BasicStrategySettingsCubit, BasicStrategySettingsState>(
                builder: (context, state) {
              return Switch(
                value: state.canDas,
                onChanged: (value) {
                  context.read<BasicStrategySettingsCubit>().toggleDas(value);
                },
                activeTrackColor: Colors.lightGreenAccent[700],
                activeColor: Colors.green,
              );
            })),
        ListTile(
            // TODO Off is Reno rules
            title: const Text("Double Any Two Cards"),
            leading: BlocBuilder<BasicStrategySettingsCubit, BasicStrategySettingsState>(
                builder: (context, state) {
              return Switch(
                value: state.canDoubleAny2,
                onChanged: (value) {
                  context.read<BasicStrategySettingsCubit>().toggleCanDoubleAny2(value);
                },
                activeTrackColor: Colors.lightGreenAccent[700],
                activeColor: Colors.green,
              );
            })),
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
            leading: BlocBuilder<BasicStrategySettingsCubit, BasicStrategySettingsState>(
                builder: (context, state) {
              return Switch(
                value: state.canSplitAces,
                onChanged: (value) {
                  context.read<BasicStrategySettingsCubit>().toggleCanSplitAces(value);
                },
                activeTrackColor: Colors.lightGreenAccent[700],
                activeColor: Colors.green,
              );
            })),
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
            leading: BlocBuilder<BasicStrategySettingsCubit, BasicStrategySettingsState>(
                builder: (context, state) {
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
            })),
        ListTile(
            title: const Text("Surrender Allowed"),
            leading: BlocBuilder<BasicStrategySettingsCubit, BasicStrategySettingsState>(
                builder: (context, state) {
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
        Divider( color: Colors.blue[300], thickness: 2 ),
        ListTile(
            // TODO BS Settings Only
            title: const Text("Practice All Hands"),
            leading: BlocBuilder<BasicStrategySettingsCubit, BasicStrategySettingsState>(
                builder: (context, state) {
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
            leading: BlocBuilder<BasicStrategySettingsCubit, BasicStrategySettingsState>(
                builder: (context, state) {
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
            leading: BlocBuilder<BasicStrategySettingsCubit, BasicStrategySettingsState>(
                builder: (context, state) {
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
            leading: BlocBuilder<BasicStrategySettingsCubit, BasicStrategySettingsState>(
                builder: (context, state) {
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
            })),
        Divider( color: Colors.blue[300], thickness: 2 ),
        ListTile(
            // TODO BS and Game Settings Only
            title: const Text("Illustrious 18 Deviations"),
            leading: BlocBuilder<BasicStrategySettingsCubit, BasicStrategySettingsState>(
                builder: (context, state) {
              return Switch(
                value: state.practiceIllustrious18,
                onChanged: (value) {
                  context.read<BasicStrategySettingsCubit>().toggleIllustrious18(value);
                },
                activeTrackColor: Colors.lightGreenAccent[700],
                activeColor: Colors.green,
              );
            })),
        ListTile(
            // TODO BS and Game Settings Only
            title: const Text("Fab 4 Deviations"),
            leading: BlocBuilder<BasicStrategySettingsCubit, BasicStrategySettingsState>(
                builder: (context, state) {
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
            leading: BlocBuilder<BasicStrategySettingsCubit, BasicStrategySettingsState>(
                builder: (context, state) {
              return Switch(
                value: state.practiceInsurance,
                onChanged: (value) {
                  context.read<BasicStrategySettingsCubit>().toggleInsurance(value);
                },
                activeTrackColor: Colors.lightGreenAccent[700],
                activeColor: Colors.green,
              );
            })),
      ],
    ))));
  }
}
