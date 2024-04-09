import 'package:giphy_test/data/model/emoji_model.dart';
import 'package:giphy_test/data/repository/giphy_repository.dart';

class EmojiRepository {
  EmojiRepository._();
  static final instance = EmojiRepository._();

  Future<EmojiModel?> getTrendingEmojis({
    required int limit,
    required int offset,
  }) async {
    final response = await client.get(
        "https://api.giphy.com/v2/emoji?api_key=lYljO9Mkq6SIxT7nCzpNraCVL9LFWJy9&limit=$limit&offset=$offset");

    if (response.statusCode == 200) {
      return EmojiModel.fromJson(response.data);
    }
    return null;
  }
}
