import 'package:flutter/material.dart';

showAlertDialog(
    {BuildContext context, Function onPressed, String title, String content}) {
  return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title ?? ""),
          content: Text(content ?? ""),
          actions: [
            TextButton(
              onPressed: onPressed,
              child: Text('Continue'),
            ),
          ],
        );
      });
}
