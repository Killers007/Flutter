import 'package:flutter/material.dart';
//IMPORT PACKAGE UNTUK HTTP REQUEST DAN ASYNCHRONOUS
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

void main() {
  runApp(HttpPage());
}

class HttpPage extends StatefulWidget {
  const HttpPage({Key key}) : super(key: key);
  HttpPageState createState() => HttpPageState();
}

class HttpPageState extends State<HttpPage> {
  //DEFINE VARIABLE url UNTUK MENAMPUNG END POINT
  final String url = 'https://api.banghasan.com/quran/format/json/surat';
  List
      data; //DEFINE VARIABLE data DENGAN TYPE List AGAR DAPAT MENAMPUNG COLLECTION / ARRAY

  Future<String> getData() async {
    // MEMINTA DATA KE SERVER DENGAN KETENTUAN YANG DI ACCEPT ADALAH JSON
    var res = await http
        .get(Uri.encodeFull(url), headers: {'accept': 'application/json'});

    var content = json.decode(res.body);
    data = content['hasil'];
    setState(() {
      // print(content);
    });
    return 'success!';
  }

  @override
  void initState() {
    super.initState();
    this.getData(); //PANGGIL FUNGSI YANG TELAH DIBUAT SEBELUMNYA
  }

  Widget build(context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: Scaffold(
          body: Container(
        margin: EdgeInsets.all(10.0), //SET MARGIN DARI CONTAINER
        child: ListView.builder(
          //MEMBUAT LISTVIEW
          itemCount: data == null
              ? 0
              : data
                  .length, //KETIKA DATANYA KOSONG KITA ISI DENGAN 0 DAN APABILA ADA MAKA KITA COUNT JUMLAH DATA YANG ADA
          itemBuilder: (BuildContext context, int index) {
            return Container(
                child: Card(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  //ListTile MENGELOMPOKKAN WIDGET MENJADI BEBERAPA BAGIAN
                  ListTile(
                    leading: Text(
                      data[index]['nomor'],
                      style: TextStyle(fontSize: 30.0),
                    ),
                    title: Text(
                      data[index]['nama'],
                      style: TextStyle(
                          fontSize: 25.0, fontWeight: FontWeight.bold),
                    ),
                    subtitle: Column(
                      children: <Widget>[
                        //MENGGUNAKAN COLUMN
                        Row(
                          children: <Widget>[
                            Text(
                              'Arti : ',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Text(
                              data[index]['arti'],
                              style: TextStyle(
                                  fontStyle: FontStyle.italic, fontSize: 15.0),
                            ),
                          ],
                        ),
                        Row(
                          children: <Widget>[
                            Text(
                              'Jumlah Ayat : ',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Text(data[index]['ayat'])
                          ],
                        ),
                        Row(
                          children: <Widget>[
                            Text(
                              'Diturunkan : ',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Text(data[index]['type'])
                          ],
                        ),
                      ],
                    ),
                  ),
                  ButtonTheme.bar(
                    child: ButtonBar(
                      children: <Widget>[
                        FlatButton(
                          child: const Text('LIHAT DETAIL'),
                          onPressed: () {
                            print('DENGARKAN');
                          },
                        ),
                        //BUTTON KEDUA
                        FlatButton(
                          child: const Text('DENGARKAN'),
                          onPressed: () {/* ... */},
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ));
          },
        ),
      )),
    );
  }
}
