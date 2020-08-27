import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:riverpod_explore/src/providers/counter_provider.dart';

class DetailScreen extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final counter = useProvider(counterProvider.state);

    return Scaffold(
      appBar: AppBar(
        title: Text('Detail'),
      ),
      body: Container(
        child: Center(
          child: Text('$counter'),
        ),
      ),
    );
  }
}
