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
                child: Container(
                  padding: const EdgeInsets.all(15),
                  child: const Image(
                    image: AssetImage("icons/mic.png"),
                    height: 35,
                    width: 35,
                  ),
                ),
              ),
              GestureDetector(
                onTap: ()async{
                  await Camera.switchCamera().then((val){
                    setState(() {

                    });
                  });
                },
                child: Container(
                  padding: const EdgeInsets.all(15),
                  child: const Image(
                    image: AssetImage("icons/refresh.png"),
                    height: 35,
                    width: 35,
                  ),
                ),
              ),
              GestureDetector(
                onTap: ()async{
                  await Camera.toggleFlash().then((val){
                    setState(() {

                    });
                  });
                },
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