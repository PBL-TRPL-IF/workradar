import 'package:flutter/material.dart';

// template untuk bottom navigation bar
class AppTemplate extends StatelessWidget {
  final Widget child;
  final String currentRoute;

  const AppTemplate({
    Key? key,
    required this.child,
    required this.currentRoute,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      title: Text(currentRoute),
      automaticallyImplyLeading: false,
      ),
      body: child,
      bottomNavigationBar: _buildBottomNavigation(context, currentRoute)
    );
  }

  Widget _buildBottomNavigation(BuildContext context, String currentRoute) {
    return BottomNavigationBar(
      currentIndex: _getCurrentIndex(currentRoute),
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Beranda',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.task),
          label: 'Tugas',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.settings),
          label: 'Pegaturan',
        ),
      ],
      onTap: (index) => _onTabTapped(context, index),
    );
  }

  // app_template.dart
int _getCurrentIndex(String route) {
  switch (route) {
    case '/beranda':
      return 0;
    case '/tugas':
    case '/tambah-tugas': 
      return 1;
    case '/pengaturan':
      return 2;
    default:
      return 0;
  }
}

  void _onTabTapped(BuildContext context, int index) {
    switch (index) {
      case 0:
      if (currentRoute != '/beranda') {
          Navigator.pushNamed(context, '/beranda');
        }
        break;
      case 1:
        if (currentRoute != '/tugas') {
          Navigator.pushNamed(context, '/tugas');
        }
        break;
      case 2:
        if (currentRoute != '/pengaturan') {
          Navigator.pushNamed(context, '/pengaturan');
        }
        break;  
    }
  }
}
