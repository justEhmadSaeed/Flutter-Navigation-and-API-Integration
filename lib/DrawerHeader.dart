import 'package:flutter/material.dart';

final kDrawerHeader = DrawerHeader(
  child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      CircleAvatar(
        radius: 40,
        backgroundColor: Colors.blueAccent,
        backgroundImage: AssetImage('assets/profile-pic.jpg'),
      ),
      SizedBox(
        height: 15,
      ),
      Text(
        'Ehmad Saeed',
        style: TextStyle(color: Colors.white, fontSize: 15),
      ),
      Text(
        'justehmadsaeed@gmail.com',
        style: TextStyle(color: Colors.white, fontSize: 15),
      ),
    ],
  ),
  decoration: BoxDecoration(color: Colors.teal[800]),
);
