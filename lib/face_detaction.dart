import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_mlkit_face_detection/google_mlkit_face_detection.dart';

class FaceDetectionScreen extends StatefulWidget {
  const FaceDetectionScreen({super.key});

  @override
  State<FaceDetectionScreen> createState() => _FaceDetectionScreenState();
}

class _FaceDetectionScreenState extends State<FaceDetectionScreen> {
  File? _imageFile;
  List<Face> faces = [];

  // Future<File?> _pickImage(ImageSource source) async {
  //   try {
  //     final image = await ImagePicker().pickImage(source: source);
  //     if (image == null) return null;
  //     setState(() {
  //       _imageFile = File(image.path);
  //       _detectFaces(_imageFile!);
  //     });
  //   } catch (e) {
  //     if (kDebugMode) {
  //       print(e);
  //     }
  //   }
  // }

  Future _detectFaces(File image) async {
    final options = FaceDetectorOptions();
    final faceDetector = FaceDetector(options: options);
    final inputImage = InputImage.fromFile(image);
    faces = await faceDetector.processImage(inputImage);
    setState(() {});
    if (kDebugMode) {
      print('Faces: ${faces.length}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Face Detection'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            children: [
              Container(
                width: double.infinity,
                height: 250.0,
                color: Colors.grey,
                child: Center(
                  child: _imageFile == null
                      ? const Icon(
                          Icons.add_a_photo,
                          size: 80.0,
                        )
                      : Image.file(
                          _imageFile!,
                        ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              // SizedBox(
              //   width: double.infinity,
              //   height: 50.0,
              //   child: MaterialButton(
              //     onPressed: () {
              //       _pickImage(ImageSource.camera);
              //     },
              //     child: const Text(
              //       'Take a photo',
              //       style: TextStyle(
              //         fontSize: 23.0,
              //       ),
              //     ),
              //   ),
              // ),
              const SizedBox(
                height: 10,
              ),
              // SizedBox(
              //   width: double.infinity,
              //   height: 50.0,
              //   child: MaterialButton(
              //     onPressed: () {
              //       _pickImage(ImageSource.gallery);
              //     },
              //     child: const Text(
              //       'Pick a photo',
              //       style: TextStyle(
              //         fontSize: 23.0,
              //       ),
              //     ),
              //   ),
              // ),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                width: double.infinity,
                child: Text(
                  '${faces.length} face(s) detected',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
