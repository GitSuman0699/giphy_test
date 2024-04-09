import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:giphy_test/presentation/screens/giphy_list/components/custom_app_bar.dart';
import 'package:giphy_test/presentation/screens/root_screen/components/custom_elevated_button.dart';
import 'package:giphy_test/presentation/screens/root_screen/components/custom_text_feild.dart';
import 'package:giphy_test/utils/theme/theme.dart';

import '../giphy_list/giphy_list_screen.dart';

String API_Key =
    "https://api.giphy.com/v1/text/search?api_key=lYljO9Mkq6SIxT7nCzpNraCVL9LFWJy9&q=trending";

class RootScreen extends ConsumerStatefulWidget {
  const RootScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _RootScreenState();
}

class _RootScreenState extends ConsumerState<RootScreen> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (MediaQuery.of(context).viewInsets.bottom != 0) {
          FocusManager.instance.primaryFocus?.unfocus();
        }
      },
      child: const SafeArea(
        child: Scaffold(
          drawer: Drawer(),
          body: CustomAppBar(),
        ),
      ),
    );
  }
}
