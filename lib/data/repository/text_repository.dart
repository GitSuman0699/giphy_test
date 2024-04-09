import 'package:giphy_test/data/model/giphy_model.dart';
import 'package:giphy_test/data/repository/giphy_repository.dart';

class TextRepository {
  TextRepository._();
  static final instance = TextRepository._();

  Future<GiphyModel?> getTrendingTextData({
    required int limit,
    required int offset,
  }) async {
    final response = await client.get(
        "https://api.giphy.com/v1/text/trending?api_key=lYljO9Mkq6SIxT7nCzpNraCVL9LFWJy9&limit=$limit&offset=$offset&rating=g&bundle=messaging_non_clips");
    if (response.statusCode == 200) {
      return GiphyModel.fromJson(response.data);
    }
    return null;
  }
}
