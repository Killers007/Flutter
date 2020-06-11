import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

class FormPage extends StatefulWidget {
  const FormPage({Key key}) : super(key: key);
  createState() {
    return RegisterScreenState();
  }
}

class Validation {
  String validatePassword(String value) {
    if (value.length < 6) {
      return 'Password Minimal 4 Karakter';
    }
    return null;
  }

  String validateEmail(String value) {
    if (!value.contains('@')) {
      return 'Email tidak valid';
    }
    return null;
  }

  String validateName(String value) {
    if (value.isEmpty) {
      return 'Nama Lengkap Harus Diisi';
    }
    return null;
  }
}

class RegisterScreenState extends State<FormPage> with Validation {
  final formKey = GlobalKey<FormState>();

  String name = '';
  String email = '';
  String password = '';
  String daftar = 'Register';

  // Initially password is obscure
  bool _obscureText = true;

  // Toggles the password show status
  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  Widget build(context) {
    return Container(
      margin: EdgeInsets.all(20.0),
      child: Form(
          key: formKey,
          child: Column(
            children: [
              Text(daftar, textDirection: TextDirection.ltr),
              nameField(),
              emailField(),
              passwordField(),
              registerButton(),
            ],
          )),
    );
  }

  Widget nameField() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Nama Lengkap'),
      validator: validateName,
      onSaved: (String value) {
        name = value;
      },
    );
  }

  Widget emailField() {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        labelText: 'Email',
        hintText: 'email@example.com',
      ),
      validator: validateEmail,
      onSaved: (String value) {
        email = value;
      },
    );
  }

  void _changeDaftar(text) {
    setState(() {
      daftar = text;
    });
  }

  Widget passwordField() {
    return TextFormField(
      obscureText: _obscureText,
      validator: (val) => val.length < 6 ? 'Password too short.' : null,
      onSaved: (String value) {
        password = value;
      },
      onChanged: (text) {
        _changeDaftar(text);
      },
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
        labelText: 'Password',
        suffixIcon: GestureDetector(
          onTap: () {
            _toggle();
          },
          child: Icon(
            _obscureText ? Icons.visibility_off : Icons.visibility,
            color: _obscureText ? Colors.grey : Colors.blue,
          ),
        ),
        // isDense: true,
      ),
    );
  }

  Widget registerButton() {
    return RaisedButton(
      color: Colors.blueAccent,
      onPressed: () {
        this.getData();
        if (formKey.currentState.validate()) {
          formKey.currentState.save();
          print('Nama lengkap: $name');
          print('Email: $email');
          print('Passwor: $password');
        }
      },
      child: Text('Daftar', textDirection: TextDirection.ltr),
    );
  }

  Future<String> getData() async {
    
    final http.Response response = await http.post(
      'https://git.ulm.ac.id/pwa-absen/pwa/getPost',
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'title': 'tes',
      }),
    );
    if (response.statusCode == 200) {
      setState(() {
        // var content = json.decode(response);
        print(response.body);
        daftar = 'tes';
      });
    } else {
      throw Exception('Failed to load album');
    }

    return 'success!';
  }
}
