import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

abstract class Camera{
  static List<CameraDescription>? cameras;
  static CameraController? controller;

  static Future<void> initialize()async{
    WidgetsFlutterBinding.ensureInitialized();
    cameras = await availableCameras();
  }

  static Future<void> setupCamera()async{
    controller = CameraController(cameras![0], ResolutionPreset.high);
    await controller!.initialize();
  }
}