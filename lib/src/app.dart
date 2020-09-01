import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:riverpod_explore/src/screen/home_screen.dart';
import 'package:riverpod_explore/src/screen/op_screen_detail.dart';

class App extends HookWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(),
      onGenerateRoute: (settings) {
        if (settings?.name == null) {
          return null;
        }
        final split = settings.name.split('/');
        Widget result;
        if (settings.name.startsWith('/chapters/') && split.length == 3) {
          result = ProviderScope(
            overrides: [
              selectedChapterId.overrideWithValue(split.last),
            ],
            child: const OPScreenDetail(),
          );
        }

        if (result == null) {
          return null;
        }
        return MaterialPageRoute<void>(builder: (context) => result);
      },
      routes: {
        '/chapter': (c) => const OPScreenDetail(),
      },
    );
  }
}
