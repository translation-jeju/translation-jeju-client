import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:translation/data/repository/MyWordRepository.dart';

final cardsProvider = FutureProvider<List<Map<String, String>>>((ref) async {
  return ref.watch(bookmarkProvider).getBookmark();
});
