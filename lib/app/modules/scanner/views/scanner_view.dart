import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/scanner_controller.dart';

class ScannerView extends GetView<ScannerController> {
  const ScannerView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ScannerView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'ScannerView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
