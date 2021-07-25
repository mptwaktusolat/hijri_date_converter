import 'package:flutter/material.dart';
import 'package:hijri_date_converter/hijri_date_convert.dart';
import 'package:hijri_date_converter/shortcut_link.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hijri Converter',
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      home: Scaffold(
          appBar: AppBar(
            title: const Text('Hijri Converter'),
          ),
          body: Column(
            children: const <Widget>[HijriDateConvert(), ShortcutLinks()],
          )),
    );
  }
}
