import 'dart:async';
import 'package:get/get.dart';
import 'package:audio_session/audio_session.dart';

class BluetoothController extends GetxController {
  var isBluetoothAudioConnected = false.obs;
  var connectedDeviceName = ''.obs;

  @override
  void onInit() {
    super.onInit();
    checkSystemConnectedAudio();
    _listenToAudioChanges();
  }

  Future<void> checkSystemConnectedAudio() async {
    final session = await AudioSession.instance;
    final devices = await session.getDevices();

    bool isConnected = false;
    String name = '';

    for (var device in devices) {
      // ignore: experimental_member_use
      if (device.type == AudioDeviceType.bluetoothA2dp) {
        isConnected = true;
        name = device.name.isNotEmpty ? device.name : "Bluetooth Headset";
        break;
      }
    }

    isBluetoothAudioConnected.value = isConnected;
    connectedDeviceName.value = isConnected ? name : '';
  }

  void _listenToAudioChanges() async {
    final session = await AudioSession.instance;

    session.devicesChangedEventStream.listen((event) {
      checkSystemConnectedAudio();
    });
  }
}
