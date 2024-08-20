import 'dart:ui';

import 'package:flutter/material.dart';

class Status extends StatelessWidget{
  final bool statusCode;
  const Status({super.key,required this.statusCode});

  @override
  Widget build(BuildContext context){
    final conn = IntrinsicWidth(
      child: Container(
        margin: const EdgeInsets.only(left: 10),
        padding: const EdgeInsets.only(right: 10,left: 10),
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 20.0, sigmaY: 20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                decoration: const BoxDecoration(shape: BoxShape.circle,color: Color(0xff07EB39)),
                height: 10,
                width: 10,
              ),
              const SizedBox(width: 10,),
              const Text(
                'connected',
                style: TextStyle(
                    fontFamily: "Orelega",
                    fontSize: 20,
                    // fontWeight: FontWeight.bold,
                    color: Colors.white
                ),
              )
            ],
          ),
        ),
      ),
    );

    final disconn = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        IntrinsicWidth(
          child: Container(
            margin: const EdgeInsets.only(left: 10),
            padding: const EdgeInsets.only(right: 10,left: 10),
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 20.0, sigmaY: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    decoration: const BoxDecoration(shape: BoxShape.circle,color: Color(0xffEB0707)),
                    height: 10,
                    width: 10,
                  ),
                  const SizedBox(width: 10,),
                  const Text(
                    'disconnected',
                    style: TextStyle(
                        fontFamily: "Orelega",
                        fontSize: 20,
                        color: Colors.white
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
        Container(
          margin: const EdgeInsets.all(10),
          padding: const EdgeInsets.only(right: 10,left: 10),
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 20.0, sigmaY: 20.0),
            child: const Text(
              'Ensure that you have plugged your phone to your pc and launch the software on the pc to use this application',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: "Orelega",
                fontSize: 20,
                color: Colors.white
              ),
            ),
          ),
        )
      ],
    );

    return SafeArea(
      child: statusCode ? conn : disconn
    );
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
    final res = Row(
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
        const SizedBox(width: 10,),
        Container(
          decoration: const BoxDecoration(shape: BoxShape.circle,color: Color(0xff07EB39)),
          height: 10,
          width: 10,
        ),
        const SizedBox(width: 10,),
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
    );

    final control = Container(
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.only(right: 10,left: 10,top: 10,bottom: 10),
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 30.0, sigmaY: 30.0),
        child: Row(
          children: [
            res,
            const SizedBox(width: 20,),
            IconButton(
              onPressed: (){
                
              }, 
              icon: Icon(Icons.sw)
            )
          ],
        )
      ),
    );

    return IntrinsicWidth(
      child: control,
    );
  }
}