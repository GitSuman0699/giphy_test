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

  static List<Data> stickerList = [];

  int limit = 50;
  int offset = 0;
  static int currentPage = 1;
  static int totalPage = 0;

  @override
  void dispose() {
    stickerList.clear();
    currentPage = 1;
    totalPage = 0;
    offset = 0;
    super.dispose();
  }

  void getStickers() async {
    try {
      offset = (currentPage - 1) * limit;

      final getStickers =
          await StickersRepository.instance.getTrendingStickersData(
        limit: limit,
        offset: offset,
      );

      stickerList.addAll(getStickers!.data!);

      currentPage++;

      totalPage = (getStickers.pagination!.totalCount! / limit).ceil();

      if (mounted) {
        state = AsyncValue<List<Data>>.data(stickerList);
      }
    } catch (e) {
      rethrow;
    }
  }
}
