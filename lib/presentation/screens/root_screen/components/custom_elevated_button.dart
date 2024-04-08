import 'package:flutter/material.dart';
import 'package:giphy_test/presentation/screens/giphy_list/giphy_list_screen.dart';

class CustomElevatedButton extends StatelessWidget {
  const CustomElevatedButton(
      {super.key, required this.getBatteryLevel, required this.textController});

  final Function getBatteryLevel;
  final TextEditingController textController;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: ElevatedButton(
        onPressed: () async {
          await getBatteryLevel();
          if (textController.text.isNotEmpty) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => GiphyList(
                  searchKeyword: textController.text.trim(),
                ),
              ),
            );
          } else {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text("Textfield is empty"),
              ),
            );
          }
        },
        child: const Text("SEARCH"),
      ),
    );
  }
}
