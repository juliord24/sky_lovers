import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SunsetView extends GetView {
  const SunsetView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Atardecer'),
      ),
    );
  }
}
