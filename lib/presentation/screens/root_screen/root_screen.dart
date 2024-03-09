import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:giphy_test/presentation/screens/root_screen/components/custom_elevated_button.dart';
import 'package:giphy_test/presentation/screens/root_screen/components/custom_text_feild.dart';
import 'package:giphy_test/utils/theme/theme.dart';

import '../giphy_list/giphy_list_screen.dart';

String API_Key =
    "https://api.giphy.com/v1/gifs/search?api_key=lYljO9Mkq6SIxT7nCzpNraCVL9LFWJy9&q=";

class RootScreen extends ConsumerStatefulWidget {
  const RootScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _RootScreenState();
}

class _RootScreenState extends ConsumerState<RootScreen> {
  TextEditingController textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (MediaQuery.of(context).viewInsets.bottom != 0) {
          FocusManager.instance.primaryFocus?.unfocus();
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text("SEARCH GIFS"),
          actions: [ThemeToggle(ref: ref)],
        ),
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CustomTextFeild(textController: textController),
              const SizedBox(
                height: 20,
              ),
              CustomElevatedButton(textController: textController)
            ],
          ),
        ),
      ),
    );
  }
}
