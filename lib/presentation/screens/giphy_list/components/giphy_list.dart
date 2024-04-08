import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:giphy_test/data/model/giphy_model.dart';

class CustomGiphyList extends StatelessWidget {
  const CustomGiphyList({
    super.key,
    required this.data,
  });

  final List<Data> data;

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: MasonryGridView.count(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            crossAxisCount: 2,
            mainAxisSpacing: 8,
            crossAxisSpacing: 8,
            itemCount: data.length,
            itemBuilder: (context, index) {
              return SizedBox(
                height: double.parse(data[index].images!.fixedWidth!.height!),
                child: CachedNetworkImage(
                  imageUrl: data[index].images!.fixedHeight!.url!,
                  fit: BoxFit.fill,
                  progressIndicatorBuilder: (context, url, progress) =>
                      const Center(
                    child: CircularProgressIndicator(),
                  ),
                ),
              );
            },
          )
          // GridView.builder(
          //   physics: const NeverScrollableScrollPhysics(),
          //   shrinkWrap: true,
          //   gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          //     crossAxisCount: 2, // number of items in each row
          //     mainAxisSpacing: 8.0, // spacing between rows
          //     crossAxisSpacing: 8.0, // spacing between columns
          //   ),
          //   itemCount: data.length,
          //   itemBuilder: (context, index) {
          //     return SizedBox(
          //       height: 80,
          //       width: 80,
          //       child: Image.network(
          //         data[index].images!.fixedHeight!.url!,
          //         fit: BoxFit.fill,
          //       ),
          //     );
          //   },
          // ),
          ),
    );
  }
}
