import 'package:flutter/material.dart';
import 'app/ui/pages/details_page.dart';
import 'app/ui/pages/home_page.dart';

void main() {
  runApp(
    MaterialApp(
      home: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const DetailPage();
  }
}
