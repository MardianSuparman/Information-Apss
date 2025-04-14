import 'package:flutter/material.dart';

import 'package:get/get.dart';

class InformationView extends GetView {
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
          'InformationView is jalan',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
