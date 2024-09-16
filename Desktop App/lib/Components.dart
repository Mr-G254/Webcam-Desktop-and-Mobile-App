import 'package:flutter/material.dart';
import 'package:usb_serial/usb_serial.dart';

class Phone extends StatelessWidget{
  final UsbDevice device;
  const Phone({super.key,required this.device});

  @override
  Widget build(BuildContext context){
    return GestureDetector(
      child: Container(
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
                      child: Text(
                        device.deviceName,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
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
      ),
    );
  }
}