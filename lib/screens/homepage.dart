import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:currentaffairsweb/latest/latest.dart';
import 'package:currentaffairsweb/navbar/navbar.dart';
import 'package:flutter/material.dart';


final _firestore = FirebaseFirestore.instance;

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(flex: 1, child: Navbar()),
            Expanded(flex: 9, child: Latest()),
          ],
        ),
      ),
    );
  }
}
