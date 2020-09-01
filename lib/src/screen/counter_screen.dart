import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_explore/src/providers/counter_provider.dart';
import 'package:riverpod_explore/src/screen/detail_screen.dart';

class CounterScreen extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final counter = useProvider(counterProvider.state);

    return Scaffold(
      appBar: AppBar(
        title: Text('Counter'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('$counter'),
            MaterialButton(
              child: Text('+'),
              color: Colors.green[400],
              onPressed: () {
                context.read(counterProvider).increment();
              },
            ),
            MaterialButton(
              child: Text('-'),
              color: Colors.red[400],
              onPressed: () {
                context.read(counterProvider).decrement();
              },
            ),
            MaterialButton(
              child: Text('Check'),
              color: Colors.blue[300],
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => DetailScreen()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
