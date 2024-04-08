import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:giphy_test/data/model/giphy_model.dart';
import 'package:giphy_test/presentation/screens/giphy_list/components/giphy_list.dart';
import 'package:giphy_test/presentation/screens/giphy_list/components/giphy_list_loader.dart';

class CustomList extends StatelessWidget {
  const CustomList({
    super.key,
    required this.controller,
    required this.data,
  });

  final ScrollController controller;
  final List<Data> data;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      controller: controller,
      slivers: [
        CustomGiphyList(data: data),
        const GiphyListLoader(),
        const SliverToBoxAdapter(child: SizedBox(height: 10))
      ],
    );
  }
}
