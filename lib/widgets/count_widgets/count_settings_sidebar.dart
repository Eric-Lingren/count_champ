import 'dart:math';

import 'package:count_champ/logic/cubits/settings/count_settings_cubit/count_settings_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CountSettingsSidebar extends StatefulWidget {
  const CountSettingsSidebar({Key? key}) : super(key: key);

  @override
  _CountSettingsSidebarState createState() => _CountSettingsSidebarState();
}

class _CountSettingsSidebarState extends State<CountSettingsSidebar> {
  @override
  Widget build(BuildContext context) {
    return (Scaffold(
        body: SingleChildScrollView(
            child: Column(
      children: <Widget>[
        BlocBuilder<CountSettingsCubit, CountSettingsState>(
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
                  context.read<CountSettingsCubit>().setDeckQuantity(value);
                },
              ));
        }),
        Divider( color: Colors.blue[300], thickness: 2 ),
        ListTile(
            title: const Text("Show Count"),
            leading: BlocBuilder<CountSettingsCubit, CountSettingsState>(
                builder: (context, state) {
              return Switch(
                value: state.showCount,
                onChanged: (value) {
                  context.read<CountSettingsCubit>().toggleShowCount(value);
                },
                activeTrackColor: Colors.lightGreenAccent[700],
                activeColor: Colors.green,
              );
            })),
        ListTile(
            title: const Text("Speed Count"),
            leading: BlocBuilder<CountSettingsCubit, CountSettingsState>(
                builder: (context, state) {
              return Switch(
                value: state.speedCountEnabled,
                onChanged: (value) {
                  context.read<CountSettingsCubit>().toggleSpeedCount(value);
                },
                activeTrackColor: Colors.lightGreenAccent[700],
                activeColor: Colors.green,
              );
            })),
        BlocBuilder<CountSettingsCubit, CountSettingsState>(
            builder: (context, state) {
              if(state.speedCountEnabled == true){
                return ListTile(
                    title: Text('Cards Per Second: ${state.cardsPerSecond}'),
                    isThreeLine: true,
                    subtitle: Slider(
                      min: 0.5,
                      max: 5.0,
                      value: state.cardsPerSecond,
                      divisions: 10,
                      label: '${state.cardsPerSecond}',
                      onChanged: (value) {
                        context.read<CountSettingsCubit>().setCardsPerSecond(value);
                      },
                    ));
              }
              return const SizedBox.shrink();
        }),
        Divider( color: Colors.blue[300], thickness: 2 ),
        ListTile(
            title: const Text("Hi-Lo"),
            leading: BlocBuilder<CountSettingsCubit, CountSettingsState>(
                builder: (context, state) {
              return Switch(
                value: state.hiLoEnabled,
                onChanged: (value) {
                  context.read<CountSettingsCubit>().toggleHiLo(value);
                },
                activeTrackColor: Colors.lightGreenAccent[700],
                activeColor: Colors.green,
              );
            })),
        ListTile(
            title: const Text("Hi-Opt I"),
            leading: BlocBuilder<CountSettingsCubit, CountSettingsState>(
                builder: (context, state) {
              return Switch(
                value: state.hiOpt1Enabled,
                onChanged: (value) {
                  context.read<CountSettingsCubit>().toggleHiOpt1(value);
                },
                activeTrackColor: Colors.lightGreenAccent[700],
                activeColor: Colors.green,
              );
            })),
        ListTile(
            title: const Text("Hi-Opt II"),
            leading: BlocBuilder<CountSettingsCubit, CountSettingsState>(
                builder: (context, state) {
              return Switch(
                value: state.hiOpt2Enabled,
                onChanged: (value) {
                  context.read<CountSettingsCubit>().toggleHiOpt2(value);
                },
                activeTrackColor: Colors.lightGreenAccent[700],
                activeColor: Colors.green,
              );
            })),





        ListTile(
            title: const Text("Halves"),
            leading: BlocBuilder<CountSettingsCubit, CountSettingsState>(
                builder: (context, state) {
              return Switch(
                value: state.halvesEnabled,
                onChanged: (value) {
                  context.read<CountSettingsCubit>().toggleHalves(value);
                },
                activeTrackColor: Colors.lightGreenAccent[700],
                activeColor: Colors.green,
              );
            })),
        ListTile(
            title: const Text("Knockout (K-O)"),
            leading: BlocBuilder<CountSettingsCubit, CountSettingsState>(
                builder: (context, state) {
              return Switch(
                value: state.koEnabled,
                onChanged: (value) {
                  context.read<CountSettingsCubit>().toggleKo(value);
                },
                activeTrackColor: Colors.lightGreenAccent[700],
                activeColor: Colors.green,
              );
            })),
        ListTile(
            title: const Text("Red 7"),
            leading: BlocBuilder<CountSettingsCubit, CountSettingsState>(
                builder: (context, state) {
              return Switch(
                value: state.red7Enabled,
                onChanged: (value) {
                  context.read<CountSettingsCubit>().toggleRed7(value);
                },
                activeTrackColor: Colors.lightGreenAccent[700],
                activeColor: Colors.green,
              );
            })),
        ListTile(
            title: const Text("Zen"),
            leading: BlocBuilder<CountSettingsCubit, CountSettingsState>(
                builder: (context, state) {
              return Switch(
                value: state.zenEnabled,
                onChanged: (value) {
                  context.read<CountSettingsCubit>().toggleZen(value);
                },
                activeTrackColor: Colors.lightGreenAccent[700],
                activeColor: Colors.green,
              );
            })),
        ListTile(
            title: const Text("Omega II"),
            leading: BlocBuilder<CountSettingsCubit, CountSettingsState>(
                builder: (context, state) {
              return Switch(
                value: state.omega2Enabled,
                onChanged: (value) {
                  context.read<CountSettingsCubit>().toggleOmega2(value);
                },
                activeTrackColor: Colors.lightGreenAccent[700],
                activeColor: Colors.green,
              );
            })),
      ],
    ))));
  }
}
