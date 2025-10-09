import 'package:flutter/material.dart';
import '../config/app_template.dart';

class SettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AppTemplate(
      currentRoute: '',
      child: Center(
        child: Text('konten pengaturan'),
      ),
    );
  }
}