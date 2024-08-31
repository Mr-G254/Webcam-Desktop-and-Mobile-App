import 'package:audio_waveforms/audio_waveforms.dart';
import 'package:flutter/material.dart';
import 'dart:ui' as ui;

class Status extends StatelessWidget{
  final bool statusCode;
  const Status({super.key,required this.statusCode});

  @override
  Widget build(BuildContext context){
    final conn = IntrinsicWidth(
      child: Container(
        margin: const EdgeInsets.only(left: 5,top: 5),
        padding: const EdgeInsets.only(right: 10,left: 10),
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(7),color: Colors.black.withOpacity(0.5)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              decoration: const BoxDecoration(shape: BoxShape.circle,color: Color(0xff07EB39)),
              height: 8,
              width: 8,
            ),
            const SizedBox(width: 10,),
            const Text(
              'connected',
              style: TextStyle(
                  fontFamily: "Orelega",
                  fontSize: 17,
                  // fontWeight: FontWeight.bold,
                  color: Colors.white
              ),
            )
          ],
        ),
      ),
    );

    final disconn = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        IntrinsicWidth(
          child: Container(
            margin: const EdgeInsets.only(left: 5,top: 5),
            padding: const EdgeInsets.only(right: 10,left: 10),
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(7),color: Colors.black.withOpacity(0.5)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  decoration: const BoxDecoration(shape: BoxShape.circle,color: Color(0xffEB0707)),
                  height: 8,
                  width: 8,
                ),
                const SizedBox(width: 10,),
                const Text(
                  'disconnected',
                  style: TextStyle(
                      fontFamily: "Orelega",
                      fontSize: 17,
                      color: Colors.white
                  ),
                )
              ],
            ),
          ),
        ),
        Container(
          margin: const EdgeInsets.all(5),
          padding: const EdgeInsets.only(right: 10,left: 10),
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(7),color: Colors.black.withOpacity(0.5)),
          child: const Text(
            'Ensure that you have plugged your phone to your pc and launch the Webcam software on the pc to use this application',
            textAlign: TextAlign.center,
            style: TextStyle(
                fontFamily: "Orelega",
                fontSize: 17,
                color: Colors.white
            ),
          ),
        )
      ],
    );

    return statusCode ? conn : disconn;
  }
}

class Controls extends StatefulWidget{
  const Controls({super.key});

  @override
  State<Controls> createState() => _ControlsState();
}

class _ControlsState extends State<Controls>{
  @override
  Widget build(BuildContext context){
    final res = Container(
      padding: const EdgeInsets.only(right: 5,left: 5),
      child: Row(
        children: [
          const Text(
            '1080',
            style: TextStyle(
                fontFamily: "Orelega",
                fontSize: 20,
                // fontWeight: FontWeight.bold,
                color: Colors.white
            ),
          ),
          const SizedBox(width: 5,),
          Container(
            decoration: const BoxDecoration(shape: BoxShape.circle,color: Colors.white),
            height: 7,
            width: 7,
          ),
          const SizedBox(width: 5,),
          const Text(
            '30',
            style: TextStyle(
                fontFamily: "Orelega",
                fontSize: 20,
                // fontWeight: FontWeight.bold,
                color: Colors.white
            ),
          )
        ],
      ),
    );

    final rotate = Container(
      padding: const EdgeInsets.only(right: 15,left: 15),
      child: const Image(
        image: AssetImage("icons/refresh.png"),
        height: 25,
        width: 25,
      ),
    );

    final flash = Container(
      // padding: const EdgeInsets.only(right: 5,left: 5),
      child: const Image(
        image: AssetImage("icons/flash.png"),
        height: 25,
        width: 25,
      ),
    );

    final control = Container(
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.only(right: 10,left: 10,top: 10,bottom: 10),
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),color: Colors.black.withOpacity(0.5)),
      child:  Row(
        children: [
          res,
          rotate,
          flash
        ],
      ),
    );

    return IntrinsicWidth(
      child: control,
    );
  }
}

