import 'package:flutter/material.dart';
import 'tab_page/latihan_page_1.dart';
import 'tab_page/latihan_page_2.dart';
import 'tab_page/permission_page.dart';
import 'tab_page/http_page.dart';

class LatihanTab extends StatelessWidget {
  const LatihanTab({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          bottom: TabBar(
            isScrollable: true,
            tabs: [
              Tab(
                icon: Icon(Icons.camera_alt),
                // text: "Test Request",
              ),
              Tab(
                // icon: Icon(Icons.directions_car),
                text: "Non persistent",
              ),
              Tab(
                  // icon: Icon(Icons.directions_transit),
                  text: "Persistent"),
              Tab(
                  // icon: Icon(Icons.accessibility),
                  text: "Permission"),
            ],
          ),
          title: Text('Latihan Tab'),
        ),
        body: TabBarView(
          children: [
            HttpPage(
              key: PageStorageKey('HttpPage'),
            ),
            Latihan1(
              key: PageStorageKey('Latihan1Page'),
            ),
            Latihan2(
              key: PageStorageKey('Latihan2Page'),
            ),
            PermissionPage(
              key: PageStorageKey('PermissionPage'),
            ),
          ],
        ),
      ),
    );
  }
}
