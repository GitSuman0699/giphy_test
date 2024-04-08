import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:giphy_test/data/model/giphy_model.dart';
import 'package:giphy_test/presentation/screens/giphy_list/components/giphy_list.dart';
import 'package:giphy_test/presentation/screens/giphy_list/components/giphy_list_loader.dart';
import 'package:giphy_test/presentation/screens/giphy_list/components/tab_bar.dart';

class CustomList extends ConsumerStatefulWidget {
  const CustomList({
    super.key,
    required this.controller,
    required this.data,
  });

  final ScrollController controller;
  final List<Data> data;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _CustomListState();
}

class _CustomListState extends ConsumerState<CustomList>
    with TickerProviderStateMixin {
  late TabController _tabController;
  TextEditingController textController = TextEditingController();
  bool tapOnSearch = false;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      controller: widget.controller,
      slivers: [
        SliverAppBar(
          title: !tapOnSearch
              ? const Text("Meeemes")
              : TextField(
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
        ),
        SliverPersistentHeader(
          delegate: TabBarWidget(
            tabController: _tabController,
          ),
          pinned: true,
          floating: true,
        ),
        CustomGiphyList(data: widget.data),
        const GiphyListLoader(),
        const SliverToBoxAdapter(child: SizedBox(height: 10))
      ],
    );
  }
}
