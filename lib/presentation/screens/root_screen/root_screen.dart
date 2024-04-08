import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
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
  static const platform = MethodChannel("device_battery_level");
  String _batteryLevel = "Unknown";
  TextEditingController textController = TextEditingController();
  bool tapOnSearch = false;

  Future<void> getBatteryLevel() async {
    String batteryLevel;
    try {
      final result = await platform.invokeMethod('getBatteryLevel');
      batteryLevel = "Your Battery Level: $result%";
    } on PlatformException catch (e) {
      batteryLevel = "Error ${e.message}";
    }

    setState(() {
      _batteryLevel = batteryLevel;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (MediaQuery.of(context).viewInsets.bottom != 0) {
          FocusManager.instance.primaryFocus?.unfocus();
        }
      },
      child: SafeArea(
        child: Scaffold(
          drawer: const Drawer(),
          appBar: AppBar(
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
          body: GiphyList(
            searchKeyword:
                textController.text.isNotEmpty ? textController.text : "random",
          ),
        ),
      ),
    );
  }
}
