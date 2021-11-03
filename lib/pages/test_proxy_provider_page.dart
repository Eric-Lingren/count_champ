
import 'package:count_champ/models/test_proxies/dgreet.dart';
import 'package:count_champ/models/test_proxies/greet.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TestProxyProviderPage extends StatefulWidget {
  const TestProxyProviderPage({Key? key}) : super(key: key);

  @override
  _TestProxyProviderPageState createState() => _TestProxyProviderPageState();
}

class _TestProxyProviderPageState extends State<TestProxyProviderPage> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<Dgreet>(builder: (context, dGreet, child) {
      return Consumer<Greet>(builder: (context, myGreet, child) {
        return  Scaffold(
          body: SafeArea(
            child: Column(
              children: <Widget>[
                Container(
                  child: 
                  ElevatedButton(
                    onPressed: (){
                      myGreet.doGreet('good afternoon');
                    }, 
                    child: Text('Greetings')
                  ),
                ),
                Container(
                  child: Text(myGreet.greetings),
                ),
                Container(
                  child: ElevatedButton(
                    onPressed: (){
                      dGreet.doAnotherGreet();
                    }, 
                  child: Text('Another Greetings Yo')
                  ),
                ),
              ],
        )));
      });
    });
  }
}
