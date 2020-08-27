import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_explore/src/models/chapters.dart';
import 'package:riverpod_explore/src/network/api_manager.dart';

final onePieceChaptersProvider = FutureProvider<Chapters>((ref) async {
  return ApiManager.getAllChapters();
});
