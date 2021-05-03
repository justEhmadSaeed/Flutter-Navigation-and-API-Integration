import 'package:flutter/material.dart';
import 'package:web_api_integration/constants.dart';

class AddSubject extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Subject'),
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
              title: Text('View Subjects'),
              leading: Icon(
                Icons.visibility,
                color: Colors.tealAccent[700],
                size: 30,
              ),
              onTap: () {
                Navigator.popAndPushNamed(context, '/view-subjects');
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
