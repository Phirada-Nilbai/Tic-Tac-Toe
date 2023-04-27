import 'package:flutter/material.dart';
import '4x4_page.dart';
import '5x5_page.dart';
import 'home_screen.dart';
import 'history_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: const HomeScreen(),
        routes: {
          '/4x4': (context) => const fourxfourPage(),
          '/5x5': (context) => const fivexfivePage(),
          '/history': (context) => const HistoryPage(
                score: [],
                winners: [],
              ),
        });
  }
}
