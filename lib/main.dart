import 'package:face_detaction/detector_view.dart';
import 'package:face_detaction/face_detaction.dart';
import 'package:flutter/foundation.dart';
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
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: DetectorView(
        title: 'Detector View',
        onImage: (image) {
          if (kDebugMode) print(image);
        },
      ),
    );
  }
}
