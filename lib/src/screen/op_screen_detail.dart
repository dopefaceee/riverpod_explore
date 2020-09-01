import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:riverpod_explore/src/providers/onepiece_provider.dart';

final selectedChapterId = ScopedProvider<String>(null);

class OPScreenDetail extends HookWidget {
  const OPScreenDetail({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final chapterId = useProvider(selectedChapterId);
    return Scaffold(
      appBar: AppBar(
        title: Text('Chapter $chapterId'),
      ),
      body: useProvider(onePieceChapterDetailProvider(chapterId)).when(
        data: (chapter) => Center(
          child: ListView(
            children: [
              Container(
                padding: EdgeInsets.all(16),
                child: Text(
                  '${chapter.title}',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
              ),
              //inconsistency api images
              // Container(
              //   child: Image.network(
              //       'https://onepiececover.com/${chapter.coverImages}'),
              // ),
              Container(
                padding: EdgeInsets.all(16),
                child: Text(
                  chapter.summary.replaceAll(RegExp(r'<p>|</p>|<b>|</b>'), ''),
                ),
              ),
            ],
          ),
        ),
        loading: () => Center(child: CircularProgressIndicator()),
        error: (err, stack) {
          return Center(
            child: Container(
              child: Text('Error ${err.toString()}'),
            ),
          );
        },
      ),
    );
  }
}
