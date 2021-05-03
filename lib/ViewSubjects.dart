import 'package:flutter/material.dart';
import 'package:web_api_integration/constants.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ViewSubjects extends StatelessWidget {
  Future fetchSubjects() async {
    var response = await http.get(apiURL);
    if (response.statusCode == 200) {
      var result = jsonDecode(response.body);
      return result;
    }
  }

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
        child: FutureBuilder(
          future: fetchSubjects(),
          builder: (BuildContext _, AsyncSnapshot snapshot) {
            if (!snapshot.hasData) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else {
              print(snapshot.data);
              return Column(
                children: [
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.all(5),
                      child: SingleChildScrollView(
                        scrollDirection: Axis.vertical,
                        child: DataTable(
                          columns: [
                            DataColumn(label: Text('Title')),
                            DataColumn(label: Text('Level')),
                            DataColumn(label: Text('Theory Hrs')),
                            DataColumn(label: Text('Lab Hrs')),
                          ],
                          rows: snapshot.data
                              .map<DataRow>(
                                (record) => DataRow(cells: [
                                  DataCell(Text(record['title'] ?? '')),
                                  DataCell(Text(record['level'] ?? '')),
                                  DataCell(Text(record['theoryHours'] ?? '')),
                                  DataCell(Text(record['labHours'] ?? '')),
                                ]),
                              )
                              .toList(),
                        ),
                      ),
                    ),
                  ),
                ],
              );
            }
          },
        ),
      ),
    );
  }
}
