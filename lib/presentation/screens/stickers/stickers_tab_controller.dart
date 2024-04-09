import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:giphy_test/data/model/giphy_model.dart';
import 'package:giphy_test/data/repository/stickers_repository.dart';

final trendingStickersProvider = StateNotifierProvider.autoDispose<
    TrendingStickersNotifier, AsyncValue<List<Data>>>((ref) {
  return TrendingStickersNotifier();
});

class TrendingStickersNotifier extends StateNotifier<AsyncValue<List<Data>>> {
  TrendingStickersNotifier() : super(const AsyncValue.loading()) {
    getStickers();
  }

  List<Data> giphyList = [];

  int limit = 50;
  int offset = 0;
  static int currentPage = 1;
  static int totalPage = 0;

  void getStickers() async {
    try {
      offset = (currentPage - 1) * limit;

      final getGiphy =
          await StickersRepository.instance.getTrendingStickersData(
        limit: limit,
        offset: offset,
      );

      giphyList.addAll(getGiphy!.data!);

      // currentPage++;

      totalPage = (getGiphy.pagination!.totalCount! / limit).ceil();

      if (mounted) {
        state = AsyncValue<List<Data>>.data(giphyList);
      }
    } catch (e) {
      rethrow;
    }
  }
}
