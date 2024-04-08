import 'package:flutter/material.dart';
import 'package:giphy_test/utils/theme/theme.dart';

class TabBarWidget extends SliverPersistentHeaderDelegate {
  const TabBarWidget({
    required TabController tabController,
  }) : _tabController = tabController;

  final TabController _tabController;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Card(
      elevation: 1,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(0)),
      ),
      margin: const EdgeInsets.all(0),
      color: kDarkBgColor,
      child: TabBar(
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
      ),
    );
  }

  @override
  double get maxExtent => 50;

  @override
  double get minExtent => 50;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) => true;
}
