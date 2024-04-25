import 'package:giphy_test/data/model/trending_search_terms_model.dart';

import 'giphy_repository.dart';

class SearchRepository {
  SearchRepository._();
  static final instance = SearchRepository._();

  Future<TrendingSearchTermsModel?> getTrendingSearchTerms() async {
    final response = await client.get(
        "https://api.giphy.com/v1/trending/searches?api_key=lYljO9Mkq6SIxT7nCzpNraCVL9LFWJy9");

    if (response.statusCode == 200) {
      return TrendingSearchTermsModel.fromJson(response.data);
    }
    return null;
  }
}
