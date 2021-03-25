import 'dart:html';

import 'package:currentaffairsweb/about%20and%20contact%20us/about.dart';
import 'package:currentaffairsweb/about%20and%20contact%20us/contact.dart';
import 'package:currentaffairsweb/latest/latest.dart';
import 'package:currentaffairsweb/screens/homepage.dart';
import 'package:flutter/material.dart';

class Navbar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      if (constraints.maxWidth > 1200) {
        return DesktopNavBar();
      } else if (constraints.maxWidth < 1200 && constraints.maxWidth > 800) {
        return TabNavBar();
      } else {
        return MobileNavBar();
      }
    });
  }
}

class DesktopNavBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        height: 100,
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: [
                Color.fromRGBO(31, 50, 107, 1),
                Color.fromRGBO(0, 0, 0, 1),
              ]),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 200),
          child: Container(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    MaterialButton(
                      child: Text(
                        'Aspirants Current Affairs',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 30,
                            color: Colors.white),
                      ),
                      onPressed: () => Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (context) => Home())),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        MaterialButton(
                          child: Text(
                            'About US',
                            style: TextStyle(color: Colors.white),
                          ),
                          onPressed: () => Navigator.push(context,
                              MaterialPageRoute(builder: (context) => About())),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        MaterialButton(
                          child: Text(
                            'Contact US',
                            style: TextStyle(color: Colors.white),
                          ),
                          onPressed: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Contact())),
                        )
                      ],
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class TabNavBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: [
              Color.fromRGBO(31, 50, 107, 1),
              Color.fromRGBO(0, 0, 0, 1),
            ]),
      ),
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 100),
          child: Container(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    MaterialButton(
                      child: Text(
                        'Aspirants Current Affairs',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 30,
                            color: Colors.white),
                      ),
                      onPressed: () => Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (context) => Home())),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        MaterialButton(
                          child: Text(
                            'About US',
                            style: TextStyle(color: Colors.white),
                          ),
                          onPressed: () => Navigator.push(context,
                              MaterialPageRoute(builder: (context) => About())),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        MaterialButton(
                          child: Text(
                            'Contact US',
                            style: TextStyle(color: Colors.white),
                          ),
                          onPressed: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Contact())),
                        )
                      ],
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class MobileNavBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: [
              Color.fromRGBO(31, 50, 107, 1),
              Color.fromRGBO(0, 0, 0, 1),
            ]),
      ),
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    MaterialButton(
                      child: Text(
                        'Aspirants Current Affairs',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Colors.white),
                      ),
                      onPressed: () => Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (context) => Home())),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    MaterialButton(
                      child: Text(
                        'About US',
                        style: TextStyle(color: Colors.white),
                      ),
                      onPressed: () => Navigator.push(context,
                          MaterialPageRoute(builder: (context) => About())),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    MaterialButton(
                      child: Text(
                        'Contact US',
                        style: TextStyle(color: Colors.white),
                      ),
                      onPressed: () => Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Contact())),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
