import 'dart:math';

import 'package:count_champ/logic/cubits/running_count_stats_cubit/session/running_count_session_stats_cubit.dart';
import 'package:count_champ/logic/cubits/settings/count_settings_cubit/count_settings_cubit.dart';
import 'package:count_champ/widgets/count_widgets/count_info_popup_widget.dart';
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
            }),
            trailing: IconButton(
              icon: const Icon(Icons.info_outline),
              color: Colors.lightBlue[400],
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return CountInfoPopupWidget(
                        infoTitle: 'Hi-Lo',
                        easeOfUse: '6',
                        systemType: 'Balanced',
                        bettingCorrelation: '97%',
                        playingEfficency: '51%',
                        insuranceCorrelation: '76%',
                        indexes: const [1,1,1,1,1,0,0,0,1,1],
                        systemInfo: 'Hi-Lo is by far the most widely used card counting system. It is generally accepted as a good balance between ease of use and profitability. Created by computer scientist Harvey Dubner in 1963, Hi-Lo was later optimized by computer programmer Julian Braun. Edward Thorp published this version in his 1966 book "Beat The Dealer." It was further refined again by Stanford Wong and published in his 1994 book "Professional Blackjack."'
                        );
                  },
                );
              }),),
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
            }),
            trailing: IconButton(
              icon: const Icon(Icons.info_outline),
              color: Colors.lightBlue[400],
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return CountInfoPopupWidget(
                        infoTitle: 'Hi-Opt I',
                        easeOfUse: '6.5',
                        systemType: 'Balanced',
                        bettingCorrelation: '88%',
                        playingEfficency: '61%',
                        insuranceCorrelation: '85%',
                        indexes: const [0,1,1,1,1,0,0,0,-1,0],
                        systemInfo: 'Hi-Opt I (aka Highly Optimum) is a simple system that used to be the most popular counting system for single deck games. As these games were replaced by shoe games, the popluarity of this system waned. It was created by Lance Humble and Carl Cooper and built upon the foundation laid by Charles Einstein in 1968. For this reason it is often refered to as the Einstein Count. The current version of this system can be found in the 1980 book titled "The Worlds Greatest Blackjack Book."'
                        
                    );
                  },
                );
              }),),
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
            }),
            trailing: IconButton(
              icon: const Icon(Icons.info_outline),
              color: Colors.lightBlue[400],
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return CountInfoPopupWidget(
                        infoTitle: 'Hi-Opt II',
                        easeOfUse: '4',
                        systemType: 'Balanced',
                        bettingCorrelation: '91%',
                        playingEfficency: '67%',
                        insuranceCorrelation: '91%',
                        indexes: const [1,1,2,2,1,1,0,0,-2,0],
                        systemInfo: 'Hi-Opt II is a more complex version of Hi-Opt I and a level 2 system, meaning the card indexes have two levels of values. It is considered a complicated though highly effective system. It works very well in single-deck games and shoe games but performs better in shoe games with a separate Ace side count. This system was developed by Lance Humble and Julian Braun in 1976 and is found in the book "The Worlds Greatest Blackjack Book."'
                        
                    );
                  },
                );
              }),),
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
            }),
            trailing: IconButton(
              icon: const Icon(Icons.info_outline),
              color: Colors.lightBlue[400],
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return CountInfoPopupWidget(
                        infoTitle: 'Wong Halves',
                        easeOfUse: '2.5',
                        systemType: 'Balanced',
                        bettingCorrelation: '99%',
                        playingEfficency: '56%',
                        insuranceCorrelation: '72%',
                        indexes: const [.5,1,1,1.5,1,.5,0,.5,-1,-1],
                        systemInfo: 'Wong Halves (aka Wong Count or simply Wong) is a fractional counting system. It is widely regarded as one of the most accurate systems and one of the most difficult ever created, so novice counters should avoid it. John Ferguson, who went by Stanford Wong, developed this system and published it in his 1975 book "Professional Blackjack." Although still used, most players opt for a more simplified counting system to minimize playing errors.'
                        
                    );
                  },
                );
              }),),
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
            }),
            trailing: IconButton(
              icon: const Icon(Icons.info_outline),
              color: Colors.lightBlue[400],
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return CountInfoPopupWidget(
                        infoTitle: 'Knockout - aka K-O',
                        easeOfUse: '7.5',
                        systemType: 'Unbalanced',
                        bettingCorrelation: '98%',
                        playingEfficency: '55%',
                        insuranceCorrelation: '78%',
                        indexes: const [1,1,1,1,1,1,0,0,-1,-1],
                        systemInfo: 'K-O Stands for "Knockout Blackjack" or Olaf Vancura and Ken Fuchs, who created this system and published it in their 1996 book by the same name. This unbalanced system is straightforward to learn and is just as effective as Hi-Lo without requiring conversion to True Count.  Once the Running Count reaches +2, the deck is in your favor. It has been coined "The Easiest Card Counting System Ever Devised."'
                        
                    );
                  },
                );
              }),),
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
            }),
            trailing: IconButton(
              icon: const Icon(Icons.info_outline),
              color: Colors.lightBlue[400],
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return CountInfoPopupWidget(
                        infoTitle: 'Red Seven',
                        easeOfUse: '7',
                        systemType: 'Unbalanced',
                        bettingCorrelation: '98%',
                        playingEfficency: '54%',
                        insuranceCorrelation: '78%',
                        indexes: const [1,1,1,1,1,'0/1',0,0,-1,-1],
                        systemInfo: 'Red Seven was one of the first "Easy" counting systems devised. It was created by Arnold Snyder and published in his 1983 book "Blackbelt in Blackjack." Being unbalanced it does not require conversion to a True Count; However, the value of the seven changes depending upon the suit (red = 1 / black = 0), and the initial count is based upon the number of decks being played.'
                        
                    );
                  },
                );
              }),),
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
            }),
            trailing: IconButton(
              icon: const Icon(Icons.info_outline),
              color: Colors.lightBlue[400],
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return CountInfoPopupWidget(
                        infoTitle: 'Zen Count',
                        easeOfUse: '4',
                        systemType: 'Balanced',
                        bettingCorrelation: '96%',
                        playingEfficency: '63%',
                        insuranceCorrelation: '85%',
                        indexes: const [1,1,2,2,2,1,0,0,-2,-1],
                        systemInfo: 'Zen Count is a level 2 system and is considered the strongest level 2 system for betting efficiency. There are two versions of this system. The original where you convert to True Count by the number of whole decks remaining and the latest where you convert by the number of quarter decks remaining.  The original is seen as more effective. Arnold Snyder published it in his 1983 book "Blackbelt in Blackjack."'
                        
                    );
                  },
                );
              }),),
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
            }),
            trailing: IconButton(
              icon: const Icon(Icons.info_outline),
              color: Colors.lightBlue[400],
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return CountInfoPopupWidget(
                        infoTitle: 'Omega II',
                        easeOfUse: '4',
                        systemType: 'Balanced',
                        bettingCorrelation: '92%',
                        playingEfficency: '67%',
                        insuranceCorrelation: '85%',
                        indexes: const [1,1,2,2,2,1,0,-1,-2,0],
                        systemInfo: 'Omega II is an advanced level 2 system and is considered difficult to use. Since this is an expert system, it should be avoided by beginners.  An Ace side count can be used to improve its effectiveness, but that complicates it even further. Omega II was very popular among counters in the 1990s, but it has since fallen out of fashion in favor of more simplified counting systems. Created by Bryce Carlson, it can be found in his 1992 book titled "Blackjack for Blood."'
                        
                    );
                  },
                );
              }),),
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
            }),
            trailing: IconButton(
              icon: const Icon(Icons.info_outline),
              color: Colors.lightBlue[400],
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return CountInfoPopupWidget(
                        infoTitle: 'Thorps Ten Count',
                        easeOfUse: '5',
                        systemType: 'Balanced',
                        bettingCorrelation: '74%',
                        playingEfficency: '62%',
                        insuranceCorrelation: '?',
                        indexes: const [4,4,4,4,4,4,4,4,-9,4],
                        systemInfo: "Ace counting had been used in the 1940's and 50's, but Thorps Ten Count created by Edward Thorp in 1956 was the first true card counting system, laying the foundations for Hi-Lo. Thorp partnered with professional gambler Manny Kimmel, who went by the name Mr. X. Together they staked \$10,000 in Reno and Lake Tahoe to validate the basis of Thorp's mathematical research that Blackjack could be beaten. Bringing home \$11,000 in profits their first weekend, they proved card counting was both possible and profitable. This counting system is no longer used, but it is an integral piece of history."
                        
                    );
                  },
                );
              }),),
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
