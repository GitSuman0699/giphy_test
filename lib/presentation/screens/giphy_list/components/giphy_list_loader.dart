import 'package:flutter/material.dart';
import 'package:giphy_test/presentation/screens/giphy_list/giphy_list_controller.dart';

class GiphyListLoader extends StatelessWidget {
  const GiphyListLoader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: GiphyNotifier.offset <= GiphyNotifier.total
          ? const Padding(
              padding: EdgeInsets.all(8.0),
              child: Center(
                child: CircularProgressIndicator(),
              ),
            )
          : const SizedBox.shrink(),
    );
  }
}
