import 'package:flutter/material.dart';
import 'package:web_api_integration/DrawerHeader.dart';
import 'package:web_api_integration/constants.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ViewSubjects extends StatelessWidget {
  Future fetchSubjects() async {
    var response = await http.get(fetchApiURI);
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
        actions: [
          IconButton(
              icon: Icon(Icons.add),
              onPressed: () {
                Navigator.popAndPushNamed(context, '/add-subject');
              }),
          IconButton(
              icon: Icon(Icons.home),
              onPressed: () {
                Navigator.popUntil(context, ModalRoute.withName('/'));
              })
        ],
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
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(children: [
          Hero(
            tag: 'logo',
            child: Image(
              image: AssetImage(
                'assets/logo.png',
              ),
              width: 150,
            ),
          ),
          FutureBuilder(
            future: fetchSubjects(),
            builder: (BuildContext _, AsyncSnapshot snapshot) {
              if (!snapshot.hasData) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              } else {
                List filteredList = snapshot.data
                    .where((item) => (item['title'] != ''))
                    .toList();
                return Expanded(
                  child: ListView(children: [
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: DataTable(
                        showBottomBorder: true,
                        // columnSpacing: 100,
                        columns: [
                          DataColumn(label: Text('Title')),
                          DataColumn(label: Text('Level')),
                          DataColumn(label: Text('Theory Hrs')),
                          DataColumn(label: Text('Lab Hrs')),
                        ],
                        rows: filteredList
                            .map<DataRow>(
                              (record) => DataRow(cells: [
                                DataCell(Text(record['title'] ?? '___')),
                                DataCell(Text(record['level'] ?? '___')),
                                DataCell(Text(record['theoryHours'] ?? '___')),
                                DataCell(Text(record['labHours'] ?? '___')),
                              ]),
                            )
                            .toList(),
                      ),
                    ),
                  ]),
                );
              }
            },
          )
        ]),
      ),
    );
  }
}
