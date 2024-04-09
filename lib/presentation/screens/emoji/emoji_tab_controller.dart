import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:giphy_test/data/model/emoji_model.dart';
import 'package:giphy_test/data/repository/emoji_repository.dart';

final trendingEmojiProvider = StateNotifierProvider.autoDispose<
    TrendingEmojiNotifier, AsyncValue<List<Data>>>((ref) {
  return TrendingEmojiNotifier();
});

class TrendingEmojiNotifier extends StateNotifier<AsyncValue<List<Data>>> {
  TrendingEmojiNotifier() : super(const AsyncValue.loading()) {
    getEmoji();
  }

  List<Data> emojiList = [];

  int limit = 52;
  int offset = 0;
  static int currentPage = 1;
  static int totalPage = 0;

  void getEmoji() async {
    try {
      offset = (currentPage - 1) * limit;

      final getGiphy = await EmojiRepository.instance.getTrendingEmojis(
        limit: limit,
        offset: offset,
      );

      emojiList.addAll(getGiphy!.data!);

      // currentPage++;

      // totalPage = (getGiphy.pagination!.totalCount! / limit).ceil();

      if (mounted) {
        state = AsyncValue<List<Data>>.data(emojiList);
      }
    } catch (e) {
      rethrow;
    }
  }
}
