import 'package:flutter/material.dart';
import '../config/app_template.dart';

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AppTemplate(
      currentRoute: '',
      child: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
          'konten beranda',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 20),
          //konten utama
        ],
      ),
      ),
    );
  }
}