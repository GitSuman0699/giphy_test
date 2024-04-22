import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:giphy_test/data/model/giphy_model.dart';
import 'package:giphy_test/data/repository/giphy_repository.dart';

final trendingGifsProvider = StateNotifierProvider.autoDispose<
    TrendingGifNotifier, AsyncValue<List<Data>>>((ref) {
  return TrendingGifNotifier();
});

class TrendingGifNotifier extends StateNotifier<AsyncValue<List<Data>>> {
  TrendingGifNotifier() : super(const AsyncValue.loading()) {
    getTrendingGifs();
  }

  static List<Data> giphyList = [];

  int limit = 50;
  int offset = 0;
  static int currentPage = 1;

  static int totalPage = 0;

  @override
  void dispose() {
    giphyList.clear();
    currentPage = 1;
    totalPage = 0;
    offset = 0;
    super.dispose();
  }

  void getTrendingGifs() async {
    try {
      offset = (currentPage - 1) * limit;

      final getGiphy = await GiphyRepository.instance.getTrendingGiphyData(
        limit: limit,
        offset: offset,
      );

      giphyList.addAll(getGiphy!.data!);

      currentPage++;

      totalPage = (getGiphy.pagination!.totalCount! / limit).ceil();

      if (mounted) {
        state = AsyncValue<List<Data>>.data(giphyList);
      }
    } catch (e) {
      rethrow;
    }
  }
}
