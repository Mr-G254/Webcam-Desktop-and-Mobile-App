import 'package:flutter/material.dart';
import 'package:webcam/Components.dart';

class Home extends StatefulWidget{
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home>{
  @override
  Widget build(BuildContext context){
    final window = Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Status(statusCode: false,),
        Controls()
      ],
    );

    return Scaffold(
      backgroundColor: const Color(0xff6E49CB),
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(image: AssetImage("icons/bg.jpg"),fit: BoxFit.cover),
            ),
          ),
          window
        ],
      )
    );
  }
}