import 'package:flutter/material.dart';
import 'bottom_navy_bar.dart';
import '../pages/map_page.dart';
// import '../pages/latihan_page_1.dart';
// import '../pages/latihan_page_2.dart';
import '../pages/tab_page.dart';
import '../pages/latihan_tab_page.dart';
import '../pages/camera_page.dart';
import '../pages/state_management/main.dart';
import '../pages/kumpulan_app/main.dart';

class BottomNavigationBarController extends StatefulWidget {
  @override
  _BottomNavigationBarControllerState createState() =>
      _BottomNavigationBarControllerState();
}

class _BottomNavigationBarControllerState
    extends State<BottomNavigationBarController> {
  final List<Widget> pages = [
    LatihanState(
      key: PageStorageKey('Latihan'),
    ),
    StateManagement(
      key: PageStorageKey('LatihanStateManagement'),
    ),
    MapPage(
      key: PageStorageKey('MapPage'),
    ),
    LatihanTab(),
    CameraPage(
      key: PageStorageKey('CameraPage'),
    ),
    KumpulanApp(
      key: PageStorageKey('KumpulanApp'),
    ),
  ];

  final PageStorageBucket bucket = PageStorageBucket();

  int _selectedIndex = 0;

  Widget _bottomNavigationBar(int selectedIndex) => BottomNavyBar(
        selectedIndex: _selectedIndex,
        showElevation: true,
        itemCornerRadius: 8,
        curve: Curves.easeInBack,
        onItemSelected: (int index) => setState(() => _selectedIndex = index),
        items: [
          BottomNavyBarItem(
            icon: Icon(Icons.tab),
            title: Text('Latihan'),
            activeColor: Colors.cyan[300],
            textAlign: TextAlign.center,
          ),
          BottomNavyBarItem(
            icon: Icon(Icons.format_align_left),
            title: Text('State'),
            activeColor: Colors.grey,
            textAlign: TextAlign.center,
          ),
          BottomNavyBarItem(
            icon: Icon(Icons.map),
            title: Text(
              'Maps ',
            ),
            activeColor: Colors.pink,
            textAlign: TextAlign.center,
          ),
          BottomNavyBarItem(
            icon: Icon(Icons.settings),
            title: Text('Latihan Tab'),
            activeColor: Colors.pink,
            textAlign: TextAlign.center,
          ),
          BottomNavyBarItem(
            icon: Icon(Icons.camera),
            title: Text('Camera Page'),
            activeColor: Colors.green,
            textAlign: TextAlign.center,
          ),
          BottomNavyBarItem(
            icon: Icon(Icons.filter_b_and_w),
            title: Text('AppList'),
            activeColor: Colors.orange,
            textAlign: TextAlign.center,
          ),
        ],
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: _bottomNavigationBar(_selectedIndex),
      body: PageStorage(
        child: pages[_selectedIndex],
        bucket: bucket,
      ),
    );
  }
}
