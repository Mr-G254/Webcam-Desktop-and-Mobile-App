import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

abstract class Camera{
  static List<CameraDescription>? cameras;
  static CameraController? controller;
  static int cameraIndex = 0;
  static bool isFlashOn = false;

  static Future<void> initialize()async{
    WidgetsFlutterBinding.ensureInitialized();
    cameras = await availableCameras();
  }

  static Future<void> setupCamera()async{
    controller = CameraController(cameras![cameraIndex], ResolutionPreset.ultraHigh);
    await controller!.initialize();
  }

  static Future<void> switchCamera()async{
    if(cameraIndex == 0){
      cameraIndex = 1;
    }else{
      cameraIndex = 0;
    }

    controller = CameraController(cameras![cameraIndex], ResolutionPreset.ultraHigh);
    controller!.setFlashMode(FlashMode.off);
    isFlashOn = false;
    await controller!.initialize();
  }
   static Future<void> toggleFlash()async{
    if(cameraIndex == 0){
      if(isFlashOn){
        await controller!.setFlashMode(FlashMode.off).then((val){
          isFlashOn = false;
        });

      }else{
        await controller!.setFlashMode(FlashMode.torch).then((val){
          isFlashOn = true;
        });

      }
    }
   }
}