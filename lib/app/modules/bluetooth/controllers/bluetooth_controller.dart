import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../../common/constant/app_imports.dart';

class BluetoothController extends GetxController {
  var isScanning = false.obs;
  var isBluetoothOn = false.obs;
  var scanResults = <ScanResult>[].obs;
  var connectedDevice = Rxn<BluetoothDevice>();

  StreamSubscription<BluetoothConnectionState>? _connectionSubscription;

  @override
  void onInit() {
    super.onInit();
    _initBluetooth();
  }

  Future<void> _initBluetooth() async {
    FlutterBluePlus.adapterState.listen((BluetoothAdapterState state) {
      isBluetoothOn.value = state == BluetoothAdapterState.on;
      if (state == BluetoothAdapterState.on) {
        startScan();
      } else {
        // If Bluetooth turns off, clear results and connected device
        scanResults.clear();
        disconnectDevice();
      }
    });
  }

  Future<void> startScan() async {
    // FIX 1: Request Location alongside Bluetooth permissions for older Androids
    Map<Permission, PermissionStatus> statuses = await [
      Permission.bluetoothScan,
      Permission.bluetoothConnect,
      Permission.location, // CRITICAL for Android 11 and below
    ].request();

    bool canScan = (statuses[Permission.bluetoothScan]?.isGranted ?? true) ||
        (statuses[Permission.location]?.isGranted ?? false);

    if (canScan) {
      try {
        isScanning.value = true;
        scanResults.clear();

        await FlutterBluePlus.startScan(timeout: const Duration(seconds: 15));

        FlutterBluePlus.scanResults.listen((results) {
          scanResults.value = results;
        });

      } catch (e) {
        Get.snackbar('Error', 'Failed to start scan: $e');
      } finally {
        // Stop scanning after timeout
        await Future.delayed(const Duration(seconds: 15));
        isScanning.value = false;
        FlutterBluePlus.stopScan();
      }
    } else {
      Get.snackbar(
        'Permission Denied',
        'Bluetooth and Location permissions are required to find devices.',
      );
    }
  }

  Future<void> connectToDevice(BluetoothDevice device) async {
    try {
      Get.dialog(const Center(child: CircularProgressIndicator()), barrierDismissible: false);

      await device.connect(timeout: const Duration(seconds: 5));
      connectedDevice.value = device;

      Get.back(); // Close loading dialog

      // FIX 3: Fallback naming
      String name = device.platformName.isNotEmpty
          ? device.platformName
          : device.remoteId.str;

      Get.snackbar('Success', 'Connected to $name', backgroundColor: Colors.green, colorText: Colors.white);

      // FIX 2: Listen for unexpected disconnections
      _connectionSubscription?.cancel();
      _connectionSubscription = device.connectionState.listen((state) {
        if (state == BluetoothConnectionState.disconnected) {
          connectedDevice.value = null;
          Get.snackbar('Disconnected', 'The device was disconnected.');
        }
      });

    } catch (e) {
      if (Get.isDialogOpen ?? false) Get.back();
      Get.snackbar('Connection Failed', 'Could not connect to device. Try again.', backgroundColor: Colors.redAccent, colorText: Colors.white);
    }
  }

  void disconnectDevice() {
    if (connectedDevice.value != null) {
      connectedDevice.value!.disconnect();
      connectedDevice.value = null;
      _connectionSubscription?.cancel();
    }
  }

  @override
  void onClose() {
    FlutterBluePlus.stopScan();
    _connectionSubscription?.cancel();
    super.onClose();
  }
}