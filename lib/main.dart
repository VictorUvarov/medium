import 'package:flutter/material.dart';
import 'package:medium/ui/views/startup_view.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Medium',
      debugShowCheckedModeBanner: false,
      home: StartupView(),
    );
  }
}
