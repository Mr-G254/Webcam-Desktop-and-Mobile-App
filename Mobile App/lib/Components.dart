import 'package:flutter/material.dart';

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
