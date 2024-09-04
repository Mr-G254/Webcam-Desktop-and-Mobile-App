import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'Home.dart';

class Splashscreen extends StatefulWidget{
  late Timer timer;
  Splashscreen({super.key});

  @override
  State<Splashscreen> createState() => _SplashscreenState();

}


class _SplashscreenState extends State<Splashscreen>{
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown
    ]);

    widget.timer = Timer(const Duration(seconds: 2), (){
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const Home()));
    });

  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    widget.timer.cancel();
  }

  @override
  Widget build(BuildContext context){

    final window = Container(
      width: double.infinity,
      height: double.infinity,
      child: const SafeArea(
        child: Column(
          children: [
            Text(
              'Webcam',
              style: TextStyle(
                fontFamily: "Orelega",
                fontSize: 40,
                // fontWeight: FontWeight.bold,
                color: Colors.white
              ),
            ),
            Image(
              image: AssetImage("icons/webcam.png"),
              height: 40,
              width: 40,
            )
          ],
        ),
      ),
    );

    return Scaffold(
      backgroundColor: const Color(0xff5a36b6),
      body: Column(
        children: [
          const Expanded(
            flex: 2,
            child: SizedBox()
          ),
          Expanded(
            flex: 2,
            child: window
          ),
          const Expanded(
            flex: 5,
            child: SizedBox()
          )
        ],
      ),
    );
  }
}