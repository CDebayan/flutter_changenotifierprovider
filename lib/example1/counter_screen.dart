import 'package:flutter/material.dart';
import 'package:flutterchangenotifierprovider/example1/counter_notifier.dart';
import 'package:flutterchangenotifierprovider/widgets.dart';
import 'package:provider/provider.dart';

class CounterScreen extends StatelessWidget {
  static const String routeName = "CounterScreen";
  @override
  Widget build(BuildContext context) {
    final counterNotifier =  Provider.of<CounterNotifier>(context, listen: false);
    return Scaffold(
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
         fab(heroTag:"remove",iconData: Icons.remove, onPressed: (){
           counterNotifier.decrement();
         }),
          SizedBox(width: 16,),
         fab(heroTag:"add",iconData: Icons.remove, onPressed: (){
           counterNotifier.increment();
         })
        ],
      ),
      body: SafeArea(
        child: Center(
          child: Consumer<CounterNotifier>(
            builder: (_, value, child) {
              return Text(value.count.toString());
            },
          ),
        ),
      ),
    );
  }
}
