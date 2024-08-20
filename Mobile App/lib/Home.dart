import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:webcam/Camera.dart';
import 'package:webcam/Components.dart';

class Home extends StatefulWidget{
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home>{
  bool cameraIsReady = false;

  @override
  void initState(){
    // TODO: implement initState
    super.initState();
    showCamera();
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
    final window = Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          alignment: Alignment.topLeft,
          child: Status(statusCode: true,),
        ),
        Container(
          alignment: Alignment.center,
          child: Controls(),
        )
      ],
    );

    final cameraDisplay = Container(
      padding: const EdgeInsets.all(0),
      // height: double.infinity,
      // width: double.infinity,
      // child: CameraPreview(Camera.controller!),
      child: Transform.scale(
        scale: 1 / (Camera.controller!.value.aspectRatio * MediaQuery.of(context).size.aspectRatio),
        child: CameraPreview(Camera.controller!),
      ),
    );

    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          cameraIsReady? Center(child: cameraDisplay,) : const Center(child: CircularProgressIndicator(backgroundColor: Colors.white,),),
          Visibility(
            visible: cameraIsReady,
            child: window
          )
        ],
      )
    );
  }
}