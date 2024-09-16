import 'dart:typed_data';
import 'package:usb_serial/usb_serial.dart';
import 'package:webcam/Components.dart';

abstract class Comms{
  static List<UsbDevice> devices = [];
  static List<Phone> deviceWidgets = [];
  static late Function statusUpdate;

  static void initialize(Function() onChange)async{
    statusUpdate = onChange;
    identifyConnectedDevices();
    listenToUsbEvents();
  }

  static Future<void> identifyConnectedDevices()async{

    for(final i in devices){
      connectToDevices(i);
    }
  }

  static Future<void> connectToDevices(UsbDevice device)async{
    UsbPort? port = await device.create();
    if(await port!.open()) {
      port.setDTR(true);
      port.setRTS(true);

      await port.write(Uint8List.fromList("Webcam_Desktop@Mrg".codeUnits));
      port.inputStream!.listen((data) {
        String message = String.fromCharCodes(data);
        if (message == "Connection_Accepted@Mrg") {
          devices.add(device);
          deviceWidgets.add(Phone(device: device));
          statusUpdate();

        }

        port.close();
      });
    }
  }

  static Future<void> listenToUsbEvents()async{
    UsbSerial.usbEventStream!.listen((UsbEvent event){
      if (event.event == UsbEvent.ACTION_USB_ATTACHED) {
        if(event.device != null){
          connectToDevices(event.device!);
        }

      } else if (event.event == UsbEvent.ACTION_USB_DETACHED) {
        devices.remove(event.device);
        deviceWidgets.remove(Phone(device: event.device!,));
        statusUpdate();
      }

    });
  }
}