import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
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
        if (GiphyNotifier.currentPage <= GiphyNotifier.totalPage) {
          ref.watch(giphyProvider(widget.searchKeyword).notifier).getGifs();
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text("No more data"),
            ),
          );
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
    return giphyData.when(
      loading: () => const Center(
        child: CircularProgressIndicator(),
      ),
      error: (error, stackTrace) => ErrorWidget(error),
      data: (data) => CustomList(
        controller: controller,
        data: data,
      ),
    );
  }
}
