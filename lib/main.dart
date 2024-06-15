import 'package:flutter/material.dart';
import 'package:helloworld/views/home_page.dart';
import 'package:helloworld/views/login_page.dart';

main() {
  runApp(
    MaterialApp(
      theme: ThemeData(
        useMaterial3: false
      ),
      home: LoginPage(),
      debugShowCheckedModeBanner: false,
    ),
  );
}
