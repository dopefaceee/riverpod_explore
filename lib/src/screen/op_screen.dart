import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_explore/src/models/chapters.dart';
import 'package:riverpod_explore/src/providers/onepiece_provider.dart';

class OPScreen extends ConsumerWidget {
  @override
  Widget build(BuildContext context, ScopedReader watch) {
    AsyncValue<Chapters> onePieceChapters = watch(onePieceChaptersProvider);
    return Scaffold(
      appBar: AppBar(
        title: Text('One Piece Chapter'),
      ),
      body: onePieceChapters.when(
          data: (onePieceChapters) =>
              Center(child: _listAllChapterWidget(onePieceChapters.items)),
          loading: () => Center(child: CircularProgressIndicator()),
          error: (err, stack) => Container()),
    );
  }

  Widget _listAllChapterWidget(List<Items> chapters) {
    return ListView.builder(
      itemCount: chapters.length,
      itemBuilder: (BuildContext context, int index) {
        return InkWell(
          onTap: () {
            Navigator.pushNamed(context, '/chapters/${chapters[index].id}');
          },
          child: Container(
            child: Card(
              child: ListTile(
                title: Text(chapters[index].title),
                subtitle: Text(chapters[index].chapter),
              ),
            ),
          ),
        );
      },
    );
  }
}
