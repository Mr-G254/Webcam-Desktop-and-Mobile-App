import 'package:flutter/material.dart';

class Home extends StatefulWidget{
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home>{
  @override
  Widget build(BuildContext context){
    final topCard = Stack(
      children: [
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(6),
            image: const DecorationImage(
              image: AssetImage("icons/pattern.jpg"),
              fit: BoxFit.fitWidth
            )
          ),

        ),
        Container(
          alignment: Alignment.center,
          width: double.infinity,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                child: const Image(
                  image: AssetImage("icons/webcam.png"),
                  height: 40,
                  width: 40,
                ),
              ),
              Container(
                padding: const EdgeInsets.all(10),
                child: const Text(
                  'Webcam',
                  style: TextStyle(
                      fontFamily: "Orelega",
                      fontSize: 40,
                      // fontWeight: FontWeight.bold,
                      color: Colors.white
                  ),
                ),
              ),
            ],
          ),
        ),
        Container(
          alignment: Alignment.topLeft,
          padding: const EdgeInsets.all(5),
          child: Card(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
            color: Colors.white.withOpacity(0.3),
            child: Container(
              padding: const EdgeInsets.only(right: 15,left: 15,),
              child: const Text(
                'Use your mobile phone as webcam',
                style: TextStyle(
                    fontFamily: "Orelega",
                    fontSize: 18,
                    // fontWeight: FontWeight.bold,
                    color: Colors.white
                ),
              ),
            )
          )
        ),
        Container(
          alignment: Alignment.bottomRight,
          child: IconButton(
            onPressed: (){
              
            }, 
            icon: Icon(Icons.info_outlined,size: 25,color: Colors.white,)
          ),
        )
      ],
    );
    
    final window = Column(
      children: [
        Expanded(
          child: Container(
            width: double.infinity,
            margin: EdgeInsets.all(10),
            child: topCard,
          )
        ),
        Expanded(
          flex: 2,
          child: SizedBox(),
        )

      ],
    );

    return Scaffold(
      backgroundColor: const Color(0xff5a36b6),
      body: window,
    );
  }
}