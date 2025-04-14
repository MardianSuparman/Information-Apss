import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/information_controller.dart';

class InformationView extends GetView<InformationController> {
  const InformationView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('InformationView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'InformationView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
