import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:currentaffairsweb/navbar/navbar.dart';
import 'package:currentaffairsweb/screens/homepage.dart';
import 'package:flutter/material.dart';

class CalenderDatePicker extends StatelessWidget {
  final documentList;

  CalenderDatePicker(this.documentList);

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
                  return DesktopCalenderDatePicker(documentList);
                } else if (constraints.maxWidth < 1200) {
                  return TabCalenderDatePicker(documentList);
                } else {
                  return Container();
                }
              }),
            ),
          ],
        ),
      ),
    );
  }
}

class DesktopCalenderDatePicker extends StatelessWidget {
  final documentList;

  DesktopCalenderDatePicker(this.documentList);
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
                        child: Container(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: FittedBox(
                              fit: BoxFit.fitWidth,
                              child: Text(
                                'LATEST',
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ),
                        onPressed: () => Navigator.push(context,
                            MaterialPageRoute(builder: (context) => Home())),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      MaterialButton(
                        color: Colors.blue.shade900,
                        hoverColor: Colors.blue,
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
                        onPressed: () => Navigator.pop(context),
                      ),
                    ],
                  )
                ],
              ),
            )),
        Expanded(
          flex: 9,
          child: StreamBuilder(
              stream:
                  FirebaseFirestore.instance.collection("daywise").snapshots(),
              builder: (context, snapshot) {
                return ListView(
                  children: <Widget>[
                    Center(
                      child: Text(
                        documentList['date'],
                        style: TextStyle(
                          fontSize: 50,
                          // color: Colors.white60,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Divider(
                      thickness: 3,
                    ),
                    HeadandReadDesktop('0', snapshot, context, documentList),
                    HeadandReadDesktop('1', snapshot, context, documentList),
                    HeadandReadDesktop('2', snapshot, context, documentList),
                    HeadandReadDesktop('3', snapshot, context, documentList),
                    HeadandReadDesktop('4', snapshot, context, documentList),
                    HeadandReadDesktop('5', snapshot, context, documentList),
                    HeadandReadDesktop('6', snapshot, context, documentList),
                    HeadandReadDesktop('7', snapshot, context, documentList),
                    HeadandReadDesktop('8', snapshot, context, documentList),
                    HeadandReadDesktop('9', snapshot, context, documentList),
                  ],
                );
              }),
        ),
      ],
    );
  }
}

class TabCalenderDatePicker extends StatelessWidget {
  final documentList;

  TabCalenderDatePicker(this.documentList);
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
                        child: Container(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              'LATEST',
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                        onPressed: () => Navigator.push(context,
                            MaterialPageRoute(builder: (context) => Home())),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      MaterialButton(
                        color: Colors.blue.shade900,
                        hoverColor: Colors.blue,
                        child: Container(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              'DAYWISE',
                              style:
                                  TextStyle(fontSize: 20, color: Colors.white),
                            ),
                          ),
                        ),
                        onPressed: () => Navigator.pop(context),
                      ),
                    ],
                  )
                ],
              ),
            )),
        Expanded(
          flex: 9,
          child: StreamBuilder(
              stream:
                  FirebaseFirestore.instance.collection("daywise").snapshots(),
              builder: (context, snapshot) {
                return ListView(
                  children: <Widget>[
                    Center(
                      child: Text(
                        documentList['date'],
                        style: TextStyle(
                          fontSize: 50,
                          // color: Colors.white60,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Divider(
                      thickness: 3,
                    ),
                    HeadandReadTablet('0', snapshot, context, documentList),
                    HeadandReadTablet('1', snapshot, context, documentList),
                    HeadandReadTablet('2', snapshot, context, documentList),
                    HeadandReadTablet('3', snapshot, context, documentList),
                    HeadandReadTablet('4', snapshot, context, documentList),
                    HeadandReadTablet('5', snapshot, context, documentList),
                    HeadandReadTablet('6', snapshot, context, documentList),
                    HeadandReadTablet('7', snapshot, context, documentList),
                    HeadandReadTablet('8', snapshot, context, documentList),
                    HeadandReadTablet('9', snapshot, context, documentList),
                  ],
                );
              }),
        ),
      ],
    );
  }
}

HeadandReadDesktop(String number, snapshot, context, documentList) {
  return Column(
    children: <Widget>[
      Text(
        documentList['head$number'] == '' ? '' : documentList['head$number'],
        style: TextStyle(
            fontSize: 40,
            color: Color(0xffed1d24),
            fontWeight: FontWeight.bold),
      ),
      documentList['head$number'] == ''
          ? SizedBox(
              height: 0,
            )
          : SizedBox(
              height: 20,
            ),
      Text(
        textStyling(documentList['read$number'].toString()),
        style: TextStyle(fontStyle: FontStyle.italic, fontSize: 25),
      ),
      documentList['head$number'] == ''
          ? SizedBox(
              height: 0,
            )
          : SizedBox(
              height: 20,
            ),
      documentList['head$number'] == ''
          ? SizedBox(
              height: 0,
            )
          : Divider(
              thickness: 1,
            ),
    ],
  );
}

HeadandReadTablet(String number, snapshot, context, documentList) {
  return Column(
    children: <Widget>[
      Text(
        documentList['head$number'] == '' ? '' : documentList['head$number'],
        style: TextStyle(
            fontSize: 20,
            color: Color(0xffed1d24),
            fontWeight: FontWeight.bold),
      ),
      documentList['head$number'] == ''
          ? SizedBox(
              height: 0,
            )
          : SizedBox(
              height: 10,
            ),
      Text(
        textStyling(documentList['read$number'].toString()),
        style: TextStyle(fontStyle: FontStyle.italic, fontSize: 15),
      ),
      documentList['head$number'] == ''
          ? SizedBox(
              height: 0,
            )
          : SizedBox(
              height: 10,
            ),
      documentList['head$number'] == ''
          ? SizedBox(
              height: 0,
            )
          : Divider(
              thickness: 1,
            ),
    ],
  );
}

textStyling(para) {
  var asd;

  asd = para;

  asd = asd.replaceAll('➤', '\n➤ ');
  return asd;
}
