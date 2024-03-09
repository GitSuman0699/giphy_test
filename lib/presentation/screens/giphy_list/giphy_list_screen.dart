import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:giphy_test/data/model/giphy_model.dart';

import 'components/custom_list.dart';
import 'giphy_list_controller.dart';

class GiphyList extends ConsumerStatefulWidget {
  final String searchKeyword;
  const GiphyList({
    super.key,
    required this.searchKeyword,
  });

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _GiphyListState();
}

class _GiphyListState extends ConsumerState<GiphyList> {
  final ScrollController controller = ScrollController();

  @override
  void initState() {
    super.initState();
    controller.addListener(() {
      if (controller.position.pixels == controller.position.maxScrollExtent) {
        if (GiphyNotifier.offset <= GiphyNotifier.total) {
          ref.watch(giphyProvider(widget.searchKeyword).notifier).getGifs();
        } else {
          ScaffoldMessenger.of(context)
              .showSnackBar(const SnackBar(content: Text("No more data")));
        }
      }
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final giphyData = ref.watch(giphyProvider(widget.searchKeyword));
    return Scaffold(
      appBar: AppBar(
        title: const Text("GIPHY LIST"),
      ),
      body: giphyData.when(
        loading: () => const Center(
          child: CircularProgressIndicator(),
        ),
        error: (error, stackTrace) => ErrorWidget(error),
        data: (data) => CustomList(
          controller: controller,
          data: data,
        ),
      ),
    );
  }
}
