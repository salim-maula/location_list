import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'location_controller.dart';
import 'dropdown_widget.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // final ProvinceController provinceController = Get.put(ProvinceController());

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Dropdown Example'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              DropdownWidget(),
              // Widget lainnya bisa ditempatkan di sini
            ],
          ),
        ),
      ),
    );
  }
}