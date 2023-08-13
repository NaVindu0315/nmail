import 'dart:io';

import 'package:flutter/material.dart';
import 'package:nmail/sendpage.dart';

void main() {
  runApp(MaterialApp(
    home: first(),
  ));
}

class first extends StatelessWidget {
  const first({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: sendmail(),
    );
  }
}
