import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_mlkit_commons/google_mlkit_commons.dart';
import 'package:google_mlkit_face_detection/google_mlkit_face_detection.dart';
import 'package:tflite_flutter/tflite_flutter.dart';

import 'face_detector_view.dart';

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
      home: const Home(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({
    super.key,
  });

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  File? _imageFile1;
  File? _imageFile2;
  late Interpreter _interpreter;

  @override
  void initState() {
    super.initState();
    __interpreter();
  }

  Future __interpreter() async {
    _interpreter = await Interpreter.fromAsset('assets/your_model.tflite');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 100,
              height: 100,
              color: Colors.grey,
              child: Center(
                child: _imageFile1 == null
                    ? const Icon(
                        Icons.add_a_photo,
                      )
                    : Image.file(
                        _imageFile1!,
                      ),
              ),
            ),
            const SizedBox(height: 20),
            Container(
              width: 100,
              height: 100,
              color: Colors.grey,
              child: Center(
                child: _imageFile2 == null
                    ? const Icon(
                        Icons.add_a_photo,
                      )
                    : Image.file(
                        _imageFile2!,
                      ),
              ),
            ),
            ElevatedButton(
              onPressed: () async {
                final inputImage = await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const FaceDetectorView(),
                  ),
                ) as InputImage?;
                print('Image ----> ${inputImage}');
                if (inputImage != null) {
                  setState(() {
                    _imageFile1 = File(inputImage.filePath!);
                  });
                } else {
                  setState(() {
                    _imageFile1 = null;
                  });
                }
              },
              child: const Text('Image 1'),
            ),
            ElevatedButton(
              onPressed: () async {
                final inputImage = await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const FaceDetectorView(),
                  ),
                ) as InputImage?;
                print('Image ----> ${inputImage}');
                if (inputImage != null) {
                  setState(() {
                    _imageFile2 = File(inputImage.filePath!);
                  });
                } else {
                  setState(() {
                    _imageFile2 = null;
                  });
                }
              },
              child: const Text('Image 2'),
            ),
          ],
        ),
      ),
    );
  }
}
