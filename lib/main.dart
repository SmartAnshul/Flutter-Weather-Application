import 'package:flutter/material.dart';
import 'pages/home.dart'; // Import your home.dart file

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Your App Title',
      home: const HomePage(), // Use the HomePage widget as the home
    );
  }
}
