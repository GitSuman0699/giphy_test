import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:giphy_test/data/model/giphy_model.dart';
import 'package:giphy_test/data/repository/giphy_repository.dart';
import 'package:giphy_test/data/repository/text_repository.dart';

final trendingTextProvider = StateNotifierProvider.autoDispose<
    TrendingTextNotifier, AsyncValue<List<Data>>>((ref) {
  return TrendingTextNotifier();
});

class TrendingTextNotifier extends StateNotifier<AsyncValue<List<Data>>> {
  TrendingTextNotifier() : super(const AsyncValue.loading()) {
    getTrendingText();
  }

  List<Data> textList = [];

  int limit = 50;
  int offset = 0;
  static int currentPage = 1;
  static int totalPage = 0;

  void getTrendingText() async {
    try {
      offset = (currentPage - 1) * limit;

      final getText = await TextRepository.instance.getTrendingTextData(
        limit: limit,
        offset: offset,
      );

      textList.addAll(getText!.data!);

      // currentPage++;

      totalPage = (getText.pagination!.totalCount! / limit).ceil();

      if (mounted) {
        state = AsyncValue<List<Data>>.data(textList);
      }
    } catch (e) {
      rethrow;
    }
  }
}
