import 'dart:io';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:google_mlkit_text_recognition/google_mlkit_text_recognition.dart';

import 'DetectResult.dart';

class extractResult{
  detectResult detector=detectResult();
  late final  FileImage image;
  final textRecognizer = TextRecognizer();
  Future takePicture({required CameraController cameraController}) async {
    if(cameraController!=null && cameraController!.value.isInitialized){
      final pictureFile = await cameraController!.takePicture();
      final file = File(pictureFile.path);
      final inputImage = InputImage.fromFile(file);
      final recognizedText = await textRecognizer.processImage(inputImage);
      detector.listOfItems.clear();
      var x=await detector.findResult(recognizer: recognizedText);
      if(x is List) {
        if (x.isEmpty) {
          await Future.delayed(Duration(milliseconds: 200)).then((value) {
            return takePicture(cameraController: cameraController);
          });
        }
      }
      return x;
    }
  }
  Future ensureResult(RecognizedText recognizedText)async{
      var x=await detector.findResult(recognizer: recognizedText);
      if(x is List){
      }
  }
}
