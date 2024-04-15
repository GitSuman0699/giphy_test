import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:giphy_test/presentation/screens/text/text_list_screen.dart';

class TextTab extends ConsumerWidget {
  const TextTab({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const TextListScreen(
        // data: data,
        );
  }
}
