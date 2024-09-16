import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:webcam/Splashscreen.dart';
import 'package:window_manager/window_manager.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  DartPluginRegistrant.ensureInitialized();
  await windowManager.ensureInitialized();
  WindowManager.instance.setMinimumSize(const Size(800, 500));
  runApp(MaterialApp(home: Splashscreen(),));
}

