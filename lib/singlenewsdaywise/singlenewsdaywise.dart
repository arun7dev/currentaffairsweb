import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:currentaffairsweb/daywise/daywise.dart';
import 'package:currentaffairsweb/latest/latest.dart';
import 'package:currentaffairsweb/navbar/navbar.dart';
import 'package:currentaffairsweb/screens/homepage.dart';
import 'package:flutter/material.dart';

class SingleNewsDaywise extends StatefulWidget {
  final head;
  final read;
  SingleNewsDaywise({this.head, this.read});
  @override
  _SingleNewsDaywiseState createState() => _SingleNewsDaywiseState();
}

class _SingleNewsDaywiseState extends State<SingleNewsDaywise> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(flex: 1, child: Navbar()),
            Expanded(
              flex: 9,
              child: LayoutBuilder(builder: (context, constraints) {
                if (constraints.maxWidth > 1200) {
                  return Desktopsinglenewsdaywise(widget.head, widget.read);
                } else if (constraints.maxWidth < 1200 &&
                    constraints.maxWidth > 900) {
                  return Tabdaysinglenewsdaywise(widget.head, widget.read);
                } else {
                  return Mobiledasinglenewsdaywise(widget.head, widget.read);
                }
              }),
            ),
          ],
        ),
      ),
    );
  }
}

class Desktopsinglenewsdaywise extends StatelessWidget {
  final head;
  final read;
  Desktopsinglenewsdaywise(this.head, this.read);
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListView(
                physics: NeverScrollableScrollPhysics(),
                children: [
                  Column(
                    children: [
                      MaterialButton(
                        color: Colors.blue.shade900,
                        hoverColor: Colors.blue,
                        onPressed: () => Navigator.push(context,
                            MaterialPageRoute(builder: (context) => Home())),
                        child: Container(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: FittedBox(
                              fit: BoxFit.fitWidth,
                              child: Text(
                                'LATEST',
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      MaterialButton(
                        color: Colors.blue.shade900,
                        hoverColor: Colors.blue,
                        onPressed: () => Navigator.push(context,
                            MaterialPageRoute(builder: (context) => Daywise())),
                        child: Container(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: FittedBox(
                              fit: BoxFit.fitWidth,
                              child: Text(
                                'DAYWISE',
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            )),
        Expanded(
            flex: 9,
            child: ListView(
              children: [
                Text(
                  head,
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
                Text(
                  textStyling(read),
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.normal),
                ),
              ],
            )),
      ],
    );
  }
}

class Tabdaysinglenewsdaywise extends StatelessWidget {
  final head;
  final read;
  Tabdaysinglenewsdaywise(this.head, this.read);
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListView(
                physics: NeverScrollableScrollPhysics(),
                children: [
                  Column(
                    children: [
                      MaterialButton(
                        color: Colors.blue.shade900,
                        hoverColor: Colors.blue,
                        onPressed: () => Navigator.push(context,
                            MaterialPageRoute(builder: (context) => Home())),
                        child: Container(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: FittedBox(
                              fit: BoxFit.fitWidth,
                              child: Text(
                                'LATEST',
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      MaterialButton(
                        color: Colors.blue.shade900,
                        hoverColor: Colors.blue,
                        onPressed: () => Navigator.push(context,
                            MaterialPageRoute(builder: (context) => Daywise())),
                        child: Container(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: FittedBox(
                              fit: BoxFit.fitWidth,
                              child: Text(
                                'DAYWISE',
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            )),
        Expanded(
            flex: 9,
            child: ListView(
              children: [
                Text(
                  head,
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
                Text(
                  textStyling(read),
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.normal),
                ),
              ],
            )),
      ],
    );
  }
}

class Mobiledasinglenewsdaywise extends StatelessWidget {
  final head;
  final read;
  Mobiledasinglenewsdaywise(this.head, this.read);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListView(
                physics: NeverScrollableScrollPhysics(),
                children: [
                  Row(
                    children: [
                      MaterialButton(
                        color: Colors.blue.shade900,
                        hoverColor: Colors.blue,
                        onPressed: () => Navigator.push(context,
                            MaterialPageRoute(builder: (context) => Home())),
                        child: Container(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: FittedBox(
                              fit: BoxFit.fitWidth,
                              child: Text(
                                'LATEST',
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      MaterialButton(
                        color: Colors.blue.shade900,
                        hoverColor: Colors.blue,
                        onPressed: () => Navigator.push(context,
                            MaterialPageRoute(builder: (context) => Daywise())),
                        child: Container(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: FittedBox(
                              fit: BoxFit.fitWidth,
                              child: Text(
                                'DAYWISE',
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            )),
        Expanded(
            flex: 9,
            child: ListView(
              children: [
                Text(
                  head,
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
                Text(
                  textStyling(read),
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.normal),
                ),
              ],
            )),
      ],
    );
  }
}

textStyling(para) {
  var asd;

  asd = para;

  asd = asd.replaceAll('➤', '\n➤ ');
  return asd;
}
