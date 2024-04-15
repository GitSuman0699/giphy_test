import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:giphy_test/presentation/screens/stickers/sticker_list_screen.dart';
import 'package:giphy_test/presentation/screens/stickers/stickers_tab_controller.dart';

class StickersTab extends ConsumerWidget {
  const StickersTab({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const StrickerListScreen(
        // data: data,
        );
  }
}
