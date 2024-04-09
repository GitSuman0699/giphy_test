import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:giphy_test/presentation/screens/stickers/sticker_list_screen.dart';
import 'package:giphy_test/presentation/screens/stickers/stickers_tab_controller.dart';

class StickersTab extends ConsumerStatefulWidget {
  const StickersTab({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _StickersTabState();
}

class _StickersTabState extends ConsumerState<StickersTab> {
  @override
  Widget build(BuildContext context) {
    final trendingData = ref.watch(trendingStickersProvider);
    return trendingData.when(
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (error, stackTrace) => ErrorWidget(error),
      data: (data) {
        return StrickerListScreen(
          data: data,
        );
      },
    );
  }
}
