import 'package:flutter/material.dart';

import 'home.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Local Auth',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Home(

      ),
    );
  }
}

