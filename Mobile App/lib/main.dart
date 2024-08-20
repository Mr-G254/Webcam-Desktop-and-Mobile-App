import 'package:flutter/material.dart';
import 'package:webcam/Camera.dart';
import 'package:webcam/Splashscreen.dart';

void main() async{
  await Camera.initialize();
  runApp(
      MaterialApp(
        home: Scaffold(
          body: Splashscreen(),
        ),
      )
  );
}

