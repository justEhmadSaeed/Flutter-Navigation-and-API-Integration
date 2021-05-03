import 'package:flutter/material.dart';
import 'package:web_api_integration/AddSubject.dart';
import 'package:web_api_integration/HomePage.dart';
import 'package:web_api_integration/ViewSubjects.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Subjects Management App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => HomePage(),
        '/add-subject': (context) => AddSubject(),
        '/view-subjects': (context) => ViewSubjects(),
      },
    );
  }
}
