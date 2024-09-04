import 'package:flutter/material.dart';

class Home extends StatefulWidget{
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home>{
  @override
  Widget build(BuildContext context){
    void showDialog(){
      final dialog = Dialog(
        backgroundColor: const Color(0xff5a36b6),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: const EdgeInsets.only(right: 20,left: 20,top: 15),
              child: const Text(
                'Open the Webcam mobile app on your phone then plug your phone to this pc and the device will be displayed',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontFamily: "Orelega",
                    fontSize: 18,
                    // fontWeight: FontWeight.bold,
                    color: Colors.white
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(10),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  // shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                  backgroundColor: const Color(0xffB61C36)
                ),
                onPressed: (){
                  Navigator.pop(context);
                },
                child: Container(
                  padding: const EdgeInsets.all(5),
                  child: const Text(
                    'Ok',
                    style: TextStyle(
                        fontFamily: "Orelega",
                        fontSize: 18,
                        color: Colors.white
                    ),
                  ),
                )
              ),
            )
          ],
        )
      );

      Navigator.push(context, DialogRoute(context: context, builder: (context)=>dialog));
    }

    final topCard = Stack(
      children: [
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
              showDialog();
            }, 
            icon: const Icon(Icons.info_outlined,size: 25,color: Colors.white,)
          ),
        )
      ],
    );

    final card = Container(
      padding: const EdgeInsets.only(top: 5,right: 5),
      height: 250,
      width: 200,
      child: Card(
        clipBehavior: Clip.antiAliasWithSaveLayer,
        color: const Color(0xff452D80),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: Column(
          children: [
            Expanded(
              flex: 5,
              child: Container(
                padding: const EdgeInsets.all(10),
                clipBehavior: Clip.antiAliasWithSaveLayer,
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
                child: const Image(image: AssetImage("icons/phone.png")),
              )
            ),
            Expanded(
              flex: 1,
              child: Container(
                width: double.infinity,
                height: double.infinity,
                color: const Color(0xffB61C36),
                child: Container(
                  padding: const EdgeInsets.all(5),
                  child: const Text(
                    'Samsung S22+',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontFamily: "Orelega",
                        fontSize: 18,
                        color: Colors.white
                    ),
                  ),
                ),
              )
            )
          ],
        ),
      ),
    );
    
    final window = Column(
      children: [
        Expanded(
          child: Container(
            width: double.infinity,
            margin: const EdgeInsets.all(10),
            child: Card(
              clipBehavior: Clip.antiAliasWithSaveLayer,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
              elevation: 3,
              child: Container(
                width: double.infinity,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("icons/pattern.jpg"),
                      fit: BoxFit.cover
                  )
                ),
                child: topCard,
              ),
            ),
          )
        ),
        Expanded(
          flex: 2,
          child: Container(
            // width: double.infinity,
            margin: EdgeInsets.only(left: 15),
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.all(0),
                  alignment: Alignment.centerLeft,
                  child: const Text(
                    'Devices',
                    style: TextStyle(
                        fontFamily: "Orelega",
                        fontSize: 18,
                        // fontWeight: FontWeight.bold,
                        color: Colors.white
                    ),
                  ),
                ),
                Expanded(
                  child: GridView.extent(
                    maxCrossAxisExtent: 250,
                    children: [
                      card,
                      card,
                      card,
                      card,
                      card,
                      card,
                      card,
                      card,
                      card,
                      card,
                      card,
                      card,
                      card,
                      card,
                      card,
                    ],
                  ),
                )
                
              ],
            ),
          )
        )
      ],
    );

    return Scaffold(
      backgroundColor: const Color(0xff5a36b6),
      body: window,
    );
  }
}