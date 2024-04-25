import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:giphy_test/presentation/screens/giphy_list/components/custom_app_bar.dart';
import 'package:giphy_test/presentation/screens/root_screen/components/custom_elevated_button.dart';
import 'package:giphy_test/presentation/screens/root_screen/components/custom_text_feild.dart';
import 'package:giphy_test/presentation/screens/search/saerch_controller.dart';
import 'package:giphy_test/utils/theme/theme.dart';

import '../giphy_list/giphy_list_screen.dart';

class RootScreen extends ConsumerStatefulWidget {
  const RootScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _RootScreenState();
}

class _RootScreenState extends ConsumerState<RootScreen> {
  @override
  Widget build(BuildContext context) {
    final trendingSearchTerms = ref.watch(trendingSearchTermProvider);
    return trendingSearchTerms.when(
      error: (error, stackTrace) => ErrorWidget(error),
      loading: () => const Center(child: CircularProgressIndicator()),
      data: (data) => GestureDetector(
        onTap: () {
          if (MediaQuery.of(context).viewInsets.bottom != 0) {
            FocusManager.instance.primaryFocus?.unfocus();
          }
        },
        child: SafeArea(
          child: Scaffold(
            body: CustomAppBar(
              trendingSearchTerms: data!.data!,
            ),
          ),
        ),
      ),
    );
  }
}
