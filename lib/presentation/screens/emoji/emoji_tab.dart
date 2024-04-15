import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:giphy_test/presentation/screens/emoji/emoji_list_screen.dart';
import 'package:giphy_test/presentation/screens/emoji/emoji_tab_controller.dart';

class EmojiTab extends ConsumerWidget {
  const EmojiTab({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const EmojiListScreen(
        // data: data,
        );
  }
}
