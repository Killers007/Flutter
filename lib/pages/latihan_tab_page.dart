import 'package:flutter/material.dart';
import 'latihan_page/variabel_page.dart';
import 'latihan_page/form_page.dart';
import 'latihan_page/image_upload_page.dart';

import 'package:google_fonts/google_fonts.dart';


class LatihanState extends StatelessWidget {
  const LatihanState({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            bottom: TabBar(
              tabs: [
                Tab(icon: Icon(Icons.assignment), text: "Variabel",),
                Tab(icon: Icon(Icons.assignment), text: "Form",),
                Tab(icon: Icon(Icons.image), text: "Image Upload",),
              ],
            ),
            title: Text('Latihan', style: GoogleFonts.lato()),
          ),
          body: TabBarView(
            children: [
              VariabelPage( key: PageStorageKey('Variabel Page'),),
              FormPage( key: PageStorageKey('Form Page'),),
              UploadImage( key: PageStorageKey('Image Page'),),
            ],
          ),
        ),
      );
  }
}