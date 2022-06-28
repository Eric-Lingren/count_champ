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

// ToDo - Prevent no counting systems from being selected
class _CountSettingsSidebarState extends State<CountSettingsSidebar> {
  final List<double> values = [1.0, 2.0, 4.0, 6.0, 8.0];
  int selectedIndex = 0;
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
              value: selectedIndex.toDouble(),
              min: 0,
              max: values.length - 1,
              divisions: values.length - 1,
              label: values[selectedIndex].toInt().toString(),
              onChanged: (value) {
                setState(() {
                  selectedIndex = value.toInt();
                });
                context.read<CountSettingsCubit>().setDeckQuantity(values[selectedIndex]);
              },
            ),
          );
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
        ListTile(
          title: const Text("Deal 1 Card"),
          leading: BlocBuilder<CountSettingsCubit, CountSettingsState>(
              builder: (context, state) {
            return Switch(
              value: state.isDealingOneCard,
              onChanged: (value) {
                context.read<CountSettingsCubit>().toggleDealOneCard(value);
              },
              activeTrackColor: Colors.lightGreenAccent[700],
              activeColor: Colors.green,
            );
          })),
        ListTile(
          title: const Text("Deal 2 Cards"),
          leading: BlocBuilder<CountSettingsCubit, CountSettingsState>(
              builder: (context, state) {
            return Switch(
              value: state.isDealingTwoCards,
              onChanged: (value) {
                context.read<CountSettingsCubit>().toggleDealTwoCards(value);
              },
              activeTrackColor: Colors.lightGreenAccent[700],
              activeColor: Colors.green,
            );
          })),
        ListTile(
          title: const Text("Deal 4 Cards"),
          leading: BlocBuilder<CountSettingsCubit, CountSettingsState>(
              builder: (context, state) {
            return Switch(
              value: state.isDealingFourCards,
              onChanged: (value) {
                context.read<CountSettingsCubit>().toggleDealFourCards(value);
              },
              activeTrackColor: Colors.lightGreenAccent[700],
              activeColor: Colors.green,
            );
          })),
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
                        systemLevel: '1',
                        // playerAdvantage: '1.0 - 1.5%',
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
                        systemLevel: '1',
                        // playerAdvantage: '',
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
                        systemLevel: '2',
                        // playerAdvantage: '',
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
                        systemLevel: '3',
                        // playerAdvantage: '',
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
                        systemLevel: '1',
                        // playerAdvantage: '',
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
                        systemLevel: '1',
                        // playerAdvantage: '',
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
                        systemLevel: '2',
                        // playerAdvantage: '',
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
                        systemLevel: '2',
                        // playerAdvantage: '',
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
                        systemLevel: '2', 
                        // playerAdvantage: '',
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
            }),
            trailing: IconButton(
              icon: const Icon(Icons.info_outline),
              color: Colors.lightBlue[400],
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return CountInfoPopupWidget(
                        infoTitle: 'Ace Five Count',
                        easeOfUse: '9',
                        systemLevel: '1',
                        // playerAdvantage: '0.3 - 0.67%',
                        systemType: 'Balanced',
                        bettingCorrelation: '54%',
                        playingEfficency: '5%',
                        insuranceCorrelation: '0%',
                        indexes: const [0,0,0,1,0,0,0,0,0,-1],
                        systemInfo: 'The Ace Five Count is the most straightforward counting system to learn since you only need to keep track of 2 cards and no conversion to True Count is required. Though KO & KISS are only slightly more complex they are much more effective. This system was developed by Edward Thorp and was popularized by statistician Michael Shackleford, aka the "Wizards of Odds."'
                    );
                  },
                );
              }),),
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
            }),
            trailing: IconButton(
              icon: const Icon(Icons.info_outline),
              color: Colors.lightBlue[400],
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return CountInfoPopupWidget(
                        infoTitle: 'Kiss I',
                        easeOfUse: '7',
                        systemLevel: '1',
                        // playerAdvantage: '0.48%',
                        systemType: 'Unbalanced',
                        bettingCorrelation: '87%',
                        playingEfficency: '58%',
                        insuranceCorrelation: '81%',
                        indexes: const ['0/1',0,1,1,1,0,0,0,'0/1',-1],
                        systemInfo: 'KISS I is the least effective of the KISS (Keep It Short and Simple) systems. Though all versions are quite easy, KO is considered easier because it is not suite aware, and the cards have standardized indexes.  In KISS I, twos and tens have different values.  Black 2 = 1, Red 2 = 0.  Ten = 0, Face = -1. However, only half the cards must be tracked. Some variations of this system exist, so if you are going to use our trainer with this one, make sure your reference materials match the indexes we listed above.'
                    );
                  },
                );
              }),),
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
            }),
            trailing: IconButton(
              icon: const Icon(Icons.info_outline),
              color: Colors.lightBlue[400],
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return CountInfoPopupWidget(
                        infoTitle: 'Kiss II',
                        easeOfUse: '7',
                        systemLevel: '1',
                        // playerAdvantage: '0.64%',
                        systemType: 'Unbalanced',
                        bettingCorrelation: '90%',
                        playingEfficency: '62%',
                        insuranceCorrelation: '87%',
                        indexes: const ['0/1',1,1,1,1,0,0,0,-1,0],
                        systemInfo: 'KISS II is more effective and easier than KISS I because all ten values are now standardized. Only the value of the two fluctuates based on suite. Black 2 = 1, Red 2 = 0. However, KISS III is even more effective than KISS II and not any more complex. All the KISS systems were created by Fred Renzy and published in his 2003 book titled "Blackjack Bluebook II."'
                    );
                  },
                );
              }),),
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
            }),
            trailing: IconButton(
              icon: const Icon(Icons.info_outline),
              color: Colors.lightBlue[400],
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return CountInfoPopupWidget(
                        infoTitle: 'Kiss III',
                        easeOfUse: '7',
                        systemLevel: '1',
                        // playerAdvantage: '0.64%',
                        systemType: 'Unbalanced',
                        bettingCorrelation: '98%',
                        playingEfficency: '56%',
                        insuranceCorrelation: '78%',
                        indexes: const ['0/1',1,1,1,1,1,0,0,-1,-1],
                        systemInfo: 'The only difference between Kiss III and KISS II, is that version 3 requires you to keep track of sevens and aces. It is still a straightforward system and has higher betting efficiency at the expense of lower insurance correlations and deviation efficiency. Keep your goals and playing style in mind when choosing a counting method. KISS III is an effective system for beating shoe games and no conversion to True Count is required with any KISS system.'
                    );
                  },
                );
              }),),
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
            }),
            trailing: IconButton(
              icon: const Icon(Icons.info_outline),
              color: Colors.lightBlue[400],
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return CountInfoPopupWidget(
                        infoTitle: 'Canfield Expert',
                        easeOfUse: '6',
                        systemLevel: '1',
                        // playerAdvantage: '%',
                        systemType: 'Balanced',
                        bettingCorrelation: '87%',
                        playingEfficency: '63%',
                        insuranceCorrelation: '76%',
                        indexes: const [0,1,1,1,1,1,0,-1,-1,0],
                        systemInfo: 'This simple counting system was created for single-deck games by former pit boss Robert Canfield. It was initially published in his book "Blackjack, Your Way to Riches" in 1977. Canfield Expert is easier than Canfield Master and Hi-Opt I is only slightly more effective.'
                    );
                  },
                );
              }),),
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
            }),
            trailing: IconButton(
              icon: const Icon(Icons.info_outline),
              color: Colors.lightBlue[400],
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return CountInfoPopupWidget(
                        infoTitle: 'Canfield Master',
                        easeOfUse: '4',
                        systemLevel: '???',
                        // playerAdvantage: '%',
                        systemType: 'Balanced',
                        bettingCorrelation: '92%',
                        playingEfficency: '67%',
                        insuranceCorrelation: '85%',
                        indexes: const [1,1,2,2,2,1,0,-1,-2,0],
                        systemInfo: 'Canfield Master is significantly more challenging than Canfield Expert, and variations of this system can include side counts.  It was the precursor to Omega II and designed for single-deck games, which has caused this system to fall out of favor.'
                    );
                  },
                );
              }),),
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
            }),
            trailing: IconButton(
              icon: const Icon(Icons.info_outline),
              color: Colors.lightBlue[400],
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return CountInfoPopupWidget(
                        infoTitle: 'Mentor',
                        easeOfUse: '4',
                        systemLevel: '???',
                        // playerAdvantage: '%',
                        systemType: 'Balanced',
                        bettingCorrelation: '97%',
                        playingEfficency: '62%',
                        insuranceCorrelation: '80%',
                        indexes: const [1,2,2,2,2,1,0,-1,-2,-1],
                        systemInfo: 'The Mentor system was created for shoe games but is also effective on single-deck games. It shines in 4 deck games, though.  It requires an unusual conversion to True Count by dividing the running count by the number of double decks remaining. It is similar to Zen and created by Fred Renzey, published in his 2003 book "Blackjack Bluebook II."'
                    );
                  },
                );
              }),),
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
            }),
            trailing: IconButton(
              icon: const Icon(Icons.info_outline),
              color: Colors.lightBlue[400],
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return CountInfoPopupWidget(
                        infoTitle: 'REKO',
                        easeOfUse: '8',
                        systemLevel: '1',
                        // playerAdvantage: '%',
                        systemType: 'Unbalanced',
                        bettingCorrelation: '98%',
                        playingEfficency: '55%',
                        insuranceCorrelation: '78%',
                        indexes: const [1,1,1,1,1,1,0,0,-1,-1],
                        systemInfo: 'REKO was devised by Norm Wattenberger, author and creator of Casino Verite - an essential software program for any serious counter. It is a simplified version of K-O with the same betting correlation, but the advantage here is all deviation plays only have one index value, +2. Because the initial count depends on the number of decks, betting spreads are different in this system. Norm suggests you begin raising your bets at a running count of -3.'
                    );
                  },
                );
              }),),
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
            }),
            trailing: IconButton(
              icon: const Icon(Icons.info_outline),
              color: Colors.lightBlue[400],
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return CountInfoPopupWidget(
                        infoTitle: 'Silver Fox',
                        easeOfUse: '6',
                        systemLevel: '1',
                        // playerAdvantage: '%',
                        systemType: 'Balanced',
                        bettingCorrelation: '96%',
                        playingEfficency: '53%',
                        insuranceCorrelation: '69%',
                        indexes: const [1,1,1,1,1,1,0,-1,-1,-1],
                        systemInfo: 'Silver Fox is an easy-to-use system created by Ralph Stricker. The pit bosses knew him in Atlantic City as "Fox." As his hair greyed, this system got its name. Silver Fox has high effectiveness on betting correlation. Stricker had a reputation as a gentleman who helped other players and published his strategy in the book "The Silver Fox Blackjack System: you can count on it," 1997.'
                    );
                  },
                );
              }),),
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
            }),
            trailing: IconButton(
              icon: const Icon(Icons.info_outline),
              color: Colors.lightBlue[400],
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return CountInfoPopupWidget(
                        infoTitle: 'UBZ2',
                        easeOfUse: '6.5',
                        systemLevel: '2',
                        // playerAdvantage: '%',
                        systemType: 'Unbalanced',
                        bettingCorrelation: '97%',
                        playingEfficency: '62%',
                        insuranceCorrelation: '84%',
                        indexes: const [2,2,2,2,2,1,0,0,-2,-1],
                        systemInfo: 'Also known as Unbalanced Zen II, it was optimized for betting and created by George C in 1995, one of the most experienced blackjack players in the world. It is a mixture of RPC and Zen and is equally effective on any number of decks. When KO players want a little more performance, this is an excellent system to use. Note that the initial count adjusts based on the number of decks.'
                    );
                  },
                );
              }),),
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
            }),
            trailing: IconButton(
              icon: const Icon(Icons.info_outline),
              color: Colors.lightBlue[400],
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return CountInfoPopupWidget(
                        infoTitle: 'Revere Advanced Plus Minus',
                        easeOfUse: '6',
                        systemLevel: '?',
                        // playerAdvantage: '%',
                        systemType: 'Balanced',
                        bettingCorrelation: '89%',
                        playingEfficency: '59%',
                        insuranceCorrelation: '76%',
                        indexes: const [1,1,1,1,1,0,0,-1,-1,0],
                        systemInfo: 'The Revere Advanced Plus Minus was one of many systems developed by Lawrence Revere and published in his 1980 book "Playing Blackjack as a Business."  Revere was a dealer but was known to bet against the casinos and count as well. This is the easiest of his systems, but it is most suited for single-deck games, so it is not frequently used anymore.'
                    );
                  },
                );
              }),),
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
            }),
            trailing: IconButton(
              icon: const Icon(Icons.info_outline),
              color: Colors.lightBlue[400],
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return CountInfoPopupWidget(
                        infoTitle: 'Revere Point Count',
                        easeOfUse: '6',
                        systemLevel: '2',
                        // playerAdvantage: '%',
                        systemType: 'Balanced',
                        bettingCorrelation: '100%',
                        playingEfficency: '65%',
                        insuranceCorrelation: '82%',
                        indexes: const [2,3,3,4,3,2,0,-1,-3,-4],
                        systemInfo: 'The Revere Point Count has an outstanding betting correlation and may be considered one of the best counting systems for shoe games, but the proprietary version has some adaptations to the free system to make it so. Lawrence Revere was the pen name of mathematician Griffin K. Owens, who had many aliases, and he co-created this system with computer programmer Julian Braun. Revere\'s book "Playing Blackjack as a Business," has more information about it, so if this system interests you, it\'s worth reading.'
                    );
                  },
                );
              }),),
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
            }),
            trailing: IconButton(
              icon: const Icon(Icons.info_outline),
              color: Colors.lightBlue[400],
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return CountInfoPopupWidget(
                        infoTitle: 'Revere APC',
                        easeOfUse: '1',
                        systemLevel: '?',
                        // playerAdvantage: '%',
                        systemType: 'Balanced',
                        bettingCorrelation: '100%',
                        playingEfficency: '53%',
                        insuranceCorrelation: '71%',
                        indexes: const [2,3,3,4,3,2,0,-1,-3,-4],
                        systemInfo: 'The Revere APC (advanced Point Count) is a highly effective system though it is highly complicated.  It is actually rated as more challenging to use than Wong Halves count. Most professional counters opt for something more simple than this. It was developed in 1971, and many pros used it during this time. If you\'re looking for a system with 100% betting efficiency, this is what you want.'
                    );
                  },
                );
              }),),
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
            }),
            trailing: IconButton(
              icon: const Icon(Icons.info_outline),
              color: Colors.lightBlue[400],
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return CountInfoPopupWidget(
                        infoTitle: 'Revere 14',
                        easeOfUse: '1',
                        systemLevel: '?',
                        // playerAdvantage: '%',
                        systemType: 'Balanced',
                        bettingCorrelation: '92%',
                        playingEfficency: '65%',
                        insuranceCorrelation: '82%',
                        indexes: const [2,2,3,4,2,1,0,-2,-3,-4],
                        systemInfo: 'The Revere 14 is yet another incredibly complicated system to use, created by Lawerence Revere and published in his book "Playing Blackjack as a Business." Most modern-day counters agree however that you don\'t need a perfect system. A "Good Enough" system that can be played perfectly is better than a perfect system that can only be executed with imperfections. This sysyem is not perfect nor is it easy but it does have some advantages over Revere APC.'
                    );
                  },
                );
              }),),
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
            }),
            trailing: IconButton(
              icon: const Icon(Icons.info_outline),
              color: Colors.lightBlue[400],
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return CountInfoPopupWidget(
                        infoTitle: 'Uston Advanced Plus Minus',
                        easeOfUse: '6.5',
                        systemLevel: '?',
                        // playerAdvantage: '%',
                        systemType: 'Balanced',
                        bettingCorrelation: '95%',
                        playingEfficency: '55%',
                        insuranceCorrelation: '76%',
                        indexes: const [0,1,1,1,1,1,0,0,-1,-1],
                        systemInfo: 'The Uston Advanced Plus Minus was created and published by Ken Uston in his 1981 book "Million Dollar Blackjack." It is remarkably similar to Hi-Lo; however, despite this similarity, it is more effective on handheld games than shoe games, so it is no longer widely used.'
                    );
                  },
                );
              }),),
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
            }),
            trailing: IconButton(
              icon: const Icon(Icons.info_outline),
              color: Colors.lightBlue[400],
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return CountInfoPopupWidget(
                        infoTitle: 'Uston APC',
                        easeOfUse: '2.5',
                        systemLevel: '3',
                        // playerAdvantage: '%',
                        systemType: 'Balanced',
                        bettingCorrelation: '91%',
                        playingEfficency: '69%',
                        insuranceCorrelation: '90%',
                        indexes: const [1,2,2,3,2,2,1,-1,-3,0],
                        systemInfo: 'Many players do use the Uston Advanced Point Count, but it is not recommended for most players due to its complexity.  Even Ken Uston himself never played using this system. Its great advantage is it is highly optimized for playing deviation efficiency, so make sure you pick up a copy of "Million Dollar Blackjack" if you wish to learn the nuances of this system. '
                    );
                  },
                );
              }),),
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
            }),
            trailing: IconButton(
              icon: const Icon(Icons.info_outline),
              color: Colors.lightBlue[400],
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return CountInfoPopupWidget(
                        infoTitle: 'Uston SS',
                        easeOfUse: '4.5',
                        systemLevel: '?',
                        // playerAdvantage: '%',
                        systemType: 'Unbalanced',
                        bettingCorrelation: '99%',
                        playingEfficency: '54%',
                        insuranceCorrelation: '73%',
                        indexes: const [2,2,2,3,2,1,0,-1,-2,-2],
                        systemInfo: 'Uston SS, or "Strongest and Simplest," isnt exactly as simple as the name implies.  This is a complex system that has been optimized for high betting efficiency.   Ken Uston jointly created it with Arnold Snyder and Sam Case. More details can be found in their 1986 book titled "The Uston SS Count." Since it is unbalanced, you start the running count off with the decks in play multiplied by -2.  No conversion to True Count is required.'
                    );
                  },
                );
              }),),
      ],
    ))));
  }
}
