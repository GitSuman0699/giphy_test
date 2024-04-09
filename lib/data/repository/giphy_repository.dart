import 'package:dio/dio.dart';
import 'package:giphy_test/data/model/giphy_model.dart';

final client = Dio();

class GiphyRepository {
  GiphyRepository._();
  static final instance = GiphyRepository._();

  Future<GiphyModel?> getGiphyData(
      {required String serchKeyword,
      required int limit,
      required int offset}) async {
    final response = await client.get(
        // "https://api.giphy.com/v1/gifs/search?api_key=lYljO9Mkq6SIxT7nCzpNraCVL9LFWJy9&q=trending");
        "https://api.giphy.com/v1/gifs/search?api_key=lYljO9Mkq6SIxT7nCzpNraCVL9LFWJy9&q=$serchKeyword&limit=$limit&offset=$offset&rating=g");

    if (response.statusCode == 200) {
      return GiphyModel.fromJson(response.data);
    }
    return null;
  }

  Future<GiphyModel?> getTrendingGiphyData({
    required int limit,
    required int offset,
  }) async {
    final response = await client.get(
        "https://api.giphy.com/v1/gifs/trending?api_key=lYljO9Mkq6SIxT7nCzpNraCVL9LFWJy9&limit=$limit&offset=$offset&rating=g&bundle=messaging_non_clips");
    if (response.statusCode == 200) {
      return GiphyModel.fromJson(response.data);
    }
    return null;
  }
}
