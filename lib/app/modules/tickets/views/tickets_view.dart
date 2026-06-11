import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/tickets_controller.dart';

class TicketsView extends GetView<TicketsController> {
  const TicketsView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TicketsView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'TicketsView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
