import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:translation/data/repository/MyWordRepository.dart';

// FutureProvider로 변경
final bookmarkProvider = FutureProvider<List<Map<String, String>>>((ref) async {
  return await getBookmark();
});

// cardsProvider가 bookmarkProvider를 참조하도록 변경
final cardsProvider = FutureProvider<List<Map<String, String>>>((ref) async {
  final bookmarks = await ref.watch(bookmarkProvider.future);
  return bookmarks;
});