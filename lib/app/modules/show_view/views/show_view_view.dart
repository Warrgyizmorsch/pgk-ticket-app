import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/show_view_controller.dart';

class ShowViewView extends GetView<ShowViewController> {
  const ShowViewView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ShowViewView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'ShowViewView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
