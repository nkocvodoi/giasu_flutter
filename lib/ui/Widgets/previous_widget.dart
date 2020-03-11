import 'package:flutter/material.dart';

Widget buildPreviousButton(){
  return Builder(
    builder: (BuildContext context) {
      return IconButton(
          icon: Image.asset('assets/previous.png',
            scale: 2.5,
          ),
          onPressed: () => Navigator.pop(context)
      );
    },
  );
}