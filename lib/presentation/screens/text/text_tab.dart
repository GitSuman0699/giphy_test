import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:giphy_test/presentation/screens/text/text_list_screen.dart';
import 'package:giphy_test/presentation/screens/text/text_tab_controller.dart';

class TextTab extends ConsumerStatefulWidget {
  const TextTab({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _TextTabState();
}

class _TextTabState extends ConsumerState<TextTab> {
  @override
  Widget build(BuildContext context) {
    final trendingData = ref.watch(trendingTextProvider);
    return trendingData.when(
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (error, stackTrace) => ErrorWidget(error),
      data: (data) {
        return TextListScreen(
          data: data,
        );
      },
    );
  }
}
