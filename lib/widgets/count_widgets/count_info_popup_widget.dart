import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CountInfoPopupWidget extends StatefulWidget {
  String infoTitle = '';
  String easeOfUse = '';
  String systemType = '';
  String bettingCorrelation = '';
  String playingEfficency = '';
  String insuranceCorrelation = '';
  List cards = ['2', '3', '4', '5', '6', '7', '8', '9', '10', 'A'];
  List indexes = [];
  String systemInfo = '';

  CountInfoPopupWidget({
    Key? key,
    required this.infoTitle,
    required this.easeOfUse,
    required this.systemType,
    required this.bettingCorrelation,
    required this.playingEfficency,
    required this.insuranceCorrelation,
    required this.indexes,
    required this.systemInfo,
  }) : super(key: key);

  @override
  _CountInfoPopupWidgetState createState() => _CountInfoPopupWidgetState();
}

class _CountInfoPopupWidgetState extends State<CountInfoPopupWidget> {
  bool isShowingHelp = false;

  @override
  Widget build(BuildContext context) {
    return
        // SingleChildScrollView(
        //   child:
        Dialog(
            backgroundColor: Colors.transparent,
            insetPadding: const EdgeInsets.all(10),
            child: Container(
                width: double.infinity,
                padding: const EdgeInsets.fromLTRB(25, 10, 25, 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.lightBlue,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      widget.infoTitle,
                      style: TextStyle(fontSize: 24, color: Colors.white),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 5),
                    Text(
                      'Ease of Use:  ${widget.easeOfUse}/10',
                      style: const TextStyle(fontSize: 16, color: Colors.white),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 15),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Column(
                          children: const [
                            Text(
                              'Card Value:',
                              style:
                                  TextStyle(fontSize: 13, color: Colors.white),
                            ),
                            Text(
                              'Index Value:',
                              style:
                                  TextStyle(fontSize: 13, color: Colors.white),
                            )
                          ],
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Column(
                          children: [
                            Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: widget.cards
                                    .map<Widget>((card) => Container(
                                        decoration: const BoxDecoration(
                                          border: Border(
                                            bottom: BorderSide(
                                                width: 1.0,
                                                color: Colors.black),
                                          ),
                                          color: Colors.white,
                                        ),
                                        width: 20,
                                        padding: const EdgeInsets.fromLTRB(
                                            1, 0, 1, 0),
                                        child: Text(
                                          card,
                                          textAlign: TextAlign.center,
                                        )))
                                    .toList()),
                            Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: widget.indexes
                                    .map<Widget>((index) => Container(
                                        decoration: const BoxDecoration(
                                          border: Border(
                                            bottom: BorderSide(
                                                width: 1.0,
                                                color: Colors.black),
                                          ),
                                          color: Colors.white,
                                        ),
                                        width: 20,
                                        padding: const EdgeInsets.fromLTRB(
                                            1, 0, 1, 0),
                                        child: Text(
                                          index.toString(),
                                          textAlign: TextAlign.center,
                                        )))
                                    .toList()),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    const Divider(
                      color: Colors.white,
                      thickness: 1,
                    ),
                    const SizedBox(height: 10),
                    Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Type:  ${widget.systemType}',
                              style: const TextStyle(
                                  fontSize: 13, color: Colors.white),
                              textAlign: TextAlign.center,
                            ),
                            Text(
                              'Betting Correlation:  ${widget.bettingCorrelation}',
                              style: const TextStyle(
                                  fontSize: 13, color: Colors.white),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Playing Efficency:  ${widget.playingEfficency}',
                              style: const TextStyle(
                                  fontSize: 13, color: Colors.white),
                              textAlign: TextAlign.center,
                            ),
                            Text(
                              'Insurance Correlation:  ${widget.insuranceCorrelation}',
                              style: const TextStyle(
                                  fontSize: 13, color: Colors.white),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            if (!isShowingHelp)
                              IconButton(
                                  padding: EdgeInsets.zero,
                                  constraints: BoxConstraints(),
                                  icon: Icon(Icons.help_outline, size: 18.0),
                                  color: Colors.white,
                                  onPressed: () {
                                    setState(() {
                                      isShowingHelp = true;
                                    });
                                  }),
                            if (isShowingHelp) const SizedBox(height: 15),
                            // if(isShowingHelp) IconButton(
                            //   padding: EdgeInsets.zero,
                            //   constraints: BoxConstraints(),
                            //   icon: Icon(Icons.arrow_drop_up, size: 22.0),
                            //   color: Colors.white,
                            //   onPressed: () {
                            //     setState(() {
                            //       isShowingHelp = false;
                            //     });
                            //   }),
                          ],
                        ),
                      ],
                    ),
                    if (isShowingHelp)
                      Column(children: [
                        const SizedBox(height: 5),
                        if (widget.systemType == 'Balanced')
                          Row(
                            children: const [
                              Text(
                                'Balanced: ',
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(width: 16),
                              Flexible(
                                child: Text(
                                  'Requires conversion of running count to true count',
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.white,
                                  ),
                                ),
                              )
                            ],
                          ),
                        if (widget.systemType == 'Unbalanced')
                          Row(
                            children: const [
                              Text(
                                'Unbalanced: ',
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(width: 1),
                              Flexible(
                                child: Text(
                                  'Running count is unbalaced and therefore requires no conversion to a true count',
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.white,
                                  ),
                                ),
                              )
                            ],
                          ),
                        const SizedBox(height: 5),
                        Row(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: const [
                                Text(
                                  'Playing',
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  'Efficency:',
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(width: 18),
                            const Flexible(
                              child: Text(
                                'How well a system handles changes (deviations) to playing strategy. Important in handheld games.',
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.white,
                                ),
                              ),
                            )
                          ],
                        ),
                        const SizedBox(height: 5),
                        Row(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: const [
                                Text(
                                  'Betting',
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  'Correlation:',
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(width: 7),
                            const Flexible(
                              child: Text(
                                'How well a system accounts for removed cards and predicts raising bets. Important in shoe games.',
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.white,
                                ),
                              ),
                            )
                          ],
                        ),
                        const SizedBox(height: 5),
                        Row(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: const [
                                Text(
                                  'Insurance',
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  'Correlation:',
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(width: 7),
                            const Flexible(
                              child: Text(
                                'How effective a system is at predicting when to buy insurance',
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.white,
                                ),
                              ),
                            )
                          ],
                        ),
                        const SizedBox(height: 10),
                      ]),
                    const Divider(
                      color: Colors.white,
                      thickness: 1,
                    ),
                    const SizedBox(height: 5),

                    SizedBox( //* Scrollable Text Inset
                      height: 250,
                      child: Column(
                        children: [
                          Expanded(
                            flex: 1,
                            child: 
                            SingleChildScrollView(
                              scrollDirection: Axis.vertical,
                              child: Text(
                                  widget.systemInfo,
                                  style: const TextStyle(
                                    fontSize: 16,
                                    color: Colors.white,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                )));
    // );
  }
}
