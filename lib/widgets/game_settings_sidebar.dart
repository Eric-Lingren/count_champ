import 'package:count_champ/logic/cubits/game_settings_cubit/game_settings_cubit.dart';
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
        body: SingleChildScrollView(child: Column(
      children: <Widget>[
        ListTile(
            title: const Text("Double After Split"),
            leading: BlocBuilder<GameSettingsCubit, GameSettingsState>(
                builder: (context, state) {
              return Switch(
                value: state.canDas,
                onChanged: (value) {
                  context.read<GameSettingsCubit>().toggleDas(value);
                },
                activeTrackColor: Colors.lightGreenAccent[700],
                activeColor: Colors.green,
              );
            })),
        ListTile( // TODO Off is Reno rules
            title: const Text("Double Any Two Cards"), 
            leading: BlocBuilder<GameSettingsCubit, GameSettingsState>(
                builder: (context, state) {
              return Switch(
                value: state.canDoubleAny2,
                onChanged: (value) {
                  context.read<GameSettingsCubit>().toggleCanDoubleAny2(value);
                },
                activeTrackColor: Colors.lightGreenAccent[700],
                activeColor: Colors.green,
              );
            })),
        // ListTile( // TODO - Only for GamePlay, not BS
        //     title: const Text("Can Resplit Pairs"), 
        //     leading: BlocBuilder<GameSettingsCubit, GameSettingsState>(
        //         builder: (context, state) {
        //       return Switch(
        //         value: state.canResplitPairs,
        //         onChanged: (value) {
        //           context
        //               .read<GameSettingsCubit>()
        //               .toggleCanResplitPairs(value);
        //         },
        //         activeTrackColor: Colors.lightGreenAccent[700],
        //         activeColor: Colors.green,
        //       );
        //     })),
        ListTile(
            title: const Text("Splitting Aces"),
            leading: BlocBuilder<GameSettingsCubit, GameSettingsState>(
                builder: (context, state) {
              return Switch(
                value: state.canSplitAces,
                onChanged: (value) {
                  context.read<GameSettingsCubit>().toggleCanSplitAces(value);
                },
                activeTrackColor: Colors.lightGreenAccent[700],
                activeColor: Colors.green,
              );
            })),
        // ListTile( // TODO - Only for GamePlay, not BS
        //     title: const Text("Can Hit After Splitting Aces"), 
        //     leading: BlocBuilder<GameSettingsCubit, GameSettingsState>(
        //         builder: (context, state) {
        //       return Switch(
        //         value: state.canHitAfterSplittingAces,
        //         onChanged: (value) {
        //           context
        //               .read<GameSettingsCubit>()
        //               .toggleCanHitAfterSplitingAces(value);
        //         },
        //         activeTrackColor: Colors.lightGreenAccent[700],
        //         activeColor: Colors.green,
        //       );
        //     })),
        ListTile(
            title: const Text("Dealer Hits Soft 17"),
            leading: BlocBuilder<GameSettingsCubit, GameSettingsState>(
                builder: (context, state) {
              return Switch(
                value: state.dealerHitsSoft17,
                onChanged: (value) {
                  context
                      .read<GameSettingsCubit>()
                      .toggleDealerHitsSoft17(value);
                },
                activeTrackColor: Colors.lightGreenAccent[700],
                activeColor: Colors.green,
              );
            })),
        ListTile(
            title: const Text("Early Surrender Allowed"),
            leading: BlocBuilder<GameSettingsCubit, GameSettingsState>(
                builder: (context, state) {
              return Switch(
                value: state.canEarlySurrender,
                onChanged: (value) {
                  context
                      .read<GameSettingsCubit>()
                      .toggleCanEarlySurrender(value);
                },
                activeTrackColor: Colors.lightGreenAccent[700],
                activeColor: Colors.green,
              );
            })),
        ListTile(
            title: const Text("Late Surrender Allowed"),
            leading: BlocBuilder<GameSettingsCubit, GameSettingsState>(
                builder: (context, state) {
              return Switch(
                value: state.canLateSurrender,
                onChanged: (value) {
                  context
                      .read<GameSettingsCubit>()
                      .toggleCanLateSurrender(value);
                },
                activeTrackColor: Colors.lightGreenAccent[700],
                activeColor: Colors.green,
              );
            })),
        // ListTile( // TODO - Only for GamePlay, not BS
        //     title: const Text("Dealer Peeks for 21"),
        //     leading: BlocBuilder<GameSettingsCubit, GameSettingsState>(
        //         builder: (context, state) {
        //       return Switch(
        //         value: state.dealerPeeks,
        //         onChanged: (value) {
        //           context.read<GameSettingsCubit>().toggleDealerPeeks(value);
        //         },
        //         activeTrackColor: Colors.lightGreenAccent[700],
        //         activeColor: Colors.green,
        //       );
        //     })),
        // BlocBuilder<GameSettingsCubit, GameSettingsState>(
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
        //           context.read<GameSettingsCubit>().setDeckPenetration(value);
        //         },
        //       ));
        // }),
        ListTile( // TODO BS Settings Only
            title: const Text("Practice All Hands"),
            leading: BlocBuilder<GameSettingsCubit, GameSettingsState>(
                builder: (context, state) {
              return Switch(
                value: state.practiceBsAllHands,
                onChanged: (value) {
                  context
                      .read<GameSettingsCubit>()
                      .togglePracticeBsAllHands(value);
                },
                activeTrackColor: Colors.lightGreenAccent[700],
                activeColor: Colors.green,
              );
            })),
        ListTile( // TODO BS Settings Only
            title: const Text("Practice Hard Hands"),
            leading: BlocBuilder<GameSettingsCubit, GameSettingsState>(
                builder: (context, state) {
              return Switch(
                value: state.practiceBsHardHands,
                onChanged: (value) {
                  context
                      .read<GameSettingsCubit>()
                      .togglePracticeBsHardHands(value);
                },
                activeTrackColor: Colors.lightGreenAccent[700],
                activeColor: Colors.green,
              );
            })),
        ListTile( // TODO BS Settings Only
            title: const Text("Practice Soft Hands"),
            leading: BlocBuilder<GameSettingsCubit, GameSettingsState>(
                builder: (context, state) {
              return Switch(
                value: state.practiceBsSoftHands,
                onChanged: (value) {
                  context
                      .read<GameSettingsCubit>()
                      .togglePracticeBsSoftHands(value);
                },
                activeTrackColor: Colors.lightGreenAccent[700],
                activeColor: Colors.green,
              );
            })),
        ListTile( // TODO BS Settings Only
            title: const Text("Practice Split Hands"),
            leading: BlocBuilder<GameSettingsCubit, GameSettingsState>(
                builder: (context, state) {
              return Switch(
                value: state.practiceBsSplitHands,
                onChanged: (value) {
                  context
                      .read<GameSettingsCubit>()
                      .togglePracticeBsSplitHands(value);
                },
                activeTrackColor: Colors.lightGreenAccent[700],
                activeColor: Colors.green,
              );
            })),
        ListTile( // TODO BS and Game Settings Only
            title: const Text("Illustrious 18 Deviations"),
            leading: BlocBuilder<GameSettingsCubit, GameSettingsState>(
                builder: (context, state) {
              return Switch(
                value: state.practiceIllustrious18,
                onChanged: (value) {
                  context
                      .read<GameSettingsCubit>()
                      .toggleIllustrious18(value);
                },
                activeTrackColor: Colors.lightGreenAccent[700],
                activeColor: Colors.green,
              );
            })),
        ListTile( // TODO BS and Game Settings Only
            title: const Text("Fab 4 Deviations"),
            leading: BlocBuilder<GameSettingsCubit, GameSettingsState>(
                builder: (context, state) {
              return Switch(
                value: state.practiceFab4,
                onChanged: (value) {
                  context
                      .read<GameSettingsCubit>()
                      .toggleFab4(value);
                },
                activeTrackColor: Colors.lightGreenAccent[700],
                activeColor: Colors.green,
              );
            })),
                    BlocBuilder<GameSettingsCubit, GameSettingsState>(
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
                  context.read<GameSettingsCubit>().setDeckQuantity(value);
                },
              ));
        }),
      ],
    ))));
  }
}
