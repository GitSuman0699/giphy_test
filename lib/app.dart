import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:giphy_test/presentation/screens/root_screen/root_screen.dart';
import 'package:giphy_test/utils/theme/theme.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(builder: (context, _) {
      return MaterialApp(
        title: 'Flutter Demo',
        theme: AAppTheme.lightTheme,
        darkTheme: ThemeData.dark(),
        themeMode: ThemeMode.light,
        home: const RootScreen(),
      );
    });
  }
}
