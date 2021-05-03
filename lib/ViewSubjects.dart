import 'package:flutter/material.dart';
import 'package:web_api_integration/constants.dart';
import 'package:http/http.dart' as http;

class ViewSubjects extends StatelessWidget {
  Future fetchSubjects() async {}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('View Subject'),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            kDrawerHeader,
            ListTile(
              title: Text('Home'),
              leading: Icon(
                Icons.home,
                color: Colors.tealAccent[700],
                size: 30,
              ),
              onTap: () {
                Navigator.popUntil(context, ModalRoute.withName('/'));
              },
              dense: true,
            ),
            ListTile(
              title: Text('Add Subject'),
              leading: Icon(
                Icons.add,
                color: Colors.tealAccent[700],
                size: 30,
              ),
              onTap: () {
                Navigator.popAndPushNamed(context, '/add-subject');
              },
              dense: true,
            )
          ],
        ),
      ),
      body: Container(
        child: Text('Home'),
      ),
    );
  }
}
