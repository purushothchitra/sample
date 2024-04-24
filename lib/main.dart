import 'ar_augmented_images_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Augmented Images from Assets',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home:const ARGLBScreen(),
    );
  }
}


