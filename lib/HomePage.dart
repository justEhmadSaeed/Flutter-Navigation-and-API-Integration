import 'package:flutter/material.dart';
import 'package:web_api_integration/constants.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            kDrawerHeader,
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
            ),
            ListTile(
              title: Text('View Subject'),
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
          child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image(
              image: AssetImage(
                'assets/logo.png',
              ),
              width: 300,
            ),
            Text(
              'Manage Your Subjects with a Single Touch',
              style: TextStyle(fontSize: 20),
              textAlign: TextAlign.center,
            )
          ],
        ),
      )),
    );
  }
}
