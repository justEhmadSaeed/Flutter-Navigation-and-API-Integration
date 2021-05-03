import 'package:flutter/material.dart';
import 'package:web_api_integration/constants.dart';

class AddSubject extends StatefulWidget {
  @override
  _AddSubjectState createState() => _AddSubjectState();
}

class _AddSubjectState extends State<AddSubject> {
  final titleController = TextEditingController();

  String levelController = 'Bachelors';

  final theoryHrsController = TextEditingController();

  final labHrsController = TextEditingController();

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
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            Flexible(
              child: TextField(
                style: kAddSubjectTextStyle,
                controller: titleController,
                decoration: InputDecoration(labelText: 'Subject Title'),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  'Level:',
                  style: kAddSubjectTextStyle,
                ),
                SizedBox(
                  width: 30,
                ),
                Flexible(
                  child: DropdownButton(
                    value: levelController,
                    items: ['Materic', 'FSc', 'Bachelors', 'Masters', 'PhD']
                        .map(
                          (e) => DropdownMenuItem(
                            child: Text(e),
                            value: e,
                          ),
                        )
                        .toList(),
                    isExpanded: true,
                    style: kAddSubjectTextStyle,
                    onChanged: (String value) {
                      setState(() {
                        levelController = value;
                      });
                    },
                    underline: Container(
                      height: 2,
                      color: Colors.teal,
                    ),
                  ),
                ),
              ],
            ),
            Flexible(
              child: TextField(
                style: kAddSubjectTextStyle,
                controller: theoryHrsController,
                decoration: InputDecoration(labelText: 'Theory Hours'),
              ),
            ),
            Flexible(
              child: TextField(
                style: kAddSubjectTextStyle,
                controller: labHrsController,
                decoration: InputDecoration(labelText: 'Lab Hours'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15),
              child: ElevatedButton(
                onPressed: () {},
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.add),
                      Text(
                        'Add Subject',
                        style: kAddSubjectTextStyle,
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
