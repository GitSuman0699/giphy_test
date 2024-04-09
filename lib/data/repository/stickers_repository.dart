import 'package:giphy_test/data/model/giphy_model.dart';
import 'giphy_repository.dart';

class StickersRepository {
  StickersRepository._();
  static final instance = StickersRepository._();

  Future<GiphyModel?> getTrendingStickersData({
    required int limit,
    required int offset,
  }) async {
    final response = await client.get(
        "https://api.giphy.com/v1/stickers/trending?api_key=lYljO9Mkq6SIxT7nCzpNraCVL9LFWJy9&limit=$limit&offset=$offset&rating=g&bundle=messaging_non_clips");

    if (response.statusCode == 200) {
      return GiphyModel.fromJson(response.data);
    }
    return null;
  }
}
