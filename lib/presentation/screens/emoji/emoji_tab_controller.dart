import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:giphy_test/data/model/emoji_model.dart';
import 'package:giphy_test/data/repository/emoji_repository.dart';

final trendingEmojiProvider = StateNotifierProvider.autoDispose<
    TrendingEmojiNotifier, AsyncValue<List<Data>>>((ref) {
  return TrendingEmojiNotifier();
});

class TrendingEmojiNotifier extends StateNotifier<AsyncValue<List<Data>>> {
  TrendingEmojiNotifier() : super(const AsyncValue.loading()) {
    getTrendingEmoji();
  }

  static List<Data> emojiList = [];

  static int limit = 52;
  int offset = 0;
  static int currentPage = 1;
  static int count = 0;

  @override
  void dispose() {
    emojiList.clear();
    currentPage = 1;
    count = 0;
    offset = 0;
    super.dispose();
  }

  void getTrendingEmoji() async {
    try {
      offset = (currentPage - 1) * limit;

      final getEmoji = await EmojiRepository.instance.getTrendingEmojis(
        limit: limit,
        offset: offset,
      );

      emojiList.addAll(getEmoji!.data!);

      count = getEmoji.pagination!.count!;

      currentPage++;

      // totalPage = (getGiphy.pagination!.totalCount! / limit).ceil();

      if (mounted) {
        state = AsyncValue<List<Data>>.data(emojiList);
      }
    } catch (e) {
      rethrow;
    }
  }
}
