import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:giphy_test/data/model/giphy_model.dart';
import 'package:giphy_test/data/repository/giphy_repository.dart';

final client = Dio();

final giphyProvider = StateNotifierProvider.autoDispose
    .family<GiphyNotifier, AsyncValue<List<Data>>, String>(
        (ref, searchKeyword) {
  return GiphyNotifier(searchKeyword);
});

class GiphyNotifier extends StateNotifier<AsyncValue<List<Data>>> {
  final String searchKeyword;
  GiphyNotifier(this.searchKeyword) : super(const AsyncValue.loading()) {
    getGifs();
  }

  static List<Data> giphyList = [];

  static int limit = 50;
  static int offset = 0;
  static int total = 0;

  void getGifs() async {
    try {
      final getGiphy = await GiphyRepository.instance.getGiphyData(
          serchKeyword: searchKeyword, limit: limit, offset: offset);

      giphyList.addAll(getGiphy!.data!);

      offset = offset + 50;

      total = getGiphy.pagination!.totalCount!;

      state = AsyncValue<List<Data>>.data(giphyList);
    } catch (e) {
      rethrow;
    }
  }
}
