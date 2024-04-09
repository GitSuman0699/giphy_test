import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:giphy_test/presentation/screens/giphy_list/giphy_list_screen.dart';
import 'package:giphy_test/utils/theme/theme.dart';

class CustomTextFeild extends ConsumerWidget {
  const CustomTextFeild({
    super.key,
    required this.textController,
  });

  final TextEditingController textController;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SizedBox(
      height: 50,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          color: kPrimaryColor,
        ),
        child: Center(
          child: TextField(
            textInputAction: TextInputAction.search,
            controller: textController,
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.only(
                left: 16.0,
                top: 8.0,
                right: 16.0,
                bottom: 8.0,
              ),
              border: InputBorder.none,
              hintText: "Search here",
              focusedBorder: InputBorder.none,
              suffixIcon: IconButton(
                onPressed: () {
                  // Navigator.push(
                  //     context,
                  //     MaterialPageRoute(
                  //       builder: (context) => GiphyList(
                  //         searchKeyword: textController.text,
                  //       ),
                  //     ));
                },
                icon: const Icon(Icons.search),
              ),
            ),
          ),
        ),
      ),
      // Container(
      //   decoration: const BoxDecoration(
      //       shape: BoxShape.circle, color: kPrimaryColor),
      //   child: IconButton(
      //     onPressed: () {},
      //     icon: const Icon(
      //       Icons.search,
      //     ),
      //   ),
      // ),
    );
  }
}
