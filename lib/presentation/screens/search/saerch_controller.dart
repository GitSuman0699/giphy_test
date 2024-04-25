import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:giphy_test/data/repository/search_repository.dart';

final trendingSearchTermProvider = FutureProvider.autoDispose((ref) async {
  return await SearchRepository.instance.getTrendingSearchTerms();
});
