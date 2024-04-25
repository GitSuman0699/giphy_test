import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:giphy_test/presentation/screens/emoji/emoji_tab.dart';
import 'package:giphy_test/presentation/screens/stickers/stickers_tab.dart';
import 'package:giphy_test/presentation/screens/text/text_tab.dart';
import 'package:giphy_test/presentation/screens/trending/trending_list_screen.dart';
import 'package:giphy_test/presentation/screens/trending/trending_tab.dart';
import 'package:giphy_test/presentation/screens/trending/trending_tab_controller.dart';
import 'package:giphy_test/utils/colors.dart';

class SearchScreen extends ConsumerStatefulWidget {
  final List<String> trendingSearchTerms;
  const SearchScreen({
    super.key,
    required this.trendingSearchTerms,
  });

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SearchScreenState();
}

class _SearchScreenState extends ConsumerState<SearchScreen>
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
    return Scaffold(
      body: NestedScrollView(
        floatHeaderSlivers: true,
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return [
            SliverAppBar(
              pinned: true,
              floating: true,
              snap: true,
              title: TextField(
                controller: textController,
                autofocus: true,
                textInputAction: TextInputAction.search,
                decoration: InputDecoration(
                  suffixIcon: IconButton(
                    onPressed: () {
                      if (textController.text.isNotEmpty) {
                        textController.clear();
                      } else {
                        setState(() {
                          tapOnSearch = !tapOnSearch;
                        });
                      }
                    },
                    icon: const Icon(Icons.close),
                  ),
                  border: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  errorBorder: InputBorder.none,
                  disabledBorder: InputBorder.none,
                  hintText: "Search",
                ),
              ),
              actions: [
                IconButton(
                  onPressed: () {
                    setState(() {
                      tapOnSearch = !tapOnSearch;
                    });
                  },
                  icon: const Icon(
                    Icons.search,
                  ),
                ),
              ],
              // bottom: TabBar(
              //   indicatorPadding: const EdgeInsets.fromLTRB(-16, 8, -16, 8),
              //   controller: _tabController,
              //   tabs: const [
              //     Tab(
              //       text: "Trending",
              //     ),
              //     Tab(
              //       text: "Stickers",
              //     ),
              //     Tab(
              //       text: "Emoji",
              //     ),
              //     Tab(
              //       text: "Text",
              //     ),
              //   ],
              // ),
            ),
          ];
        },
        // controller: controller,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 8,
            ),
            Expanded(
              flex: 1,
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: widget.trendingSearchTerms.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                          color: Colors.grey[700]),
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Row(
                            children: [
                              const Icon(
                                Icons.trending_up,
                                color: COLOR_PRIMARY_DARK,
                              ),
                              const SizedBox(
                                width: 8,
                              ),
                              Text(
                                widget.trendingSearchTerms[index],
                                style: const TextStyle(color: Colors.white),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            // const Padding(
            //   padding: EdgeInsets.only(left: 8.0),
            //   child: Text(
            //     "Popular Now",
            //     style: TextStyle(color: Colors.white),
            //   ),
            // ),
            const Expanded(flex: 14, child: TrendingListScreen()),
          ],
        ),
        // TabBarView(controller: _tabController, children: const [
        //   TrendingTab(),
        //   StickersTab(),
        //   EmojiTab(),
        //   TextTab(),
        // ]),
        // slivers: [

        //   CustomGiphyList(data: widget.data),
        //   const GiphyListLoader(),
        //   const SliverToBoxAdapter(child: SizedBox(height: 10))
        // ],
      ),
    );
  }
}
