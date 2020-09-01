import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_explore/src/models/chapter.dart';
import 'package:riverpod_explore/src/models/chapters.dart';
import 'package:riverpod_explore/src/network/api_manager.dart';

final onePieceChaptersProvider = FutureProvider<Chapters>((ref) async {
  return ApiManager.getAllChapters();
});

final onePieceChapterDetailProvider =
    FutureProvider.family.autoDispose<Chapter, String>((ref, chapter) async {
  final chapterData = await ApiManager.getChapter(chapter: int.parse(chapter));
  return chapterData;
});
