import 'dart:math';

import 'package:count_champ/logic/cubits/running_count_stats_cubit/session/running_count_session_stats_cubit.dart';
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
        BlocBuilder<CountSettingsCubit, CountSettingsState>(
            builder: (context, state) {
          return ListTile( // TODO - Only for GamePlay and Counting, not BS
              title: Text('Deck Penetration:${state.deckPenetration.round()}%'),
              isThreeLine: true,
              subtitle: Slider(
                min: 0.0,
                max: 100.0,
                value: state.deckPenetration,
                divisions: 20,
                label: '${state.deckPenetration.round()}',
                onChanged: (value) {
                  context.read<CountSettingsCubit>().setDeckPenetration(value);
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
                    title: Text('Cards Per Second: ${state.cardsPerSecond.toStringAsFixed(1)}'),
                    isThreeLine: true,
                    subtitle: Slider(
                      min: 0.5,
                      max: 5.0,
                      value: state.cardsPerSecond,
                      divisions: 9,
                      label: state.cardsPerSecond.toStringAsFixed(1),
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
            title: const Text("Wong Halves"),
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


        ListTile(
            title: const Text("Thorp's Ten-Count"),
            leading: BlocBuilder<CountSettingsCubit, CountSettingsState>(
                builder: (context, state) {
              return Switch(
                value: state.thorps10Enabled,
                onChanged: (value) {
                  context.read<CountSettingsCubit>().toggleThorps10(value);
                },
                activeTrackColor: Colors.lightGreenAccent[700],
                activeColor: Colors.green,
              );
            })),
        ListTile(
            title: const Text("Ace/Five Count"),
            leading: BlocBuilder<CountSettingsCubit, CountSettingsState>(
                builder: (context, state) {
              return Switch(
                value: state.acefiveEnabled,
                onChanged: (value) {
                  context.read<CountSettingsCubit>().toggleAceFive(value);
                },
                activeTrackColor: Colors.lightGreenAccent[700],
                activeColor: Colors.green,
              );
            })),
        ListTile(
            title: const Text("KISS I"),
            leading: BlocBuilder<CountSettingsCubit, CountSettingsState>(
                builder: (context, state) {
              return Switch(
                value: state.kiss1Enabled,
                onChanged: (value) {
                  context.read<CountSettingsCubit>().toggleKiss1(value);
                },
                activeTrackColor: Colors.lightGreenAccent[700],
                activeColor: Colors.green,
              );
            })),
        ListTile(
            title: const Text("KISS II"),
            leading: BlocBuilder<CountSettingsCubit, CountSettingsState>(
                builder: (context, state) {
              return Switch(
                value: state.kiss2Enabled,
                onChanged: (value) {
                  context.read<CountSettingsCubit>().toggleKiss2(value);
                },
                activeTrackColor: Colors.lightGreenAccent[700],
                activeColor: Colors.green,
              );
            })),
        ListTile(
            title: const Text("KISS III"),
            leading: BlocBuilder<CountSettingsCubit, CountSettingsState>(
                builder: (context, state) {
              return Switch(
                value: state.kiss3Enabled,
                onChanged: (value) {
                  context.read<CountSettingsCubit>().toggleKiss3(value);
                },
                activeTrackColor: Colors.lightGreenAccent[700],
                activeColor: Colors.green,
              );
            })),
        ListTile(
            title: const Text("Canfield Expert"),
            leading: BlocBuilder<CountSettingsCubit, CountSettingsState>(
                builder: (context, state) {
              return Switch(
                value: state.canfieldExpertEnabled,
                onChanged: (value) {
                  context.read<CountSettingsCubit>().toggleCanfieldExpert(value);
                },
                activeTrackColor: Colors.lightGreenAccent[700],
                activeColor: Colors.green,
              );
            })),
        ListTile(
            title: const Text("Canfield Master"),
            leading: BlocBuilder<CountSettingsCubit, CountSettingsState>(
                builder: (context, state) {
              return Switch(
                value: state.canfieldMasterEnabled,
                onChanged: (value) {
                  context.read<CountSettingsCubit>().toggleCanfieldMaster(value);
                },
                activeTrackColor: Colors.lightGreenAccent[700],
                activeColor: Colors.green,
              );
            })),
        ListTile(
            title: const Text("Mentor"),
            leading: BlocBuilder<CountSettingsCubit, CountSettingsState>(
                builder: (context, state) {
              return Switch(
                value: state.mentorEnabled,
                onChanged: (value) {
                  context.read<CountSettingsCubit>().toggleMentor(value);
                },
                activeTrackColor: Colors.lightGreenAccent[700],
                activeColor: Colors.green,
              );
            })),
        ListTile(
            title: const Text("Reko"),
            leading: BlocBuilder<CountSettingsCubit, CountSettingsState>(
                builder: (context, state) {
              return Switch(
                value: state.rekoEnabled,
                onChanged: (value) {
                  context.read<CountSettingsCubit>().toggleReko(value);
                },
                activeTrackColor: Colors.lightGreenAccent[700],
                activeColor: Colors.green,
              );
            })),
        ListTile(
            title: const Text("Silver Fox"),
            leading: BlocBuilder<CountSettingsCubit, CountSettingsState>(
                builder: (context, state) {
              return Switch(
                value: state.silverFoxEnabled,
                onChanged: (value) {
                  context.read<CountSettingsCubit>().toggleSilverFox(value);
                },
                activeTrackColor: Colors.lightGreenAccent[700],
                activeColor: Colors.green,
              );
            })),
        ListTile(
            title: const Text("UBZ 2"),
            leading: BlocBuilder<CountSettingsCubit, CountSettingsState>(
                builder: (context, state) {
              return Switch(
                value: state.ubz2Enabled,
                onChanged: (value) {
                  context.read<CountSettingsCubit>().toggleUbz2(value);
                },
                activeTrackColor: Colors.lightGreenAccent[700],
                activeColor: Colors.green,
              );
            })),
        ListTile(
            title: const Text("Revere Adv. Plus Minus"),
            leading: BlocBuilder<CountSettingsCubit, CountSettingsState>(
                builder: (context, state) {
              return Switch(
                value: state.revereAdvPlusMinusEnabled,
                onChanged: (value) {
                  context.read<CountSettingsCubit>().toggleRevereAdvPlusMinus(value);
                },
                activeTrackColor: Colors.lightGreenAccent[700],
                activeColor: Colors.green,
              );
            })),
        ListTile(
            title: const Text("Revere Point Count"),
            leading: BlocBuilder<CountSettingsCubit, CountSettingsState>(
                builder: (context, state) {
              return Switch(
                value: state.reverePointCountEnabled,
                onChanged: (value) {
                  context.read<CountSettingsCubit>().toggleReverePointCount(value);
                },
                activeTrackColor: Colors.lightGreenAccent[700],
                activeColor: Colors.green,
              );
            })),
        ListTile(
            title: const Text("Revere APC"),
            leading: BlocBuilder<CountSettingsCubit, CountSettingsState>(
                builder: (context, state) {
              return Switch(
                value: state.revereApcEnabled,
                onChanged: (value) {
                  context.read<CountSettingsCubit>().toggleRevereApc(value);
                },
                activeTrackColor: Colors.lightGreenAccent[700],
                activeColor: Colors.green,
              );
            })),
        ListTile(
            title: const Text("Revere 14"),
            leading: BlocBuilder<CountSettingsCubit, CountSettingsState>(
                builder: (context, state) {
              return Switch(
                value: state.revere14Enabled,
                onChanged: (value) {
                  context.read<CountSettingsCubit>().toggleRevere14(value);
                },
                activeTrackColor: Colors.lightGreenAccent[700],
                activeColor: Colors.green,
              );
            })),
        ListTile(
            title: const Text("Uston Adv. Plus Minus"),
            leading: BlocBuilder<CountSettingsCubit, CountSettingsState>(
                builder: (context, state) {
              return Switch(
                value: state.ustonAdvPlusMinusEnabled,
                onChanged: (value) {
                  context.read<CountSettingsCubit>().toggleUstonAdvPlusMinus(value);
                },
                activeTrackColor: Colors.lightGreenAccent[700],
                activeColor: Colors.green,
              );
            })),
        ListTile(
            title: const Text("Uston APC"),
            leading: BlocBuilder<CountSettingsCubit, CountSettingsState>(
                builder: (context, state) {
              return Switch(
                value: state.ustonApcEnabled,
                onChanged: (value) {
                  context.read<CountSettingsCubit>().toggleUstonApc(value);
                },
                activeTrackColor: Colors.lightGreenAccent[700],
                activeColor: Colors.green,
              );
            })),
        ListTile(
            title: const Text("Uston SS"),
            leading: BlocBuilder<CountSettingsCubit, CountSettingsState>(
                builder: (context, state) {
              return Switch(
                value: state.ustonSsEnabled,
                onChanged: (value) {
                  context.read<CountSettingsCubit>().toggleUstonSs(value);
                },
                activeTrackColor: Colors.lightGreenAccent[700],
                activeColor: Colors.green,
              );
            })),
      ],
    ))));
  }
}
