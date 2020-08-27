import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_explore/src/providers/onepiece_provider.dart';

class OPScreen extends HookWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('One Piece Chapter'),
      ),
      body: Consumer((context, watch) {
        final onePieceChapters = watch(onePieceChaptersProvider);
        return onePieceChapters.when(
          data: (onePieceChapters) => Center(
            child: Container(
              child: Text('NIH: ${onePieceChapters.items.length}'),
            ),
          ),
          loading: () => Center(child: CircularProgressIndicator()),
          error: (err, stack) => Container(),
        );
      }),
    );
  }
}
