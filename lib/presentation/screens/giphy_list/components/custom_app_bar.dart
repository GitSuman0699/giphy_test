import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:giphy_test/presentation/screens/emoji/emoji_tab.dart';
import 'package:giphy_test/presentation/screens/search/search_screen.dart';
import 'package:giphy_test/presentation/screens/stickers/stickers_tab.dart';
import 'package:giphy_test/presentation/screens/text/text_tab.dart';
import 'package:giphy_test/presentation/screens/trending/trending_tab.dart';
import 'package:giphy_test/presentation/screens/trending/trending_tab_controller.dart';

class CustomAppBar extends ConsumerStatefulWidget {
  const CustomAppBar({
    super.key,
  });

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _CustomAppBarState();
}

class _CustomAppBarState extends ConsumerState<CustomAppBar>
    with TickerProviderStateMixin {
  late TabController _tabController;
  TextEditingController textController = TextEditingController();
  bool tapOnSearch = false;

  final ScrollController controller = ScrollController();

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
    controller.addListener(() {
      if (controller.position.pixels == controller.position.maxScrollExtent) {
        if (TrendingGifNotifier.currentPage <= TrendingGifNotifier.totalPage) {
          ref.watch(trendingGifsProvider.notifier).getTrendingGifs();
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
  Widget build(BuildContext context) {
    return NestedScrollView(
      floatHeaderSlivers: true,
      headerSliverBuilder: (context, innerBoxIsScrolled) {
        return [
          SliverAppBar(
              pinned: true,
              floating: true,
              snap: true,
              title:
                  // !tapOnSearch
                  //     ?
                  const Text("Meeemes"),
              // : TextField(
              //     controller: textController,
              //     autofocus: true,
              //     textInputAction: TextInputAction.search,
              //     decoration: InputDecoration(
              //       suffixIcon: IconButton(
              //         onPressed: () {
              //           if (textController.text.isNotEmpty) {
              //             textController.clear();
              //           } else {
              //             setState(() {
              //               tapOnSearch = !tapOnSearch;
              //             });
              //           }
              //         },
              //         icon: const Icon(Icons.close),
              //       ),
              //       border: InputBorder.none,
              //       focusedBorder: InputBorder.none,
              //       enabledBorder: InputBorder.none,
              //       errorBorder: InputBorder.none,
              //       disabledBorder: InputBorder.none,
              //       hintText: "Search",
              //     ),
              //   ),
              actions: [
                IconButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const SearchScreen(),
                        ));
                  },
                  icon: const Icon(
                    Icons.search,
                  ),
                ),
              ],
              bottom: TabBar(
                indicatorPadding: const EdgeInsets.fromLTRB(-16, 8, -16, 8),
                controller: _tabController,
                tabs: const [
                  Tab(
                    text: "Trending",
                  ),
                  Tab(
                    text: "Stickers",
                  ),
                  Tab(
                    text: "Emoji",
                  ),
                  Tab(
                    text: "Text",
                  ),
                ],
              )),
        ];
      },
      // controller: controller,
      body: TabBarView(controller: _tabController, children: const [
        TrendingTab(),
        StickersTab(),
        EmojiTab(),
        TextTab(),
      ]),
      // slivers: [

      //   CustomGiphyList(data: widget.data),
      //   const GiphyListLoader(),
      //   const SliverToBoxAdapter(child: SizedBox(height: 10))
      // ],
    );
  }
}
