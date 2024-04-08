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

  List<Data> giphyList = [];

  int limit = 50;
  int offset = 0;
  static int currentPage = 1;
  static int totalPage = 0;

  void getGifs() async {
    try {
      offset = (currentPage - 1) * limit;

      final getGiphy = await GiphyRepository.instance.getGiphyData(
        serchKeyword: searchKeyword,
        limit: limit,
        offset: offset,
      );

      giphyList.addAll(getGiphy!.data!);

      currentPage++;

      totalPage = (getGiphy.pagination!.totalCount! / limit).ceil();

      state = AsyncValue<List<Data>>.data(giphyList);
    } catch (e) {
      rethrow;
    }
  }
}
