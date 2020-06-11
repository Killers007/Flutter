import 'package:flutter/material.dart';
import 'dart:io';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:dio/dio.dart';
import 'package:path/path.dart' as path;
import 'package:file_picker/file_picker.dart';

class UploadImage extends StatefulWidget {
  const UploadImage({Key key}) : super(key: key);

  final String title = "Upload Image Demo";

  @override
  UploadImageDemoState createState() => UploadImageDemoState();
}

class UploadImageDemoState extends State<UploadImage> {
  //
  static final String uploadEndPoint =
      'https://git.ulm.ac.id/pwa-absen/pwa/getPost';
  Future<File> file;
  String status = '';
  String base64Image;
  String imagePath;
  File tmpFile;
  String errMessage = 'Error Uploading Imagseas';

  chooseImage() async {
    File file = await FilePicker.getFile();
    print('PATAH');
    print(file.path);
    setState(() {
      imagePath = file.path;
      // file = ImagePicker.pickImage(source: ImageSource.gallery);
    });
    setStatus(file.path);
  }

  setStatus(String message) {
    setState(() {
      status = message;
    });
  }

  startUpload() {
    setStatus('Uploading Image...');
    // String fileName = imagePath.split('/').last;
    upload();
  }

  void upload() async {
    try {
      //404
      Response response;
      BaseOptions options = new BaseOptions(
        baseUrl: "https://git.ulm.ac.id/pwa-absen",
        // connectTimeout: 5000,
        // receiveTimeout: 3000,
      );

      Dio dio = new Dio(options);
      FormData formData = new FormData.fromMap({
        "name": "wendux",
        "age": 25,
      });

      if (imagePath != null) {
        formData.files.add(MapEntry(
            'upload',
            await MultipartFile.fromFile(
              imagePath,
              filename: path.basename(imagePath),
            )));
      }

      setStatus('Loading');
      response = await dio.post('/pwa/getPost', data: formData);
      setStatus(response.data);
    } on DioError catch (e) {
      print('DIO ERROR');
      print(e);
      // if (e.response.headers == 200) {
      //   setStatus(e.response.data);
      //   print(e.response.data);
      //   print(e.response.headers);
      //   print(e.response.request);
      // } else {
      //   print(e.request);
      //   print(e.message);
      // }
    }
  }

  Widget showImage() {
    return FutureBuilder<File>(
      future: file,
      builder: (BuildContext context, AsyncSnapshot<File> snapshot) {
        if (snapshot.connectionState == ConnectionState.done &&
            null != snapshot.data) {
          tmpFile = snapshot.data;
          imagePath = tmpFile.path;
          base64Image = base64Encode(snapshot.data.readAsBytesSync());
          return Flexible(
            child: Image.file(
              snapshot.data,
              fit: BoxFit.fill,
            ),
          );
        } else if (null != snapshot.error) {
          return const Text(
            'Error Picking Image',
            textAlign: TextAlign.center,
          );
        } else {
          return const Text(
            'No Image Selected',
            textAlign: TextAlign.center,
          );
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(30.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            OutlineButton(
              onPressed: chooseImage,
              child: Text('Choose Images'),
            ),
            SizedBox(
              height: 20.0,
            ),
            // showImage(),
            SizedBox(
              height: 20.0,
            ),
            OutlineButton(
              onPressed: startUpload,
              child: Text('Upload Image'),
            ),
            SizedBox(
              height: 20.0,
            ),
            Text(
              status,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.green,
                fontWeight: FontWeight.w500,
                fontSize: 20.0,
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
          ],
        ),
      ),
    );
  }
}
