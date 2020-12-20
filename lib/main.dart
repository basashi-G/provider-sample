import 'package:flutter/material.dart';
import 'package:flutter_state_notifier/flutter_state_notifier.dart';
import 'package:provider/provider.dart';
import 'package:provider_sample/state.dart';

void main(List<String> args) {
  runApp(CounterApp());
}

class CounterApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: StateNotifierProvider<AppStateNotifier, AppState>(
        create: (_) => AppStateNotifier(),
        child: MainPage(),
      ),
      theme: ThemeData.dark(),
    );
  }
}

class MainPage extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text("current count"),

            // ラップするWidgetを増やさずにstateを参照できるのはシンプルでGOOD
            Text(context
                .select<AppState, int>((state) => state.countState)
                .toString()),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                RaisedButton(
                  onPressed: context.select<AppStateNotifier, Function>(
                      (notifier) => notifier.up),
                  child: Icon(Icons.plus_one),
                  shape: CircleBorder(),
                ),
                RaisedButton(
                  onPressed: context.select<AppStateNotifier, Function>(
                      (notifier) => notifier.down),
                  child: Icon(Icons.exposure_minus_1),
                  shape: CircleBorder(),
                )
              ],
            ),
          ],
        ),
      ),
      appBar: AppBar(
        title: Text("Advaned Counter"),
      ),
    );
  }
}
