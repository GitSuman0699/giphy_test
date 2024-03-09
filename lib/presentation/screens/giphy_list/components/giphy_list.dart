import 'package:flutter/material.dart';
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
        child: GridView.builder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, // number of items in each row
            mainAxisSpacing: 8.0, // spacing between rows
            crossAxisSpacing: 8.0, // spacing between columns
          ),
          itemCount: data.length,
          itemBuilder: (context, index) {
            return SizedBox(
              height: 80,
              width: 80,
              child: Image.network(
                data[index].images!.fixedHeight!.url!,
                fit: BoxFit.fill,
              ),
            );
          },
        ),
      ),
    );
  }
}
