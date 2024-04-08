import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:giphy_test/presentation/screens/root_screen/root_screen.dart';
import 'package:giphy_test/utils/theme/theme.dart';

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context, ref) {
    final themeNotifier = ref.watch(themeNotifierProvider);

    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: lightTheme,
      darkTheme: darkTheme,
      themeMode:
          themeNotifier == Brightness.light ? ThemeMode.light : ThemeMode.dark,
      home: const RootScreen(),
    );
  }
}
