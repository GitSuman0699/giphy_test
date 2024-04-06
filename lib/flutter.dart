// Write a Flutter code snippet to handle orientation changes in your app. ie when the device is rotated between portrait and landscape modes.

// Create a Flutter code snippet that displays a snackbar at the bottom of the screen when a button is pressed. The snackbar should show a message and include an action button.

import 'package:flutter/material.dart';

class SnackBarExample extends StatelessWidget {
  const SnackBarExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("SnackBAr"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: const Text("This is snack bar"),
                  action: SnackBarAction(
                    label: "OK",
                    onPressed: () {
                      const SizedBox.shrink();
                    },
                  ),
                ));
              },
              child: const Text("Open Snackbar"),
            )
          ],
        ),
      ),
    );
  }
}
