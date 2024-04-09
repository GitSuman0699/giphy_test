import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:giphy_test/presentation/screens/emoji/emoji_list_screen.dart';
import 'package:giphy_test/presentation/screens/emoji/emoji_tab_controller.dart';

class EmojiTab extends ConsumerStatefulWidget {
  const EmojiTab({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _EmojiTabState();
}

class _EmojiTabState extends ConsumerState<EmojiTab> {
  @override
  Widget build(BuildContext context) {
    final trendingData = ref.watch(trendingEmojiProvider);
    return trendingData.when(
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (error, stackTrace) => ErrorWidget(error),
      data: (data) {
        return EmojiListScreen(
          data: data,
        );
      },
    );
  }
}
