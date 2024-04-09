import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:giphy_test/presentation/screens/trending/trending_list_screen.dart';
import 'package:giphy_test/presentation/screens/trending/trending_tab_controller.dart';

class TrendingTab extends ConsumerStatefulWidget {
  const TrendingTab({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _TrendingTabState();
}

class _TrendingTabState extends ConsumerState<TrendingTab> {
  @override
  Widget build(BuildContext context) {
    final trendingData = ref.watch(trendingGifsProvider);
    return trendingData.when(
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (error, stackTrace) => ErrorWidget(error),
      data: (data) {
        return TrendingListScreen(
          data: data,
        );
      },
    );
  }
}
