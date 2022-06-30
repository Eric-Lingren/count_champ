import 'package:count_champ/logic/cubits/settings/deviations_settings_cubit/deviations_settings_cubit.dart';
// import 'package:count_champ/widgets/basic_strategy_widgets/bs_info_popup_widget.dart';
// import 'package:count_champ/widgets/global_widgets/achievement_unlocked_alert_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DeviationsSettingsSidebar extends StatefulWidget {
  const DeviationsSettingsSidebar({Key? key}) : super(key: key);

  @override
  _DeviationsSettingsSidebarState createState() =>
      _DeviationsSettingsSidebarState();
}

class _DeviationsSettingsSidebarState extends State<DeviationsSettingsSidebar> {
  final List<double> values = [1.0, 2.0, 6.0, 8.0];
  int selectedIndex = 3;
  // String dropdownValue = 'One';
  @override
  Widget build(BuildContext context) {
    return (Scaffold(
        body: SingleChildScrollView(
            child: Column(
      children: <Widget>[
        BlocBuilder<DeviationsSettingsCubit, DeviationsSettingsState>(
            builder: (context, state) {
          return ListTile(
            title: Text('Deck Quantity: ${state.deckQuantity.round()}'),
            isThreeLine: true,
            subtitle: Slider(
              value: selectedIndex.toDouble(),
              min: 0,
              max: values.length - 1,
              divisions: values.length - 1,
              label: values[selectedIndex].toInt().toString(),
              onChanged: (value) {
                setState(() {
                  selectedIndex = value.toInt();
                });
                context
                    .read<DeviationsSettingsCubit>()
                    .setDeckQuantity(values[selectedIndex]);
              },
            ),
          );
        }),
        // DropdownButton<String>(
        //   value: dropdownValue,
        //   icon: const Icon(Icons.arrow_downward),
        //   elevation: 16,
        //   style: const TextStyle(color: Colors.deepPurple),
        //   underline: Container(
        //     height: 2,
        //     color: Colors.deepPurpleAccent,
        //   ),
        //   onChanged: (String? newValue) {
        //     setState(() {
        //       dropdownValue = newValue!;
        //     });
        //     print(newValue);
        //   },
        //   items: <String>['One', 'Two', 'Free', 'Four']
        //       .map<DropdownMenuItem<String>>((String value) {
        //     return DropdownMenuItem<String>(
        //       value: value,
        //       child: Text(value),
        //     );
        //   }).toList(),
        // ),
        // ListTile(
        //   title: const Text("H17 Rules"),
        //   leading:
        //       BlocBuilder<DeviationsSettingsCubit, DeviationsSettingsState>(
        //           builder: (context, state) {
        //     return Switch(
        //       value: state.practiceIllustrious18,
        //       onChanged: (value) {
        //         context
        //             .read<DeviationsSettingsCubit>()
        //             .toggleIllustrious18(value);
        //       },
        //       activeTrackColor: Colors.lightGreenAccent[700],
        //       activeColor: Colors.green,
        //     );
        //   }),
        // ),
        // ListTile(
        //   title: const Text("S17 Rules"),
        //   leading:
        //       BlocBuilder<DeviationsSettingsCubit, DeviationsSettingsState>(
        //           builder: (context, state) {
        //     return Switch(
        //       value: state.practiceIllustrious18,
        //       onChanged: (value) {
        //         context
        //             .read<DeviationsSettingsCubit>()
        //             .toggleIllustrious18(value);
        //       },
        //       activeTrackColor: Colors.lightGreenAccent[700],
        //       activeColor: Colors.green,
        //     );
        //   }),
        // ),
        Divider(color: Colors.blue[300], thickness: 2),

        ListTile(
          title: const Text("Hi-Lo"),
          leading:
              BlocBuilder<DeviationsSettingsCubit, DeviationsSettingsState>(
                  builder: (context, state) {
            return Switch(
              value: state.hiLoEnabled,
              onChanged: (value) {
                context
                    .read<DeviationsSettingsCubit>()
                    .toggleHilo(value);
              },
              activeTrackColor: Colors.lightGreenAccent[700],
              activeColor: Colors.green,
            );
          }),
        ),
        ListTile(
          title: const Text("Knockout (K-O)"),
          leading:
              BlocBuilder<DeviationsSettingsCubit, DeviationsSettingsState>(
                  builder: (context, state) {
            return Switch(
              value: state.koEnabled,
              onChanged: (value) {
                context
                    .read<DeviationsSettingsCubit>()
                    .toggleKo(value);
              },
              activeTrackColor: Colors.lightGreenAccent[700],
              activeColor: Colors.green,
            );
          }),
        ),
        ListTile(
          title: const Text("Reko"),
          leading:
              BlocBuilder<DeviationsSettingsCubit, DeviationsSettingsState>(
                  builder: (context, state) {
            return Switch(
              value: state.rekoEnabled,
              onChanged: (value) {
                context
                    .read<DeviationsSettingsCubit>()
                    .toggleReko(value);
              },
              activeTrackColor: Colors.lightGreenAccent[700],
              activeColor: Colors.green,
            );
          }),
        ),


        Divider(color: Colors.blue[300], thickness: 2),
        ListTile(
          title: const Text("Illustrious 18 Deviations"),
          leading:
              BlocBuilder<DeviationsSettingsCubit, DeviationsSettingsState>(
                  builder: (context, state) {
            return Switch(
              value: state.practiceIllustrious18,
              onChanged: (value) {
                context
                    .read<DeviationsSettingsCubit>()
                    .toggleIllustrious18(value);
              },
              activeTrackColor: Colors.lightGreenAccent[700],
              activeColor: Colors.green,
            );
          }),
        ),
        ListTile(
            title: const Text("Fab 4 Deviations"),
            leading:
                BlocBuilder<DeviationsSettingsCubit, DeviationsSettingsState>(
                    builder: (context, state) {
              return Switch(
                value: state.practiceFab4,
                onChanged: (value) {
                  context.read<DeviationsSettingsCubit>().toggleFab4(value);
                },
                activeTrackColor: Colors.lightGreenAccent[700],
                activeColor: Colors.green,
              );
            })),
        ListTile(
            title: const Text("Insurance Deviations"),
            leading:
                BlocBuilder<DeviationsSettingsCubit, DeviationsSettingsState>(
                    builder: (context, state) {
              return Switch(
                value: state.practiceInsurance,
                onChanged: (value) {
                  context
                      .read<DeviationsSettingsCubit>()
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
