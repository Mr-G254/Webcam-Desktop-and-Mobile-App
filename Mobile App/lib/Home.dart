import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:sensors_plus/sensors_plus.dart';
import 'package:webcam/Camera.dart';
import 'package:webcam/Components.dart';
import 'dart:math';

class Home extends StatefulWidget{
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home>{
  bool cameraIsReady = false;
  double _angle = 0.0;
  String _orientation = 'Portrait Up';

  @override
  void initState(){
    // TODO: implement initState
    super.initState();
    showCamera();

    accelerometerEventStream(samplingPeriod: SensorInterval.normalInterval).listen((event){
      _angle = atan2(event.y, event.x) * 180 / pi;


      if (_angle >= -45 && _angle <= 45) {
        if(_orientation != 'Landscape Left'){
          setState(() {
            _orientation = 'Landscape Left';
          });
        }

      } else if (_angle > 45 && _angle < 135) {
        if(_orientation != 'Portrait Down'){
          setState(() {
            _orientation = 'Portrait Down';
          });

        }
      } else if (_angle >= 135 || _angle <= -135) {
        if(_orientation != 'Landscape Right'){
          setState(() {
            _orientation = 'Landscape Right';
          });

        }
      } else if (_angle > -135 && _angle < -45) {
        if(_orientation != 'Portrait Up'){
          setState(() {
            _orientation = 'Portrait Up';
          });

        }

      }

    });
  }

  void showCamera()async{
    await Camera.setupCamera().then((val){
      setState(() {
        cameraIsReady = true;
      });
    });
  }

  @override
  Widget build(BuildContext context){
    final cameraDisplay = Container(
      padding: const EdgeInsets.all(0),
      alignment: Alignment.topLeft,
      child: CameraPreview(Camera.controller!),
    );

    final window = Column(
      children: [
        SafeArea(child: cameraDisplay,),
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                child: Transform.rotate(
                  angle: _orientation == 'Portrait Up' ? pi : _orientation == 'Landscape Left' ? pi / 2 : _orientation == 'Landscape Right' ? -pi / 2  : 0,
                  child: Container(
                    padding: const EdgeInsets.all(15),
                    child: const Image(
                      image: AssetImage("icons/mic.png"),
                      height: 35,
                      width: 35,
                    ),
                  ),
                )
              ),
              GestureDetector(
                onTap: ()async{
                  await Camera.switchCamera().then((val){
                    setState(() {

                    });
                  });
                },
                child: Transform.rotate(
                  angle: _orientation == 'Portrait Up' ? 0 : _orientation == 'Landscape Left' ? -pi / 2 : _orientation == 'Landscape Right' ? pi / 2  : pi,
                  child: Container(
                    padding: const EdgeInsets.all(15),
                    child: const Image(
                      image: AssetImage("icons/refresh.png"),
                      height: 35,
                      width: 35,
                    ),
                  ),
                )
              ),
              GestureDetector(
                onTap: ()async{
                  await Camera.toggleFlash().then((val){
                    setState(() {

                    });
                  });
                },
                child: Transform.rotate(
                  angle: _orientation == 'Portrait Up' ? 0 : _orientation == 'Landscape Left' ? -pi / 2 : _orientation == 'Landscape Right' ? pi / 2  : pi,
                  child: Container(
                    padding: const EdgeInsets.all(15),
                    child: Image(
                      image: const AssetImage("icons/flash.png"),
                      color: Camera.isFlashOn ? const Color(0xff5a36b6) : null,
                      height: 35,
                      width: 35,
                    ),
                  ),
                )
              )
            ],
          ),
        )
      ],
    );

    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        padding: const EdgeInsets.all(0),
        child: Stack(
          children: [
            Container(
              alignment: Alignment.center,
              child: cameraIsReady? window : const Center(child: CircularProgressIndicator(backgroundColor: Colors.white,),),
            ),
            Container(
              alignment: Alignment.topLeft,
              child: const SafeArea(child: Status(statusCode: false,),),
            ),

          ],
        ),
      )
    );
  }
}